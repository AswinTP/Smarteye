import 'package:flutter/material.dart';
import 'package:myfoodcartui_smarteyedevelopers/screens/screenlogin.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  _ScreenSplashState createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    // TODO: implement initState
    checkLoginDetails();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              alignment: AlignmentDirectional.centerStart,
              child: Image.asset('assets/images/food1.png')),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.only(left: 5),
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    'MY',
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  )),
              Container(
                  padding: EdgeInsets.only(left: 5),
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    'FOOD',
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  )),
              Container(
                  padding: EdgeInsets.only(left: 5),
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    'CART',
                    style: TextStyle(fontSize: 50, color: Colors.orange[800]),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 250, height: 80),
              child: ElevatedButton(
                child: Text(
                  'Get started',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: AutofillHints.name,
                      fontStyle: FontStyle.normal),
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    minimumSize: Size(100, 48), // Size(width, height)
                    backgroundColor: Colors.amber[900],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
                onPressed: () {
                  goToLoginScreen();
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> goToLoginScreen() async {
    Future.delayed(Duration.zero, () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenLogin()));
    });
  }

  Future<void> checkLoginDetails() async {
    isValidUserLogin(context);
  }

  isValidUserLogin(BuildContext ctx) async {
    //goToWelcomeScreen();
    Future.delayed(Duration.zero, () {
      /*Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => ScreenLogin()));*/
    });
  }
}
