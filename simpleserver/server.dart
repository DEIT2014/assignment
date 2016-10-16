import 'dart:io';//服务器端用的包
final HOST = "127.0.0.1"; // eg: localhost（主机名）
final PORT = 8080;//6w以下可以随便换端口
final DATA_FILE = "data.json";//数据文件的名字
void main() {
  HttpServer.bind(HOST, PORT).then((server) {//地址和端口进入，启动服务，开始无限循环
    server.listen((HttpRequest request) {
      switch (request.method) {
        case "GET"://拿到服务器中存折的数据
          handleGet(request);
          break;//跳出循环
        case "POST"://建立新数据
          handlePost(request);
          break;
        case "OPTIONS":
          handleOptions(request);
          break;
        default: defaultHandler(request);//什么方法都没有怎么办
      }
    },
        onError: printError);//出错了应该怎么办

    print("Listening for GET and POST on http://$HOST:$PORT");
  },
      onError: printError);
}

/**
 * Handle GET requests by reading the contents of data.json
 * and returning it to the client
 */
void handleGet(HttpRequest req) {
  HttpResponse res = req.response;
  print("${req.method}: ${req.uri.path}");
  addCorsHeaders(res);//浏览器安全保护策略，很重要

  var file = new File(DATA_FILE);//创建一个新文件
  if (file.existsSync()) {//打开此文件看它是否存在，存在即进行以下操作
    res.headers.add(HttpHeaders.CONTENT_TYPE, "application/json");//不写可能直接下载此文件了，高显速浏览器是要作为json的文本示
    file.readAsBytes().asStream().pipe(res); // automatically close output stream//pipe管道，response是用户向服务器递交的一个请求，就像一个箱子，经过处理后，再作为一个箱子送回客户端
  }
  else {
    var err = "Could not find file: $DATA_FILE";//文件不存在的处理方式
    res.write(err);//.addString(err);
    res.close();
  }

}

/**
 * Handle POST requests by overwriting the contents of data.json
 * Return the same set of data back to the client.
 */
void handlePost(HttpRequest req) {
  HttpResponse res = req.response;
  print("${req.method}: ${req.uri.path}");
  addCorsHeaders(res);

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
void addCorsHeaders(HttpResponse res) {//涉及安全，基本不变，直接用就好
  res.headers.add("Access-Control-Allow-Origin", "*");
  res.headers.add("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
  res.headers.add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
}

void handleOptions(HttpRequest req) {//基本不处理
  HttpResponse res = req.response;
  addCorsHeaders(res);
  print("${req.method}: ${req.uri.path}");
  res.statusCode = HttpStatus.NO_CONTENT;
  res.close();
}

void defaultHandler(HttpRequest req) {//设呢方法都没有怎么处理
  HttpResponse res = req.response;
  addCorsHeaders(res);
  res.statusCode = HttpStatus.NOT_FOUND;
  //res.addString("Not found: ${req.method}, ${req.uri.path}");
  res.close();
}

void printError(error) => print(error);//错误处理方法