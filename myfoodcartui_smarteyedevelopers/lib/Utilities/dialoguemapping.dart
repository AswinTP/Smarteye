import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:myfoodcartui_smarteyedevelopers/Utilities/projectenums.dart';
import 'package:myfoodcartui_smarteyedevelopers/Utilities/routes.dart';
import 'package:myfoodcartui_smarteyedevelopers/screens/screenlogin.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

Future<void> showCustomDialogue(BuildContext context, var dialogtype) async {
  switch (dialogtype) {
    case CustomDialogueTypes.CENTER:
      return Dialogs.materialDialog(
          msg: 'Are you sure ? you can\'t undo this',
          title: "Delete",
          color: Colors.white,
          context: context,
          dialogWidth: kIsWeb ? 0.3 : null,
          onClose: (value) => print("returned value is '$value'"),
          actions: [
            IconsOutlineButton(
              onPressed: () {
                Navigator.of(context).pop(['Test', 'List']);
              },
              text: 'Cancel',
              iconData: Icons.cancel_outlined,
              textStyle: TextStyle(color: Colors.grey),
              iconColor: Colors.grey,
            ),
            IconsButton(
              onPressed: () {},
              text: "Delete",
              iconData: Icons.delete,
              color: Colors.red,
              textStyle: TextStyle(color: Colors.white),
              iconColor: Colors.white,
            ),
          ]);
    case CustomDialogueTypes.BOTTOM:
      return Dialogs.bottomMaterialDialog(
          msg: 'Are you sure? you can\'t undo this action',
          title: 'Delete',
          context: context,
          actions: [
            IconsOutlineButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              text: 'Cancel',
              iconData: Icons.cancel_outlined,
              textStyle: TextStyle(color: Colors.grey),
              iconColor: Colors.grey,
            ),
            IconsButton(
              onPressed: () {},
              text: 'Delete',
              iconData: Icons.delete,
              color: Colors.red,
              textStyle: TextStyle(color: Colors.white),
              iconColor: Colors.white,
            ),
          ]);
    case CustomDialogueTypes.CENTER_WITH_ANIMATION:
      return Dialogs.materialDialog(
        color: Colors.white,
        msg: 'Congratulations, you won 500 points',
        title: 'Congratulations',
        lottieBuilder: Lottie.asset(
          'assets/loading-food.json',
          fit: BoxFit.contain,
        ),
        dialogWidth: kIsWeb ? 0.3 : null,
        context: context,
        actions: [
          IconsButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            text: 'Claim',
            iconData: Icons.done,
            color: Colors.blue,
            textStyle: TextStyle(color: Colors.white),
            iconColor: Colors.white,
          ),
        ],
      );
    case CustomDialogueTypes.BOTTOM_WITH_ANIMATION:
      return Dialogs.bottomMaterialDialog(
        msg: 'Congratulations, you won 500 points',
        title: 'Congratulations',
        color: Colors.white,
        lottieBuilder: Lottie.asset(
          'assets/loading-food.json',
          fit: BoxFit.contain,
        ),
        context: context,
        actions: [
          IconsButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            text: 'Claim',
            iconData: Icons.done,
            color: Colors.blue,
            textStyle: TextStyle(color: Colors.white),
            iconColor: Colors.white,
          ),
        ],
      );

    default:
      return null;
  }
}

void showOTPDialog(BuildContext context) {
  final FirebaseAuth auth = FirebaseAuth.instance;
  OtpFieldController otpController = OtpFieldController();
  return Dialogs.bottomMaterialDialog(
    msg:
        'OTP has been successfully sent to your mobile no , Please enter the OTP',
    title: 'Done',
    color: Colors.white,
    lottieBuilder: Lottie.asset(
      'assets/loading-food.json',
      fit: BoxFit.contain,
    ),
    context: context,
    actions: [
      Column(children: [
        Center(
          child: OTPTextField(
              controller: otpController,
              length: 6,
              width: MediaQuery.of(context).size.width,
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldWidth: 45,
              fieldStyle: FieldStyle.box,
              outlineBorderRadius: 15,
              style: TextStyle(fontSize: 17),
              onChanged: (pin) {
                print("Changed: " + pin);
              },
              onCompleted: (pin) async {
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: ScreenLogin.firebasePhoneNoVerifier,
                    smsCode: pin);

                // Sign the user in (or link) with the credential
                await auth.signInWithCredential(credential);
                print("Actual OTP: " + pin);
                print("Entered OTP: " + pin);
                goToScreen(context);
              }),
        )
      ]),
    ],
  );
}
