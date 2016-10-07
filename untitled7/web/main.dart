// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:math';
void main() {
  var yes=new Map();//置空map
  var no=new Map();//置空map
  querySelector('#showme').text = 'The result is..';
  querySelector('#createnewnumber').onClick.listen(generate);
}
void generate(MouseEvent e){
  var randomVar=new Random();
  var num=randomVar.nextInt(55);
  querySelector('#showme').text=num.toString();
  querySelector('#showme2').text='到了么？';
  querySelector('#yes').onClick.listen(ok);//如果到了的话 把他们列成一个map里方便课堂上对到的人进行提问
  querySelector('#no').onClick.listen(bad);//如果没有到，把没到的人列到一个map里进行记录
}
void ok(MouseEvent o){
 querySelector('#showme2').text='GOOD!';
}
void bad(MouseEvent b){
  querySelector('#showme2').text='BAD!';
}







