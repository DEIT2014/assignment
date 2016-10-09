// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import'dart:math';

var temp= new List.filled(20,1);//建立一个数组用于记录

void main() {
  querySelector('#showme').text = '随机点名回答问题';
  querySelector('#create_number').onClick.listen(create);
}

void create(MouseEvent e) {

  var members= {
    0 :'余英菲',
    1 : '涂斌琴',
    2 :'张甜甜',
    3 :'战晓瑜',
    4 :'高佳平',
    5 :'池吉',
    6 :'王巍',
    7 :'石睿',
    8 :'李皓帧',
    9 :'龚馨懿',
    10:'王海佳',
    11:'何欣语',
    12:'申晓琳',
    13:'王冰倩',
    14:'姜慧敏',
    15:'吴怡雯',
    16:'杜谦',
    17:'李志伟',
    18:'张红燕',
    19:'鲁梁秀',
    20:'陈婧',

  };

  var random = new Random();
  var num = random.nextInt(21);


  if (temp[num]==1) {
    temp[num]="";
    querySelector('#showme').text = members[num];
  }
  else{
    querySelector('#showme').text ="抱歉！"+members[num].toString()+"已点过，请重新操作";
}
  while(temp.isEmpty()) {
    querySelector('#showme').text ="全部成员已点过，请进行新一轮操作！";
    querySelector('#create_number').text ="重新操作";
    temp.forEach((element) =>element=1);
  }
 }

