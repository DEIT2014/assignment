// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:math';

void main() {
  var a=["Click me to know how many children you will have.","Click me to know how many oranges you will get.",
  "Click me to know how many watermelon you have eaten in this summer!"];
  int n=1;
  var s = querySelector("#pid").text="这是一个有趣的小测试，准备好开始了吗？";
  querySelector('#sample_text_id1')
    ..text =a[0]
    ..onClick.listen(onText1);

  querySelector('#sample_text_id2')
    ..text =a[1]
    ..onClick.listen(onText2);

  querySelector('#sample_text_id3')
    ..text =a[2]
    ..onClick.listen(onText3);


}

void onText1(MouseEvent event) {
  var Randomvar1= new Random();
  var n=Randomvar1.nextInt(90);
  querySelector('#sample_text_id1').text =n.toString();
}

void onText2(MouseEvent event) {
  var Randomvar2= new Random();
  var i=Randomvar2.nextInt(90);
  querySelector('#sample_text_id2').text = i.toString();
}

void onText3(MouseEvent event) {
  var Randomvar3= new Random();
  var k=Randomvar3.nextInt(90);
  querySelector('#sample_text_id3').text = k.toString();
}
