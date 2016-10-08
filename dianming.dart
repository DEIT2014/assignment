import 'dart:html';
import 'dart:math';
    
void main() {
 // querySelector('#sample_text_id').text = 'your dart app is running';
  int i=0;
  if (i<4)
  { querySelector('#shorme').onClick.listen(rannum);
  querySelector('#shorme').onClick.listen(name);
  i++;}
  if (i>4) querySelector('#shorme').text='something went wrong!';
}

void rannum(MouseEvent event) {
  //to do generate random number
  var randomVar=new Random();
var num=randomVar.nextInt(15);
  //to do fill it is seed html element
  if (num>=1)
  querySelector('#shorme').text =num.toString();
  void name(MouseEvent event) {
      var map = new Map();
      map['1']='章乐';
      map['2']='阿能';
      map['3']='梦云';
      map['4']='章师';
      map['5']='张飞';
      map['6']='李圆';
      map['7']='章韵';
      map['8']='阿思';
      map['9']='刘云';
      map['10']='章利';
      map['11']='阿乐';
      map['12']='李云';
      map['13']='章云';
      map['14']='阿飞';
      map['15']='越飞';
      querySelector('#name').text =map[num.toString()];
  }
  }


