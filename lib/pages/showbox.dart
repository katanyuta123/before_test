//ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class ShowBox extends StatefulWidget {
  const ShowBox({Key? key}) : super(key: key);

  @override
  State<ShowBox> createState() => _ShowBoxState();
}

class _ShowBoxState extends State<ShowBox> {
  var countsize = TextEditingController(); //สร้างตัวแปรเพื่อนำไปใช้รับค่า ***
  var num = 0;

  @override
  Widget build(BuildContext context) {
    var blueBox = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 20,
        height: 20,
        color: Colors.amber,
      ),
    );
    var boxList = <Widget>[]; //boxList.add(pinkBox); ใส่แบบทีล่ะอัน

    /*if(countsize!=null){
     num = countsize as int;
    }*/
    for (var i = 0; i < 6; i++) {
      //ใส่จำนวนกล่องตามเลขที่เราใส่
      boxList.add(blueBox);
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
              ),
              child: const Icon(
                Icons.account_box_outlined,
                color: Colors.black,
              ), //กำหนดพวกพื้นหลัง ใส่เงา ใส่ขอบได้หมด
            ),
            //เอาบางสิ่งครอบไอคอน
            const SizedBox(width: 10),
            //ไว้แทรกให้มีพื้นที่ระหว่างกัน หรือใช้ Padding ก็ได้เช่นกันแล้วแต่เราเลือก
            Text(" SHOW BOX "),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //ทำให้อยู่ตรงกลางสวยๆ มีแบ spaceBetween,อราวด์ก็ //หรือจะแรปวิทเซ็นเตอร์
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Enter the count of box',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.blueAccent,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              TextField(
                controller: countsize,
                // เอา _controller มาใส่เพื่อรับค่าในช่องมาทำบางอย่าง ***
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your count', //อักษรเก๊ๆในช่องใส่ค่า
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    onPressed: () {
                      //todo:
                      var input = countsize.text;
                      var count = int.tryParse(input);
                      setState(() {
                        num = count!;
                      });
                    },
                    child: Text('Enter'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// รับเลข