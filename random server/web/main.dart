// Copyright (c) 2016, wqwtsr. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'dart:html';
import 'dart:math';
import 'dart:convert'show JSON;
import 'dart:core'as core;

var host="127.0.0.1:4040";
var listA= [];
void main() {
  for (var i = 0; i < 21; i++) {
    listA.add(0);
    querySelector('#showme').text = '学号：';
    querySelector('#name').text = '姓名：';
    querySelector('#create_number').onClick.listen(loadData);
  }
}
void loadData(_){
  var url = "http://$host";
  var request = HttpRequest.getString(url).then(onDataLoaded);
}

onDataLoaded(responseText) {
  var jsonString = responseText;
  var students=JSON.decode(jsonString);
  var randomVar=new Random();
  var num=randomVar.nextInt(21);
  var studentid=students['students'];
  querySelector('#showme').text='学号：'+num.toString();
  querySelector('#name').text='姓名：'+studentid[num.toString()];
  listA[num]++;
  if (listA[num]==1)
  {querySelector('#create_number').text='未被点过'.toString();}
  else
  {querySelector('#create_number').text='已被点过'.toString();}
}

