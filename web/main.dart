// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import'dart:math';

void main() {
  var button=querySelector('#output');
  button.onClick.listen(random);
}
void random(MouseEvent event) {
  var randomVar=new Random();
  var num=randomVar.nextInt(30);
  querySelector('#showme').text=num.toString();
}