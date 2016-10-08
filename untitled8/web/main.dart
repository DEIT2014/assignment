// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:math';

void main() {
  querySelector('#output').text = 'click me!';
  querySelector('#create_number').onClick.listen(generate);
}
void generate(MouseEvent e)
{
  var i;
  var list[i]=0;
  var random=new Random();//如果填上数字，那么一直显示一个随机数，现在每点击一下，就会显示不同的随机数；
  var num=random.nextInt(90);
  list[num]++;
  if list[num]>=3,
      return random;

  querySelector('#showme').text=num.toString();
}