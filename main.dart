import 'package:flutter/material.dart';
import 'package:otp_verify/mobile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Welcome(),
  )
  );
}

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  static const List<String> _languages=<String>['English','Hindi','Marathi'];
  var currLang='English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            const Expanded(child: SizedBox()),
            const Image(image: AssetImage('images/gallery.png')),
            const SizedBox(height: 40,),
            const Center(child: Text('Please select your Language',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)),
            const SizedBox(height: 10,),
            const Center(child: Text('You can change language',style: TextStyle(color: Colors.black38,fontSize: 13),)),
            const Center(child: Text('at any time',style:TextStyle(color: Colors.black38,fontSize: 13),),),
            const SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38,width: 2),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.8),
                  child: DropdownButton<String>(
                      items: _languages.map<DropdownMenuItem<String>>((String value){
                       return DropdownMenuItem<String>(
                           value: value,
                           child: Text(value)
                       );
                      }
                      ).toList(),
                      onChanged: (String ? value){
                        setState(() {
                          currLang=value!;
                        });
                      },
                    value: currLang,
                    underline: const SizedBox(),
                    isExpanded: true,
                    style: const TextStyle(color: Colors.black54,fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25,),
            TextButton(
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> const Mobile()));
                },
                style:TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  fixedSize: const Size(222, 55),
                  backgroundColor: const Color(0xFF2E3B62),
                ),
                child:const Text('Next',style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
            const Expanded(child: SizedBox()),
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children:const <Widget>[
                Image(image: AssetImage('images/wave1.png'),width:390,fit: BoxFit.cover,),
                Image(image: AssetImage('images/wave2.png'),width:390,fit: BoxFit.cover,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
