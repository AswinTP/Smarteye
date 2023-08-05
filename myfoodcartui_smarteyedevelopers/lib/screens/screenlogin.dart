import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:myfoodcartui_smarteyedevelopers/Utilities/constants.dart'
    as constants;
import 'package:myfoodcartui_smarteyedevelopers/Utilities/dialoguemapping.dart';
import 'package:myfoodcartui_smarteyedevelopers/Utilities/projectenums.dart';
import 'package:myfoodcartui_smarteyedevelopers/Utilities/routes.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  static String firebasePhoneNoVerifier = "";
  @override
  _ScreenLoginState createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _mpinNoTxtController = TextEditingController();
  final _mobileNoTxtController = TextEditingController();
  bool isValidLogin = false;
  bool isLoading = false;
  bool _isButtonDisabled = false;
  TextEditingController phoneController =
      TextEditingController(text: "+918606644266");
  TextEditingController otpController = TextEditingController();

  // FirebaseAuth auth = FirebaseAuth.instance;

  bool otpVisibility = false;

  String verificationID = "";
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    // this function gets called
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Container(
                        alignment: AlignmentDirectional.centerStart,
                        child: Image.asset('assets/images/food1.png')),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  padding: EdgeInsets.only(top: 5, right: 10),
                                  alignment: AlignmentDirectional.topStart,
                                  child: Text(
                                    'MY',
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Container(
                                  padding: EdgeInsets.only(top: 5, right: 10),
                                  alignment: AlignmentDirectional.topStart,
                                  child: Text(
                                    'FOOD',
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Container(
                                  padding: EdgeInsets.only(top: 5),
                                  alignment: AlignmentDirectional.topStart,
                                  child: Text(
                                    'CART',
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.orange[800],
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          'Login or sign up',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                const BoxShadow(
                                  blurRadius: 4,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              controller: phoneController,
                              obscureText: false,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                prefixIcon: const Icon(
                                  Icons.phone_android_outlined,
                                  color: Color(0xff224597),
                                ),
                                hintText: 'Enter phone number',
                                contentPadding: const EdgeInsets.fromLTRB(
                                  20.0,
                                  10.0,
                                  20.0,
                                  10.0,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                    width: 3.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        /* Visibility(
                    visible: otpVisibility,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 50, right: 50, top: 10, bottom: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            const BoxShadow(
                              blurRadius: 4,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          obscureText: false,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: Color(0xff224597),
                            ),
                            hintText: 'OTP',
                            contentPadding: const EdgeInsets.fromLTRB(
                              20.0,
                              10.0,
                              20.0,
                              10.0,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 3.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),*/
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Container(
                            child: ElevatedButton(
                              child: Text(
                                'Continue',
                                style: TextStyle(
                                    fontSize: constants.font_medium,
                                    fontFamily: AutofillHints.name,
                                    fontStyle: FontStyle.normal),
                              ),
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width,
                                      48), // Size(width, height)
                                  backgroundColor: Colors.amber[900],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25))),
                              onPressed: () {
                                // loginWithPhone();
                                setState(() {
                                  isLoading = true;
                                });
                                //sendOTP();
                                goToScreen(context);
                              },
                            ),
                          ),
                        ),
                        Container(
                            alignment: Alignment.topRight,
                            child: TextButton(
                                onPressed: () {}, child: Text('Sign in'))),
                        Container(
                            alignment: Alignment.topCenter, child: Text('OR')),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              splashColor: Colors.green,
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    height: 60,
                                    width: 60,
                                    child: Image.asset(
                                        'assets/images/icgoogle.png'),
                                  ) // <-- Text
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              splashColor: Colors.green,
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    height: 60,
                                    width: 60,
                                    child:
                                        Image.asset('assets/images/icmail.png'),
                                  ) // <-- Text
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Login as Merchant',
                                  style: TextStyle(
                                    color: Colors.amber[900],
                                    decoration: TextDecoration.underline,
                                  ),
                                )),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Login as Driver',
                                  style: TextStyle(
                                    color: Colors.amber[900],
                                    decoration: TextDecoration.underline,
                                  ),
                                ))
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'By continuing you agree to our ',
                        ),
                        Text('Terms of service Privacy Policy content Policy')
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ]));
  }

  sendOTP() async {
    print('Inside send otp');
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) {
        showToast(
          'Success..',
          context: context,
          animation: StyledToastAnimation.scale,
          reverseAnimation: StyledToastAnimation.fade,
          position: StyledToastPosition.center,
          animDuration: Duration(seconds: 1),
          duration: Duration(seconds: 2),
          curve: Curves.elasticOut,
          reverseCurve: Curves.linear,
        );
        setState(() {
          isLoading = false;
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        setState(() {
          showToast(
            'Invalid OTP',
            context: context,
            animation: StyledToastAnimation.scale,
            reverseAnimation: StyledToastAnimation.fade,
            position: StyledToastPosition.center,
            animDuration: Duration(seconds: 1),
            duration: Duration(seconds: 4),
            curve: Curves.elasticOut,
            reverseCurve: Curves.linear,
          );
          isLoading = false;
        });
      },
      codeSent: (String verificationId, int? resendToken) {
        ScreenLogin.firebasePhoneNoVerifier = verificationId;
        setState(() {
          isLoading = false;
        });
        showOTPDialog(context);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          isLoading = false;
        });
        showToast(
          'Timeout : Unable to process your request . Please try after sometime',
          context: context,
          animation: StyledToastAnimation.scale,
          reverseAnimation: StyledToastAnimation.fade,
          position: StyledToastPosition.center,
          animDuration: Duration(seconds: 1),
          duration: Duration(seconds: 4),
          curve: Curves.elasticOut,
          reverseCurve: Curves.linear,
        );
      },
    );
  }

  isValidUserLogin(BuildContext ctx) async {}

  void onClickActivateMpin(BuildContext context) {
    /*Future.delayed(Duration.zero, () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => ScreenValidateMobile()));
    });*/
  }
}
