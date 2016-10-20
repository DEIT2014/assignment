import 'dart:io'; //服务器端用的包
import 'dart:core';
final HOST = "127.0.0.1"; // eg: localhost（主机名）
final PORT = 8080; //6w以下可以随便换端口
final DATA_FILE="data.json";
void main() {
  HttpServer.bind(HOST, PORT).then((server) {
    //地址和端口进入，启动服务，开始无限循环
    server.listen((HttpRequest request) {
      switch (request.method) {
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
  if (file.existsSync()) {
    res.headers.add(HttpHeaders.CONTENT_TYPE, "application/json");
    file.readAsBytes().asStream().pipe(res); // automatically close output stream
  }
  else {
    var err = "Could not find file: $DATA_FILE";
    res.write(err);
    res.close();
  }
}


void addCorsHeaders(HttpResponse res) {
  //涉及安全，基本不变，直接用就好
  res.headers.add("Access-Control-Allow-Origin", "*");
  res.headers.add("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
  res.headers.add("Access-Control-Allow-Headers",
      "Origin, X-Requested-With, Content-Type, Accept");
}
