// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

//通过访问json来显示点名的学号和姓名！！！
import 'dart:html';
import 'dart:core';
import 'dart:convert';
import 'dart:math';

var host = "127.0.0.1:8080";
var count=0; final n=20;
List<int> list = new List(n); //定义数组
 // querySelector('#create_number').onClick.listen(generate);
void main() {
  for(var i=0;i<n;i++) {
  list[i] = 1000;
}
querySelector('#output').text = '点击按钮进行点名';
  querySelector("#create_number").onClick.listen(showData);//API不建议用的,get

}

void showData(MouseEvent e) {
  print("Loading data");//其实没用
  var url = "http://$host/programming-languages";//host=127.0.0.1
  // call the web server asynchronously
  var request = HttpRequest.getString(url).then(onDataLoaded);//dart.html//ondataloaded回调函数//查看APIdart:html,get方法//url服务器地址
}

onDataLoaded(responseText) {//服务器返回的文本
  print(" Data Loaded");//其实没用
 var jsonString = responseText;
  Map jsonString1 = JSON.decode(jsonString) ; // 把response变成map形式
  bool flag=true;
  var random=new Random();//如果填上数字，那么一直显示一个随机数，现在每点击一下，就会显示不同的随机数；
  var num=random.nextInt(n);//随机数一定小于括号的数字
  for (var i = 0; i < count; i++) {
    if (list[i] == num) {
      flag = false;
      querySelector('#showme').text =jsonString1["stuname"][num]["姓名"]+"已经点过了";
      break;
    }
  }
  if (flag == true) {
    list[count] = num;
    querySelector('#showme').text = "学生姓名："+jsonString1["stuname"][num]["姓名"]+"； "+"学生学号："+jsonString1["stuname"][num]["学号"];
    //就是json中的文件
    count++;
  }
  if(count>=n) querySelector('#show').text="点名结束！";
  //for (int i = 0; i < jsonString1.length; i++) {

}

