// Copyright (c) 2016, icecreamtoo. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/*import 'dart:html';
import 'dart:math';
  void main() {
  querySelector('#output').text = '随机数系统';
  querySelector('#create_number').onClick.listen(generate);
}
void generate(MouseEvent e)
{
  var random=new Random();//如果填上数字，那么一直显示一个随机数，现在每点击一下，就会显示不同的随机数；
  var num=random.nextInt(21);
  var students=
  {
    '0':'战暁瑜',
    '1':'陈婧',
    '2':'张甜甜',
    '3':'涂斌琴',
    '4':'姜慧敏',
    '5':'石睿',
    '6':'王巍',
    '7':'鲁梁秀',
    '8':'高佳平',
    '9':'池吉',
    '10':'李志伟',
    '11':'吴怡雯',
    '12':'杜谦',
    '13':'张红燕',
    '14':'龚馨懿',
    '15':'王海佳',
    '16':'何欣语',
    '17':'李皓帧',
    '18':'余英菲',
    '19':'申晓琳',
    '20':'王冰倩'
  };
  querySelector('#showme').text=students(num);
}*/
//通过访问json来显示点名的学号和姓名！！！
import 'dart:core';
import 'dart:html';
import  'dart:convert';
import 'dart:core' as core;

var host = "127.0.0.1:0923";

void main() {
  querySelector("#create_number").onClick.listen(loadData);//点击下载数据，从服务器、、get
  //querySelector("#loadStructured").onClick.listen(loadStructuredData);//get
  //querySelector("#save").onClick.listen(saveData);//put
}

void loadData(_) {
  //print("Loading data");
  var url = "http://$host/programming-languages";//在这个服务器里面，表示data.json的唯一地址 $host,在上面有，字符串，以后方便修改

  // call the web server asynchronously
  var request = HttpRequest.getString(url).then(onDataLoaded);//dart.html//ondataloaded回调函数//查看APIdart:html,get方法//url服务器地址
}//本句请求完成，就会返回responseText，在下一句中直接出现。

onDataLoaded(responseText) {//服务器返回的文本，在服务器里面有个桶，里面的东西，回调函数（直接写进去，就有这个数据了）
  //print(" Data Loaded");//可以不要
  var jsonString = responseText;//拿到数据
  var students=jsonString;
  //不会做：需要讲jsonString中的东西，写成数字和姓名对应的列表，不会写。完成一个students（num）
  querySelector('#create_number').onClick.listen(generate);
  void generate(MouseEvent e)
  {
    var random=new Random();//如果填上数字，那么一直显示一个随机数，现在每点击一下，就会显示不同的随机数；
    var num;
    num = random.nextInt();
    querySelector('#showme').text=students(num);

  }

   }




