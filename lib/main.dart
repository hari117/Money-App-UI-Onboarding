import 'package:flutter/material.dart';

void main() {
  runApp(screen9());
}

class screen9 extends StatefulWidget {
  @override
  _screen9State createState() => _screen9State();
}

class _screen9State extends State<screen9> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: s9());
  }
}

class s9 extends StatefulWidget {
  @override
  _s9State createState() => _s9State();
}

class _s9State extends State<s9> {
  List<String> pics = ["IMG/p6_1.png", "IMG/p6_2.png", "IMG/p6_2.png"];
  List<String> titles = ["Be Careful.", "Pay Easily.", "Control Analytics."];
  List<String> subT1 = [
    "Easy and smart way to",
    "See at a glance all open bills and pay",
    "Have an eye at each and every"
  ];
  List<String> subT2 = [
    "smanage your wallet.",
    "them with a single tap.",
    "transaction in brief."
  ];
  TextStyle T1 = TextStyle(fontSize: 30, color: Colors.black);
  TextStyle s1 = TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.black45);
  TextStyle Skipp = TextStyle(fontSize: 20, color: Colors.black45);
  TextStyle darkMode=TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black);
  Color bg=Colors.white;
    String mode="Dark Mode";
  PageController pageController = PageController(initialPage: 0,);
  int index = 0;
   bool dark=true;
  changetheam(){

    setState(() {



                   if(mode=="Dark Mode") {
                     bg = Colors.black;
                     T1 = TextStyle(fontSize: 30, color: Colors.white);
                     s1 = TextStyle(fontSize: 18,
                         fontWeight: FontWeight.w300,
                         color: Colors.white);
                     Skipp = TextStyle(fontSize: 20, color: Colors.white);
                     darkMode = TextStyle(fontSize: 20,
                         fontWeight: FontWeight.bold,
                         color: Colors.white);
                     mode="While Mode";
                   }
                   else
                     {
                       bg = Colors.white;
                       T1 = TextStyle(fontSize: 30, color: Colors.black);
                       s1 = TextStyle(fontSize: 18,
                           fontWeight: FontWeight.w300,
                           color: Colors.black);
                       Skipp = TextStyle(fontSize: 20, color: Colors.black);
                       darkMode = TextStyle(fontSize: 20,
                           fontWeight: FontWeight.bold,
                           color: Colors.black);
                       mode="Dark Mode";
                     }

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: bg,
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: pageController,
            onPageChanged: (pagepos) {
              setState(() {
                index = pagepos;
              });
            },
            itemCount: pics.length,
            itemBuilder: (context, position) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                        child: Image(
                          image: AssetImage("${pics[position]}"),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Text("${titles[position]}", style: T1),
                          SizedBox(
                            height: 30,
                          ),
                          Text("${subT1[position]}", style: s1),
                          SizedBox(
                            height: 7,
                          ),
                          Text("${subT2[position]}", style: s1),
                          SizedBox(
                            height: 7,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            top: MediaQuery.of(context).size.height - 100,
            left: MediaQuery.of(context).size.width - 100,
            child: Container(
                child: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  color: Colors.white,
                  onPressed: () {
                    pageController.nextPage(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.bounceInOut);
                  },
                ),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(59, 131, 252, 1),
                )),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height - 100,
            left: MediaQuery.of(context).size.width - 400,
            child: FlatButton(
              child: Text("Skip", style: Skipp),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height - 80,
            left: 165,
            child: Row(
              children: <Widget>[
                Circle(index, 0),
                SizedBox(
                  width: 10,
                ),
                Circle(index, 1),
                SizedBox(
                  width: 10,
                ),
                Circle(index, 2),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height-800,
            right: MediaQuery.of(context).size.width-350,
            child: InkWell(
              onTap: (){
                changetheam();
              },
                child: Text("$mode",style:darkMode),),
          )
        ],
      ),
    );
  }
}

Circle(index, i) {
  return Container(
    width: index == i ? 30 : 15,
    height: 10,
    decoration: BoxDecoration(
      color: index == i ? Color.fromRGBO(59, 131, 252, 1) : Colors.blue[100],
      borderRadius:
          index == i ? BorderRadius.circular(20) : BorderRadius.circular(20),
    ),
  );
}
