// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import'dart:math';
int Number;
InputElement inputnumber;
List numlist=new List<int>();
void main() {
  inputnumber=querySelector('#inputnumber');//获取输入框内容
  var button1=querySelector('#confirm'); //获取确认按钮
  button1.onClick.listen(saveinfo);
  var button2=querySelector('#start'); //获取输出按钮
  button2.onClick.listen(random);
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
  //显示提示与否
  if(numlist.contains(num) ) {
    querySelector('#ps').text='温馨提示：你已经在本节课点过该同学了，请重新点名！';
  }
  else{
    numlist.add(num);
    querySelector('#ps').text=null;
  }
}
