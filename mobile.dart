import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_verify/verify.dart';
import 'package:otp_verify/dash.dart';


class Mobile extends StatefulWidget {
  const Mobile({Key? key}) : super(key: key);
  //static var phone="";
  @override
  State<Mobile> createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  static var phone="";
  static var pin="";
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Center(child: Text('Please enter your mobile number',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold,))),
            const SizedBox(height: 18,),
            const Center(child: Text('You will receive 4 digit code ',style: TextStyle(color: Colors.black38,fontSize: 13),)),
            const Center(child: Text('to verify next ',style: TextStyle(color: Colors.black38,fontSize: 13),)),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Container(
                //width: 250,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black,width: 2),
                ),
                child: Row(
                  children:<Widget>[
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Image(image: AssetImage('images/flag.png',),width: 45,height: 45,),
                    ),
                    const Text('+91 -  '),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText:'Mobile Number',
                          hintStyle: TextStyle(color: Colors.black38,fontSize: 15),
                          border: InputBorder.none,
                        ),
                        showCursor: false,
                        keyboardType: TextInputType.number,
                        onChanged: (value){
                          phone=value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            TextButton(
              onPressed: ()async{
                Navigator.push(context,MaterialPageRoute(builder: (context)=> const Verify()));
                await auth.verifyPhoneNumber(
                    phoneNumber: '+918459606425',
                    verificationCompleted: (PhoneAuthCredential credential) async {
                      // ANDROID ONLY!
                      // Sign the user in (or link) with the auto-generated credential
                      pin=credential as String;
                      await auth.signInWithCredential(credential);
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> const Dash()));
                      print(credential);
                    }, verificationFailed: (FirebaseAuthException error) {
                    print(error);
                  },
                    codeSent: (String verificationId, int? forceResendingToken) {
                      print(verificationId);
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {
                      print(verificationId);
                    },
                  );
              },
              style:TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                fixedSize: const Size(363, 55),
                backgroundColor: const Color(0xFF2E3B62),
              ),
              child:const Text('Continue',style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
          ],
        ),
      ),
    );
  }
}
