import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Dialer extends StatefulWidget {
  const Dialer({Key? key}) : super(key: key);

  @override
  State<Dialer> createState() => _DialerState();
}

late final Wcontroller = TextEditingController().text = "";

class _DialerState extends State<Dialer> {
  String display = '';


  @override
  Widget build(BuildContext context) {
    double sHeight = MediaQuery.of(context).size.height;
    double sWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text("Dialer"),
      //   centerTitle: true,
      // ),
      body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: sHeight * 0.05,),
              Text(display,
                style: TextStyle(
                  fontSize: 25
                ),
              ),
              Container(
                height: sHeight * 0.7825203252031637,
                width: sWidth + 1.0185185185,
                color: Colors.white,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment(-0.67, -0.75),
                      child: Container(child: dialPadButton(sHeight, sWidth, '1')),
                    ),
                    Align(
                      alignment: Alignment(0.0, -0.75),
                      child: Container(child: dialPadButton(sHeight, sWidth, '2')),
                    ),
                    Align(
                      alignment: Alignment(0.67, -0.75),
                      child: Container(child: dialPadButton(sHeight, sWidth, '3')),
                    ),
                    Align(
                      alignment: Alignment(-0.67, -0.35),
                      child: Container(child: dialPadButton(sHeight, sWidth, '4')),
                    ),
                    Align(
                      alignment: Alignment(0.0, -0.35),
                      child: Container(child: dialPadButton(sHeight, sWidth, '5')),
                    ),
                    Align(
                      alignment: Alignment(0.67, -0.35),
                      child: Container(child: dialPadButton(sHeight, sWidth, '6')),
                    ),
                    Align(
                      alignment: Alignment(-0.67, 0.05),
                      child: Container(child: dialPadButton(sHeight, sWidth, '7')),
                    ),
                    Align(
                      alignment: Alignment(0.0, 0.05),
                      child: Container(child: dialPadButton(sHeight, sWidth, '8')),
                    ),
                    Align(
                      alignment: Alignment(0.67, 0.05),
                      child: Container(child: dialPadButton(sHeight, sWidth, '9')),
                    ),
                    Align(
                      alignment: Alignment(-0.67, 0.45),
                      child: Container(child: dialPadButton(sHeight, sWidth, '*')),
                    ),
                    Align(
                      alignment: Alignment(0.0, 0.45),
                      child: Container(child: dialPadButton(sHeight, sWidth, '0')),
                    ),
                    Align(
                      alignment: Alignment(0.67, 0.45),
                      child: Container(child: dialPadButton(sHeight, sWidth, '#')),
                    ),
                    Align(
                      alignment: Alignment(0.0, 0.80),
                      child: Container(
                        child: TextButton(
                          onPressed: () async {
                            FlutterPhoneDirectCaller.callNumber(Wcontroller);
                          },
                          child: CircleAvatar(
                            child: Icon(Icons.call),
                            maxRadius: sHeight * 0.05,
                            minRadius: sHeight * 0.05,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.55, 0.75),
                      child: InkWell(
                          onTap: () {
                            if (display.length != 0) {
                              setState(() {
                                display = display.substring(0, display.length - 1);
                              });
                            }
                          },
                          child: Icon(Icons.backspace_rounded,
                            color: Colors.black,
                            size: sHeight * 0.05,
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );

  }

  Widget dialPadButton(double sHeight, double sWidth, String value) {
    return TextButton(
      onPressed: () {
        setState(() {
          display = display + value;
        });
      },

      child: CircleAvatar(
        child: Text(value,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: sHeight * 0.04
          ),
        ),
        maxRadius: sHeight * 0.05,
        minRadius: sHeight * 0.05,
        backgroundColor: Colors.grey[200],
      ),
    );
  }


}
