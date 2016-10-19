// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
/*原始的点名文件！！！
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
*/
//通过访问json来显示点名的学号和姓名！！！
import 'dart:html'
;
var host = "127.0.0.1:8080";

void main() {
  querySelector("#create_number").onClick.listen(showData);//API不建议用的,get
  //querySelector("#loadStructured").onClick.listen(loadStructuredData);//get
  //querySelector("#save").onClick.listen(saveData);//put
}

void showData(_) {
  print("Loading data");//其实没用
  var url = "http://$host/programming-languages";//host=127.0.0.1

  // call the web server asynchronously
  var request = HttpRequest.getString(url).then(onDataLoaded);//dart.html//ondataloaded回调函数//查看APIdart:html,get方法//url服务器地址
}

onDataLoaded(responseText) {//服务器返回的文本
  print(" Data Loaded");//其实没用
  var jsonString = responseText;
  //List<int> list = new List(n); //定义数组
 // List listname=想把response变成map形式？
  querySelector("#showme").text = jsonString;//就是json中的文件
}



