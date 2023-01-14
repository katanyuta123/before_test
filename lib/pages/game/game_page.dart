import 'package:before_test/game.dart';
import 'package:flutter/material.dart';
//ignore_for_file: prefer_const_constructors

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final _controller =
      TextEditingController(); //สร้างตัวแปรเพื่อนำไปใช้รับค่า ***
  final _game =
      Game(maxRandom: 100); //ถ้าอยากให้เล่นได้หลายรอบเราค่อยมาปรับตรงนี้ได้
  var _feedbackText = '';
  var _boxCount = 0;
  var _showbox = true;

  @override
  Widget build(BuildContext context) {
    var pinkBox = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 20,
        height: 20,
        color: Colors.pink,
      ),
    ); //ถ้าอยากให้กล่องห่างกันตอนปริ๊นก็ใส่ padding
    var blueBox = Container(width: 20, height: 20, color: Colors.blue);

    var boxList = <Widget>[];
    //boxList.add(pinkBox); ใส่แบบทีล่ะอัน
    for (var i = 0; i < _boxCount; i++) {
      //ใส่แบบทีเดียว 10 ครั้ง
      boxList.add(pinkBox);
    }
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
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        //ตรงนี้อย่าลืมช่องใส่เลขจะได้ไม่ชิดขอบเกิ๊นไป
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //ทำให้อยู่ตรงกลางสวยๆ มีแบ spaceBetween,อราวด์ก็ //หรือจะแรปวิทเซ็นเตอร์
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _showbox? boxList: [], //ถ้า_showbox เป็น true -> boxList เป็นช่องว่าง
                  ),

                  //ElevatedButton(onPressed: () {}, child: Text('A')),
                  //ElevatedButton(onPressed: () {}, child: Text('B')),
                  //ถ้าเพิ่ม เอา Expanded มาครอบปุ่มจะเป็นการกำหนดได้ว่าเอาสัดส่วนปุ่มมากน้ายแค่ไหน เลือกเอาแรปโดยวิเจต และพิมเอาเพราะมันไม่มีให้
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Guess the Love between 1 and 100',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.blueAccent,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextField(
                    //อักษรเก๊ๆในช่องใส่ค่า
                    controller: _controller,
                    // เอา _controller มาใส่เพื่อรับค่าในช่องมาทำบางอย่าง ***
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your love',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    //.all จะเป็นการกำหนดรอบด้าน .symmetric กำหนดได้รอบด้วยตัวเอง
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        onPressed: () {
                          // todo:
                          var input = _controller.text; //รับที่จอเว็บ String
                          var guess = int.tryParse(
                              input); //ให้แน่ใจว่าเป็นเลขทุกตัวก็เช็คต่อได้ String->number
                          var result = _game.doGuess(
                              guess!); //!ยืนยันว่าไม่เป็น null เพื่อจะได้ไม่ต้องเช็คบรรทัดบน

                          //ผลลัพธ์ต่องเป็นวิเจตไม่ใช่ปริ๊นเฉยๆ
                          setState(() {
                            //ปรากฏขึ้นในจอใหม่
                            if (result == GuessResult.correct) {
                              _feedbackText = 'Correct';
                              _feedbackText = 'Correct';
                            } else if (result == GuessResult.tooHigh) {
                              _feedbackText = 'too high,please try again!';
                            } else {
                              _feedbackText = 'too low,please try again!';
                            }
                          });

                          print(input); //ออกจอนี้นะจ๊ะ
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('GUESS'),
                        ),
                      ),
                    ),
                  ),

                  OutlinedButton(
                    //กดปุ่มเทสแล้วกล่องเพิ่มทีล่ะ 1
                    onPressed: () {
                      setState(() {
                        _boxCount++;
                      });
//
                    },
                    child: Text('TEST'),
                  ),
                  OutlinedButton(
                    //กดปุ่มแล้วกล่องหาย,กดอีกทีกลับมา
                    onPressed: () {
                      setState(() {
                        _showbox = !_showbox;
                      });
                    },
                    child: Text('TOGGLE'),
                  ),

                  //ตัววิเจตเฉลยด้านล่างสุดจอ โดยที่ไม่ต้องลบคือจารให้สร้าง column ใหม่ครอบ column เดิมไว้และสร้าง text
                ],
              ),
            ),
            Text(_feedbackText),
          ],
        ),
      ),
    );
  }
}
