// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import'dart:math';

void main() {
  querySelector('#showme').text = '随机点名回答问题.';
  querySelector('#create_number').onClick.listen(generate);

}

void generate(MouseEvent e) {
//todo generate random num
  var randomVar = new Random();
  var num = randomVar.nextInt(21);
//todo fill it in some html element
  var relationship= {
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
    21:'余英菲',
    };
  //利用随机产生的数字，选出对应的人名
  querySelector('#showme').text = relationship[num];

}
