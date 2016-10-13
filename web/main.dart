// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import'dart:io';
import 'package:args/args.dart';
import 'dart:html';
import'dart:math';
var keepname =new List<int>();//要移出来不能放在generate函数当中，不然每次都生成keepname数组，数组中永远无法保存已经抽选过的num函数
var name= {
  0 : '温顾顾',
  1 :'秦泱泱',
  2 :'沈晋',
  3 :'秦央',
  4 :'沈彻',
  5 :'纪澄',
  6 :'荣旋',
  7 :'潘晨煜',
  8 :'刘雯君',
  9:'王源',
};
void main() {
  //querySelector('#output').text = '随机点名程序';
  querySelector('#create_number').onClick.listen(generate);
}
void generate(MouseEvent e){
  var randomVar=new Random( ); //引用一个random的类
  var num=randomVar.nextInt(10);  //从10的范围中生成一个随机数,从0开始
  if(keepname.length>10){
    querySelector('#showme').text='本轮点名已结束，点击按钮进入新一轮点名';
    keepname.clear();
  }
  else{
    if(keepname.indexOf(num) == 0){//此语句判断num是否在数组中
      querySelector('#showme').text='此学生本轮已点过，请再次操作';
    }
    else{
      keepname.add(num);
      querySelector('#showme').text=name[num];
    }
  }
}
