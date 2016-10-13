import 'dart:io';
import 'dart:async';
import 'dart:math' show Random;
var names = new List<int>();
var remain=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
var students=
{
  '0':'平安',
  '1':'张三',
  '2':'李四',
  '3':'王麻',
  '4':'赵华',
  '5':'孙悦',
  '6':'李丽',
  '7':'周涛',
  '8':'陈旭',
  '9':'朱珠',
  '10':'陈晨',
  '11':'张宇',
  '12':'李伟',
  '13':'王宁',
  '14':'兰丹',
  '15':'李斌',
  '16':'魏毅',
  '17':'韦俊',
  '18':'孙华',
  '19':'安安',
  '20':'于雷'
};
Future main() async {
  HttpServer requestServer =
  await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 4041);
  await for (var request in requestServer) {
    handleRequest(request);
  }
}
void handleRequest(HttpRequest request) {
  try {
    if (request.method == 'GET') {
      handleGet(request);
    } else {
      request.response
        ..statusCode = HttpStatus.METHOD_NOT_ALLOWED
        ..write('Unsupported request: ${request.method}.')
        ..close();
    }
  } catch (e) {
    print('Exception in handleRequest: $e');
  }
  print('Request handled.');
}
void handleGet(HttpRequest request) {
  int myNumber = new Random().nextInt(20);
   remain.remove(myNumber);
  request.response.statusCode = HttpStatus.OK;
  print("The Number is: $myNumber");
  print("The students who are already signed in:");
  print(names.toString());
  print("The students who are not signed in:");
  print(remain.toString());
  var a=names.contains(myNumber);
 if(a)
 {if(names.length<21){
   request.response
     ..writeln(students[myNumber.toString()]+"已经被点过名，请重新点名！")
     ..write("还没有被点名的同学：")
     ..write(remain.toString())
     ..close();
 }
  else
 {
   request.response
    ..write(  '您已经点过班级中所有同学的姓名，继续点击将重新开始点名！')
    ..close();
   names.clear();
 }
 }
  else
 {
   names.add(myNumber);
   request.response
     ..write(students[myNumber.toString()])
     ..close();
 }

}