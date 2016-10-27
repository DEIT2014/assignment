
import 'dart:io';
import 'dart:async';

/* A simple web server that responds to **ALL** GET requests by returning
 * the contents of data.json file, and responds to ALL **POST** requests
 * by overwriting the contents of the data.json file
 *
 * Browse to it using http://localhost:0923
 *
 * Provides CORS headers, so can be accessed from any other page
 */

final HOST = "127.0.0.1"; // eg: localhost
final PORT = 0923;
final DATA_FILE = "callingDATA.json";

void main() {
  HttpServer.bind(HOST, PORT).then((server) {//这一行，可以调试，放在这里server表示准备好了.bind是静态方法，API中httpserver中找then（server），就是前面的server
    server.listen((HttpRequest request) {//有人打开该网页了，就开始做事情
      switch (request.method) {
        case "GET":
          handleGet(request);//自定义的，handleget是一个名字，可以自己定义，request是数据
          break;//关键字，自己去查是什么意思
        case "POST":
          handlePost(request);
          break;
        case "OPTIONS":
          handleOptions(request);
          break;
        default: defaultHandler(request);
      }
    },
        onError: printError);//出错了怎么办

    print("Listening for GET on http://$HOST:$PORT");
  },
      onError: printError);//如果出错
}

/**
 * Handle GET requests by reading the contents of data.json
 * and returning it to the client
 */
void handleGet(HttpRequest req) {
  HttpResponse res = req.response;//先把数据拿下来
  print("${req.method}: ${req.uri.path}");//这一行不要也没事
  addCorsHeaders(res);//浏览器的安全保护策略
  var file = new File(DATA_FILE);//file
  if (file.existsSync()) {//要把json文件放在现在目录下，如果与main并列则找不到json文件
    res.headers.add(HttpHeaders.CONTENT_TYPE, "application/json");////headers就像信封表面的东西，告诉传送的是一个json格式的东西，还有body，就是信封里面的东西、、把这个数据当做json的文本文件数据，在浏览器中输出，不要下载下来.内容类型是json格式，add中（name，value）
    file.readAsBytes().asStream().pipe(res);// automatically close output stream、、用bytes方式显示出来，用asStream流的方法传送出去，一个方法套一个方法，pipe是管道，
    //stuname.学号;
  }
  else {
    var err = "Could not find file: $DATA_FILE";//文件不存在
    res.addError(err);//?
    res.close();
  }

}
/**
 * Handle POST requests by overwriting the contents of data.json
 * Return the same set of data back to the client.
 */
void handlePost(HttpRequest req) {//先把数据拿下来
  HttpResponse res = req.response;//
  print("${req.method}: ${req.uri.path}");//这一行不要也没事
  addCorsHeaders(res);//浏览器的安全保护策略

  req.listen((List<int> buffer) {
    var file = new File(DATA_FILE);
    var ioSink = file.openWrite(); // save the data to the file
    ioSink.add(buffer);
    ioSink.close();

    // return the same results back to the client
    res.add(buffer);
    res.close();
  },
      onError: printError);
}

/**
 * Add Cross-site headers to enable accessing this server from pages
 * not served by this server
 *
 * See: http://www.html5rocks.com/en/tutorials/cors/
 * and http://enable-cors.org/server.html
 */
void addCorsHeaders(HttpResponse res) {
  res.headers.add("Access-Control-Allow-Origin", "*");//可以直接用，涉及安全问题，解除限制
  res.headers.add("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
  res.headers.add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
}

void handleOptions(HttpRequest req) {
  HttpResponse res = req.response;
  addCorsHeaders(res);
  print("${req.method}: ${req.uri.path}");
  res.statusCode = HttpStatus.NO_CONTENT;
  res.close();
}

void defaultHandler(HttpRequest req) {
  HttpResponse res = req.response;
  addCorsHeaders(res);
  res.statusCode = HttpStatus.NOT_FOUND;
  res.addError("Not found: ${req.method}, ${req.uri.path}");
  res.close();
}

void printError(error) => print(error);