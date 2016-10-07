// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import'dart:math';

void main() {
  //querySelector('#output').text = '随机点名程序';
  querySelector('#create_number').onClick.listen(generate);
}
void generate(MouseEvent e){
  //生成random数
  var randomVar=new Random( );
  var num=randomVar.nextInt(10);
  //把数字显示出来
  var name= {
    1 : '温顾顾',
    2 :'秦泱泱',
    3 :'沈晋',
    4 :'秦央',
    5 :'沈彻',
    6 :'纪澄',
    7 :'荣旋',
    8 :'潘晨煜',
    9 :'刘雯君',
    10:'王源',
  };
  querySelector('#showme').text=name[num];
  //num.toString();//text里只能接受字符串
  name[num] == null;
}
