import 'dart:html';
import 'dart:convert' show JSON;
import "dart:math";

import 'dart:core';
var names = new List<int>();
var host = "127.0.0.1:4041";

void main() {
  querySelector("#button").onClick.listen(loadData);

}

void loadData(_) {

  var url = "http://$host/students_data";//这个地址可以自己写

  // call the web server asynchronously
  var request = HttpRequest.getString(url).then(onDataLoaded);//获取请求
}

onDataLoaded(responseText) {
  var jsonString = responseText;
  var students=JSON.decode(jsonString);
  var remain=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
  var random=new Random();//生成一个类,8作为一个种子，如果有8的话每次生成的随机数都是相同，没有8的话就会生成不同的随机数。
  var num=random.nextInt(21); //利用类里面的函数生成0-20的整数随机数,总共21位同学
  querySelector('#num').text='产生的随机数是：'+num.toString();
  var a=names.contains(num);
  var studentsmap=students['students'];
  if(a) {
    if (names.length < 21) {
      querySelector('#name').text = '这位同学已经点过，请重新生成随机数进行点名！';
    }
    else {
      querySelector('#name').text = '您已经点过班级中所有同学的姓名，继续点击将重新开始点名！';
      names.clear();
    }
  }
  else
  {
    names.add(num);
    querySelector('#name').text='被点名的同学：'+studentsmap[num.toString()]; //text中的值只能是字符串

  }
  for(var x in names)
  {remain.remove(x);
  }
  querySelector("#remain").text='没有点过名的同学编号：'+remain.toString();//显示没有点过名的同学编号

}



