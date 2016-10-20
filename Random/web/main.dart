// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import'dart:math';
import 'dart:convert';
import 'dart:core';

int Number;//存放人数数据1
int Number2=0;//存放人数数据2
InputElement inputnumber;
List numlist=new List<int>();
List numlist2=new List<int>();
List IDlist=new List<String>();
Map jsonData;
var host="127.0.0.1:8070";

void main() {
  inputnumber=querySelector('#inputnumber');//获取输入框内容
  var button1=querySelector('#confirm'); //获取确认按钮
  var button2=querySelector('#start');
  var Button1=querySelector('#start2');
  var Button2=querySelector('#restart');
  button1.onClick.listen(saveinfo);//获取输出按钮
  button2.onClick.listen(random);
  Button1.onClick.listen(getName);
  Button2.onClick.listen(Restart);
  loadName();

}
void saveinfo(MouseEvent event){
  querySelector('#showme').text=null;
  querySelector('#ps').text=null;
  numlist.clear();
  Number=int.parse(inputnumber.value); //将输入框中的值转化为整形
}
void random(MouseEvent event) {
  var randomVar=new Random();
  int num=randomVar.nextInt(Number)+1;
  querySelector('#showme').text=num.toString();
  //显示提示
  if(numlist.contains(num) ) {
    querySelector('#ps').text='温馨提示：你已经在本节课点过该同学了，请重新点名！';
  }
  else{
    numlist.add(num);
    querySelector('#ps').text=null;
  }
}

void loadName(){
  var url="http://$host";

  var request=HttpRequest.getString(url).then(loadData);//创建请求并在响应时触发回调函数loadData

}
//第一部分点名程序结束

//第二部分点名程序
void loadData(responseText) {
  jsonData = JSON.decode(responseText); //将responseText中的值转化成Map，以便后面使用
  jsonData.forEach((k, v) {
    IDlist.add(k);//将学号存放到数组中
    Number2 = Number2 + 1;//记录map中有几对值，即人数
  });
}

void getName(MouseEvent event) {
  var randomVar=new Random();
  int num=randomVar.nextInt(Number2);
  String studentID=IDlist[num];//取出学号
  String stuName=jsonData["$studentID"];//取出姓名
  querySelector('#showme2').text=studentID+':'+stuName;
  //显示提醒
  if(numlist2.contains(num) ) {
    querySelector('#ps2').text='温馨提示：你已经在本节课点过该同学了，请重新点名！';
  }
  else{
    numlist2.add(num);
    querySelector('#ps2').text=null;
  }

}
void Restart(MouseEvent event){
  //重新开始按钮
  numlist2.clear();
  querySelector('#showme2').text=null;
  querySelector('#ps2').text=null;
}