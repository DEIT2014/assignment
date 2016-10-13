import 'dart:html';
import 'dart:math';

void main() {

querySelector('#sample_text_id')
    ..text = '点我产生随机数!';

   querySelector('#create_number').onClick.listen(generate);
}

void generate(MouseEvent) {
var list=['王巍','石睿', '龚馨懿','鲁梁秀','张红艳','余英菲','战晓瑜','高佳平','陈婧','张甜甜','潘晨煜','李志伟','杜谦'];





var random=new Random();
  var num=random.nextInt(7);


      querySelector('#sample_text_id').text = list[num];

  }
 
