// Copyright (c) 2016, wqwtsr. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'dart:html';
import 'dart:math';
import 'dart:convert';
import 'dart:core'as core;

var host="127.0.0.1:4040";
var listA= new List;
main() {
  for (var i = 0; i < 21; i++) {
    listA.add(0);
    querySelector('#showme').text = '学号：';
    querySelector('#name').text = '姓名：';
    querySelector('#create_number').onClick.listen(generate);
  }
}
void generate(_){
  var url="http://$host";
  var request = HttpRequest.getString(url).then(onDataLoaded);
}

 onDataLoaded(responseText) {
    var jsonString = responseText;
    var students=jsonString;
    querySelector("#create_number").text = jsonString;
    var httpRequest = new HttpRequest();
  var randomVar=new Random();
  var num=randomVar.nextInt(20);
  querySelector('#showme').text='学号：'+num.toString();
  querySelector('#name').text='姓名:'+students[num.toString()];
listA[num]++;
if (listA[num]==1)
{querySelector('#create_number').text='未被点过'.toString();}
else
{querySelector('#create_number').text='已被点过'.toString();}
}

