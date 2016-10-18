// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'dart:html';
import 'dart:math';

var host = "127.0.0.1:8080";
var keepname = new List<int>(); //要移出来不能放在generate函数当中，不然每次都生成keepname数组，数组中永远无法保存已经抽选过的num函数
var name = new Map();

void main() {
  querySelector("#load").onClick.listen(loadData); //打横线意味着此API时老的但不建议用，可改为queryslecter|按按钮下载数据，在服务器中属于get
  querySelector('#create_number').onClick.listen(generate); //querySeector('#output').text = '随机点名程序';
}

void loadData(_) {
  var url = "http://$host/programming-languages"; //按照rest原则所有资源对应唯一的url，data.json的唯一url就是这个，有变量以后改地址容易
  var request = HttpRequest.getString(url).then(onStructuredDataLoaded); //HTML包里提交请求的方法，客户端是html包，io是服务器端的包
}

void onStructuredDataLoaded(responseText) {
  //拿数据的函数，回调函数，之前不需要设置参数，直接用就可以了
  var jsonString = responseText;
  querySelector("#json_content").text = jsonString;
  //Language jsonObject=new LanguageImpl.fromJsonString(jsonString);
  //print("jsonObject.language = ${jsonObject.language}");
  //for(var count = 0;count<jsonObject.targets.length;count++){
    //print("jsonObject.target[$count]=${jsonObject.targets[count]}");
 // }
  //jsonObject.website.forEach(key,value){
    //print("jsonObject.website['$key']=$value");
  //}
}


abstract class Language {//定义class是为了方便结构化地处理数据
  String language;
  List targets;
  Map website;
}



void generate(MouseEvent e) {
  var randomVar = new Random(); //引用一个random的类
  var num = randomVar.nextInt(10); //从10的范围中生成一个随机数,从0开始
  if (keepname.length > 10) {
    querySelector('#showme').text = '本轮点名已结束，点击按钮进入新一轮点名';
    keepname.clear();
  } else {
    if (keepname.indexOf(num) == 0) {
      //此语句判断num是否在数组中
      querySelector('#showme').text = '此学生本轮已点过，请再次操作';
    } else {
      keepname.add(num);
      querySelector('#showme').text = name[num];
    }
  }
}
