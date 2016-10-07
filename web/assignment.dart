import 'dart:html';
import 'dart:math';

void main() {

  querySelector('#sample_text_id')
    ..text = '点我产生随机数!';

   querySelector('#create_number').onClick.listen(generate);
}

void generate(MouseEvent event) {
  var random=new Random();
  var num=random.nextInt(60);
  var s=querySelector('#shownum').text=num.toString();
  querySelector('#sample_text_id').text='恭喜学号为 $s 的学生被选中！';
  }
