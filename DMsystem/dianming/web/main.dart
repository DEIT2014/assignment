// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:math';
import 'dart:core';

 var count=0; final n=20;
List<int> list = new List(n); //定义数组
List listname=[['10140340101','王巍'],
['10140340104','龚馨懿'],
['100140340105','涂斌琴'],
['10140340109','杜谦'],
['10140340110','张红燕'],
['10140340116','何欣语'],
['10140340117','陈婧'],
['10140340119','高佳平'],
['10140340120','姜慧敏'],
['10140340122','吴怡雯'],
['10140340125','池吉'],
['10140340129','石睿'],
['10140340131','王海佳'],
['10140340132','张甜甜'],
['10140340136','潘晨煜'],
['10140340138','鲁梁秀'],
['10140340141','李皓祯'],
['10140340145','战晓瑜'],
['10140340148','王冰倩'],
['10140340150','李志伟']];
void main(){
  for(var i=0;i<n;i++) {
    list[i] = 1000;
  }
  querySelector('#output').text = '点击按钮进行点名';
  querySelector('#create_number').onClick.listen(generate);
}
void generate(MouseEvent e)
{
    bool flag=true;
    var random=new Random();//如果填上数字，那么一直显示一个随机数，现在每点击一下，就会显示不同的随机数；
    var num=random.nextInt(n);//随机数一定小于括号的数字
    for (var i = 0; i < count; i++) {
        if (list[i] == num) {
          flag = false;
          querySelector('#showme').text = listname[num][1]+"已经点过了";
          break;
        }
      }
      if (flag == true) {
        list[count] = num;
        querySelector('#showme').text = listname[num][1];
        count++;
      }
    if(count>=n) querySelector('#show').text="点名结束！";
  //可以输出未出席学生学号
}

