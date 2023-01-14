import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.lightGreen,
                shape: BoxShape.rectangle,
              ),
              child: const Icon(
                  Icons.hardware), //กำหนดพวกพื้นหลัง ใส่เงา ใส่ขอบได้หมด
            ),
            //เอาบางสิ่งครอบไอคอน
            const SizedBox(width: 10),
            //ไว้แทรกให้มีพื้นที่ระหว่างกัน หรือใช้ Padding ก็ได้เช่นกันแล้วแต่เราเลือก
            Text(" I LOVE YOU "),
          ],
        ),
      ),
      body: Column(
       // mainAxisAlignment: MainAxisAlignment.center, //ทำให้อยู่ตรงกลางสวยๆ
       //หรือจะแรปวิทเซ็นเตอร์
        children: [
          Text('Guess the number between 1 and 100'),
          TextField(),

          OutlinedButton(
            onPressed: (){
              //  โค้ดว่าให้ทำอะไร
            },
            child: Text('GUESS'),

          )
        ],
      ),
    );
  }
}
