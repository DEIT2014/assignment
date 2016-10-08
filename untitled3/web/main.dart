// Copyright (c) 2016, gxy-jane. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import'dart:math';


void main() {
  querySelector('#output').text = 'Click';
  querySelector('#creat_number').onClick.listen(generate);
}
void generate(MouseEvent e) {
  var random=new Random(3);
  var num=random.nextInt(90);
  var s=querySelector('showme');
      s.text=num.toString();
  querySelector('output').text='点名学号为$s的学生';
}
