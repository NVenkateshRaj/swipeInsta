import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:otp_autofill/otp_autofill.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OTPAutoFill extends StatefulWidget{
  _OtpAutoFillState createState()=>_OtpAutoFillState();
}

class _OtpAutoFillState extends State<OTPAutoFill>{
  String phoneNo;
  String smsOTP;
  String verificationId;
  String errorMessage = '';
  String message = "<#> code is 666666 e/XScRk4yW2";
  FirebaseAuth _auth = FirebaseAuth.instance;
   OTPTextEditController controller;
  final scaffoldKey = GlobalKey();
  TextEditingController otpController=TextEditingController();
  List<String> people = [];



  Future<void> verifyPhone() async {
    final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
    };
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: this.phoneNo, // PHONE NUMBER TO SEND OTP
          codeAutoRetrievalTimeout: (String verId) {
            //Starts the phone number verification process for the given phone number.
            //Either sends an SMS with a 6 digit code to the phone number specified, or sign's the user in and [verificationCompleted] is called.
            this.verificationId = verId;
          },
          codeSent:
          smsOTPSent, // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.
          timeout: const Duration(seconds: 20),
          verificationCompleted: (AuthCredential phoneAuthCredential) {
            print(phoneAuthCredential);
          },
          verificationFailed: (FirebaseAuthException exception) {
            print('${exception.message}');
          });
    } catch (e) {
      handleError(e);
    }
  }


  handleError(PlatformException error) {
    print(error);
    switch (error.code) {
      case 'ERROR_INVALID_VERIFICATION_CODE':
        FocusScope.of(context).requestFocus(new FocusNode());
        setState(() {
          errorMessage = 'Invalid Code';
        });
        Navigator.of(context).pop();
        break;
      default:
        setState(() {
          errorMessage = error.message;
        });
        break;
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listenOtp();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Otp Auto fill",style: TextStyle(color: Colors.white),),backgroundColor: Colors.green,),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (errorMessage != '' ? Text(errorMessage,style: TextStyle(color: Colors.red),): Container()),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
              child: PinFieldAutoFill(
                codeLength: 6,
                keyboardType: TextInputType.number,
                controller: otpController,
                decoration: UnderlineDecoration(
                  textStyle: TextStyle(fontSize: 20, color: Colors.black),
                  colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
                ),
               // currentCode: _code,
                onCodeSubmitted: (code) {},
                onCodeChanged: (code) {
                  print(code);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: (){
                    setState(() {});
                  },
                  child: Text("Enter OTP Manually",style:  TextStyle(color: Colors.red),),
                )
              ],
            ),
            RaisedButton(
              onPressed: ()async {
               //await verifyPhone();
              },
              child: Text('Verify'),
              textColor: Colors.white,
              elevation: 7,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  void listenOtp()async{
    print("Called listen otp");
    await SmsAutoFill().listenForCode;
    final signCode=await SmsAutoFill().getAppSignature;
    print(signCode);
  }

}