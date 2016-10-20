import 'dart:io';
import 'dart:convert';
final DATA_FILE = "namelist.json";
final HOST = "127.0.0.1";
final PORT = 8080;

void main() {
  HttpServer.bind(HOST, PORT).then((server) {
    server.listen((HttpRequest request) {
      switch (request.method) {
        case "GET":
          handleGet(request);
          break;
      }
    },
        onError: printError);
    print("Listening for GET and POST on http://$HOST:$PORT");
  },
      onError: printError);
}
void printError(error) => print(error);

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
    res.addStream(err);
    res.close();
  }
}

void addCorsHeaders(HttpResponse res) {
  res.headers.add("Access-Control-Allow-Origin", "*");
  res.headers.add("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
  res.headers.add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
}
