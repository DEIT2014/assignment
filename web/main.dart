// Copyright (c) 2016, wqwtsr. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:math';
final n=20;
List<int> listA = new List(n);

main() {
  for(var i=0;i<n;i++) {
    listA[i] = 0;
  }
  querySelector('#showme').text = '学号：';
  querySelector('#name').text = '姓名：';
  querySelector('#create_number').onClick.listen(generate);

}

void generate(MouseEvent a){
  var students=
  {
    '0':'杨洋',
    '1':'郑爽',
    '2':'李易峰',
    '3':'周迅',
    '4':'刘涛',
    '5':'白百何',
    '6':'赵丽颖',
    '7':'陆毅',
    '8':'杨颖',
    '9':'邓超',
    '10':'陈赫',
    '11':'李晨',
    '12':'孙俪',
    '13':'张继科',
    '14':'马龙',
    '15':'范冰冰',
    '16':'宋茜',
    '17':'池昌旭',
    '18':'杨幂',
    '19':'刘亦菲',
    '20':'唐嫣'
  };

  var randomVar=new Random();
  int num=randomVar.nextInt(20);
  querySelector('#showme').text='学号：'+num.toString();
  querySelector('#name').text='姓名:'+students[num.toString()];
  listA[num]++;
  if (listA[num]==1)
  {querySelector('#create_number').text='未被点过'.toString();}
  else
  {querySelector('#create_number').text='已被点过'.toString();}
}