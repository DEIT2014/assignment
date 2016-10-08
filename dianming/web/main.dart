// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:math';
import 'dart:core';

 var count=0; final n=20;
List<int> list = new List(n); //定义数组

void main(){
  for(var i=0;i<n;i++) {
    list[i] = 1000;
  }
  querySelector('#output').text = '点击按钮进行学号点名';
  querySelector('#create_number').onClick.listen(generate);
}
void generate(MouseEvent e)
{
    bool flag=true;
    var random=new Random();//如果填上数字，那么一直显示一个随机数，现在每点击一下，就会显示不同的随机数；
    var num=random.nextInt(n);//随机数一定小于括号的数字
    for (var i = 0; i < count; i++) {
        if (list[i] == num) {
          flag = false;
          querySelector('#showme').text = "已经点过了";
          break;
        }
      }
      if (flag == true) {
        list[count] = num;
        querySelector('#showme').text = list[count].toString();
        count++;
      }
    if(count>=n) querySelector('#show').text="点名结束！";
  //可以输出未出席学生学号
}

