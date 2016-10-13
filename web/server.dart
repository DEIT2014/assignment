import 'dart:io';
final HOST = "127.0.0.1"; // eg: localhost
final PORT = 8080;
final DATA_FILE = "data.json";
void main() {
  HttpServer.bind(HOST, PORT).then((server) {
    server.listen((HttpRequest request) {
      switch (request.method) {
        case "POST":
          handlePost(request);
          break;
      }
    },
        onError: printError);

    print("Listening for POST on http://$HOST:$PORT");
  },
      onError: printError);
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

void addCorsHeaders(HttpResponse res) {
  res.headers.add("Access-Control-Allow-Origin", "*");
  res.headers.add("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
  res.headers.add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
}

void printError(error) => print(error);