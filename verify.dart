import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Verify extends StatefulWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override
  Widget build(BuildContext context) {

    final defaultPinTheme = PinTheme(
      width: 53,
      height: 56,
      textStyle: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF93D2F3)),
        borderRadius: BorderRadius.circular(0),
        color: const Color(0xFF93D2F3),
      ),

    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(0),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color(0xFF93D2F3),
      ),
    );
    return Scaffold(
      body: SafeArea(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Center(child: Text('Verify Pin',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold,))),
            const SizedBox(height: 18,),
            const Center(child: Text('Code is sent to 8094508485',style: TextStyle(color: Colors.black38,fontSize: 13),)),
            const SizedBox(height: 20,),
            Pinput(
              length: 6,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              validator: (s) {
                return s == '2222' ? null : 'Pin is incorrect';
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin) => print(pin),
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:const <Widget>[
                Text('Didn’t receive the code? ',style: TextStyle(color: Colors.black38,fontSize: 13),),
                Text('Request Again',style: TextStyle(color: Colors.black87,fontSize: 13),)
              ]
            ),
            const SizedBox(height: 20,),
            TextButton(
              style:TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                fixedSize: const Size(363, 55),
                backgroundColor: const Color(0xFF2E3B62),
              ),
              onPressed: () {  },
              child:const Text('Verify and Continue',style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
          ],
        ),
      ),
    );
  }
}
