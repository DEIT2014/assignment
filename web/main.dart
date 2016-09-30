// Copyright (c) 2016, chiji233. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:math';
const maxNum = 50;
//全班的人数
void main() {

  var random = new Random();
  var contentPanel = querySelector(".content-panel");
  querySelector("#submit").onClick.listen((Event e){
    var randomInt = random.nextInt(maxNum);
    var randomString = randomInt>=10 ? randomInt.toString() : ('0'+randomInt.toString());
    contentPanel.text = randomString;
    e.stopPropagation();
  });

}
