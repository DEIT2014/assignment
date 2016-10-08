// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import'dart:math';

void main() {
  var s=querySelector('#output');
  s.text = 'click';
  querySelector('#creat_number').onClick.listen(generate);


}
void generate(MouseEvent e){
  var random=new Random();//先造类
  var num=random.nextInt(80);//使用类的方法
  var s=querySelector('#showme');
  s.text=num.toString();
  querySelector('#output').text='学号为$s的同学被抽中';

}

