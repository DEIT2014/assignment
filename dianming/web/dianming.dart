import 'dart:html';
import 'dart:math';

void main(){
  var s=querySelector('#output');
  s.text = 'click me.';
  querySelector('#create_number').onClick.listern(reverseText);
}

void reverseText(MouseEvent event){
  var random=new Random(8);//生成一个类
  var num=randomVar.nextInt(90);
  var s=querySelector('#showme');
      s.text=num.toString();
  querySelector('#output').text='$s号学生';
}




