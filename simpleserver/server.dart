import 'dart:io';//服务器端用的包
final HOST = "127.0.0.1"; // eg: localhost（主机名）
final PORT = 8080;//6w以下可以随便换端口
final DATA_FILE = "data.json";//数据文件的名字
void main() {
  HttpServer.bind(HOST, PORT).then((server) {//地址和端口进入，启动服务，开始无限循环
    server.listen((HttpRequest request) {
          switch(request.method){
            case "GET":
              handleGet(request);
              break;
          }
 });
  });
}
void handleGet(HttpRequest req) {
  HttpResponse res = req.response;
  print("${req.method}: ${req.uri.path}");
  addCorsHeaders(res);
  var file = new File(DATA_FILE);
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

void addCorsHeaders(HttpResponse res) {//涉及安全，基本不变，直接用就好
  res.headers.add("Access-Control-Allow-Origin", "*");
  res.headers.add("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
  res.headers.add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
}