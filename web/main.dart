// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'dart:convert';
import 'dart:html';
import'dart:math';
import 'packages/json_object/json_object.dart';

var host = "127.0.0.1:8080";
var keepname =new List<int>();//要移出来不能放在generate函数当中，不然每次都生成keepname数组，数组中永远无法保存已经抽选过的num函数
var name=new Map();

 void main() {
  querySelector("#load").onClick.listen(loadData);//打横线意味着此API时老的但不建议用，可改为queryslecter|按按钮下载数据，在服务器中属于get
  querySelector("#loadStructured").onClick.listen(loadStructuredData);//下载数据，在服务器中属于get
  querySelector("#save").onClick.listen(saveData);//保存数据，在服务器中属于post
  querySelector('#create_number').onClick.listen(generate); //querySelector('#output').text = '随机点名程序';
}

void loadData(_) {
  print("Loading data");
  var url = "http://$host/programming-languages";//按照rest原则所有资源对应唯一的url，data.json的唯一url就是这个，有变量以后改地址容易
  // call the web server asynchronously
  var request = HttpRequest.getString(url).then(onDataLoaded);//HTML包里提交请求的方法，客户端是html包，io是服务器端的包
}
onDataLoaded(responseText) {//拿数据的函数，回调函数，之前不需要设置参数，直接用就可以了
  var jsonString = responseText;
  querySelector("#json_content").text = jsonString;
}

// Load data an interperet using json object
void loadStructuredData(_) {//结构化数据
  print("Loading structured data");
  var url = "http://$host/programming-languages";
  // call the web server asynchronously
  var request = HttpRequest.getString(url).then(onStructuredDataLoaded);
}
void onStructuredDataLoaded(responseText) {//把数据从文本转化为有结构的数据
  print(" Structured data loaded");
  var jsonString = responseText;//关于json的处理在dart convert的包里
  querySelector("#json_content").text = jsonString;

  print(" Converting to JsonObject");
  Language jsonObject = new LanguageImpl.fromJsonString(jsonString);
  querySelector("#json_content").text = jsonString;

  print("  jsonObject.language = ${jsonObject.language}");

  for (var count = 0; count < jsonObject.targets.length; count++) {
    print("  jsonObject.targets[$count] = ${jsonObject.targets[count]}");
  }

  jsonObject.website.forEach((key,value) {//重新打印出来看清楚的数据长什么样
    print("  jsonObject.website['$key'] = $value");
  });
}
void saveData(_) {
  print("Saving structured data");

  // Setup the request
  var request = new HttpRequest();
  request.onReadyStateChange.listen((_) {
    if (request.readyState == HttpRequest.DONE &&
        (request.status == 200 || request.status == 0)) {
      // data saved OK.
      print(" Data saved successfully");

      // update the UI
      var jsonString = request.responseText;
      querySelector("#json_content").text = jsonString;
    }
  });

  // Get some data to save
  var jsonString = querySelector("#json_content").text;
  Language jsonObject = new LanguageImpl.fromJsonString(jsonString);
  jsonObject.language = jsonObject.language.toUpperCase();
  jsonObject.targets.add("Android?");

  // POST the data to the server
  var url = "http://$host/programming-languages";
  request.open("POST", url, async: false);
  request.send(jsonObject);//把收到的数据处理完发出去
}

abstract class Language {//定义class是为了方便结构化地处理数据
  String language;
  List targets;
  Map website;
}
class LanguageImpl extends JsonObject implements Language {
  LanguageImpl();
  factory LanguageImpl.fromJsonString(string) {
    return new JsonObject.fromJsonString(string, new LanguageImpl());
  }

}


void generate(MouseEvent e){
  var randomVar=new Random( ); //引用一个random的类
  var num=randomVar.nextInt(10);  //从10的范围中生成一个随机数,从0开始
  if(keepname.length>10){
    querySelector('#showme').text='本轮点名已结束，点击按钮进入新一轮点名';
    keepname.clear();
  }
  else{
    if(keepname.indexOf(num) == 0){//此语句判断num是否在数组中
      querySelector('#showme').text='此学生本轮已点过，请再次操作';
    }
    else{
      keepname.add(num);
      querySelector('#showme').text=name[num];
    }
  }
}
