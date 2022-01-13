import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:qatra_app/helper/providers/main_provider.dart';
import 'package:qatra_app/helper/providers/new_user_provider.dart';
import 'package:qatra_app/helper/shared_prefrences_helper.dart';
import 'package:qatra_app/models/ForgetPassResponse.dart';
import 'package:qatra_app/models/loginjson.dart';
import 'package:qatra_app/screens/forget_password/forget_pass.dart';
import 'package:qatra_app/screens/home/gmap.dart';
import 'package:qatra_app/screens/otp/otp_screen.dart';
import 'package:qatra_app/utils/constant.dart';

import 'http_service.dart';

/// Code Before Trials
/*
class FireAuthHelper {
  FireAuthHelper._();

  static FireAuthHelper fireAuthHelper = FireAuthHelper._();
  FirebaseAuth fba = FirebaseAuth.instance;
  FirebaseDatabase fbrt = FirebaseDatabase.instance;

  Future<String> createAccount(email, password) async {
    UserCredential userCredential = await fba.createUserWithEmailAndPassword(
        email: email, password: password);
    return userCredential.user.uid;
  }

  Future<String> getUserAccount(email, password) async {
    UserCredential userCredential =
        await fba.signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user.uid;
  }

  // Future<String> registerToFb(String phoneNumber, BuildContext context,progress) {
  //   final completer = Completer<String>();
  //
  //   fba.verifyPhoneNumber(
  //     phoneNumber: phoneNumber,
  //     timeout: const Duration(seconds: 60),
  //     verificationCompleted: (PhoneAuthCredential credential) async {
  //       UserCredential authresult =
  //       await fba.signInWithCredential(credential);
  //
  //       print("ss ${credential.smsCode}");
  //
  //       User user = authresult.user;
  //       // _getUserFromFirebase(user);
  //       progress.dismiss();
  //       Get.to(() => OtpScreen(),
  //           transition: Transition.leftToRight, duration: Duration(seconds: 1));
  //       completer.complete("signedUp");
  //
  //     },
  //     verificationFailed: (FirebaseAuthException e) {
  //       String error = e.code == 'invalid-phone-number'
  //           ? "Invalid number. Enter again."
  //           : "Can Not Login Now. Please try again.";
  //       completer.complete(error);
  //       print("fff ${e.code}");
  //       progress.dismiss();
  //     },
  //     codeSent: (String verificationId, int resendToken) {
  //       completer.complete("verified");
  //       print("gggg");
  //       // progress.dismiss();
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {
  //       completer.complete("timeout");
  //       print("timeout");
  //       progress.dismiss();
  //     },
  //   );
  //
  //   return completer.future;
  // }

myLogin(code ,phone, context, progress) async {
    print(code+" "+phone);
  await fba.verifyPhoneNumber(
    phoneNumber: code+" "+phone,
    verificationCompleted: (PhoneAuthCredential credential) async {


      // Sign the user in (or link) with the auto-generated credential
      await fba.signInWithCredential(credential);
      print('The provided phfvd valid.');
    },
    verificationFailed: (FirebaseAuthException e) {
      if (e.code == 'invalid-phone-number') {
        print('The provided phone number is not valid.');
      }
    },
    codeSent: (String verificationId, int resendToken) async {
      // Update the UI - wait for the user to enter the SMS code
      String smsCode = 'xxxx';

      print('The provided cc d.');

      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

      // Sign the user in (or link) with the credential
      await fba.signInWithCredential(credential);
    },
    codeAutoRetrievalTimeout: (String verificationId) {
      print("time out $verificationId");
    },
  );
}

  Future<bool> phoneLogin(phone, context, progress) async {
    bool isTrue = false;
    print("gggggggggggggg $phone");
    await fba.verifyPhoneNumber(
      timeout: Duration(minutes: 1),
      phoneNumber: phone,
      codeSent: (String verificationId, int resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        String smsCode = 'xxxx';
        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);
        print("ggggggggtg $verificationId");
        // Sign the user in (or link) with the credential
        await fba.signInWithCredential(credential);
      },

      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
        Provider.of<NewUserProvider>(context, listen: false).smsCode =
            phoneAuthCredential.smsCode;
        print("success ${phoneAuthCredential.smsCode}");
        // progress.dismiss();
        Provider.of<NewUserProvider>(context, listen: false).changeLoading(false);
        Get.to(() => OtpScreen(),
            transition: Transition.leftToRight, duration: Duration(seconds: 1));
        // NavigationService.navigationService.navigateTo(OtpScreen.routeName);

        isTrue = true;
      },
      verificationFailed: (FirebaseAuthException error) {
        print(" faill ${error.message}");
        isTrue = false;
        // progress.dismiss();
        Provider.of<NewUserProvider>(context, listen: false).changeLoading(false);
        getMessageErorr(error.message);

      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print("time out $verificationId");
        isTrue = false;
        // progress.dismiss();
        Provider.of<NewUserProvider>(context, listen: false).changeLoading(false);
        getMessageErorr("TimeOut");
      },
    );

    return isTrue;
  }

  // Future<void> submitPhoneNumber(phone, context, progress) async {
  //   /// NOTE: Either append your phone number country code or add in the code itself
  //   /// Since I'm in India we use "+91 " as prefix `phoneNumber`
  //   String phoneNumber = phone.trim();
  //   print(phoneNumber);
  //
  //   /// The below functions are the callbacks, separated so as to make code more readable
  //   void verificationCompleted(AuthCredential phoneAuthCredential) {
  //     AuthCredential _phoneAuthCredential;
  //     print('verificationCompleted');
  //     _phoneAuthCredential = phoneAuthCredential;
  //     print(phoneAuthCredential);
  //   }
  //
  //   void verificationFailed(error) {
  //
  //     print("ffff $error");
  //   }
  //
  //   void codeSent(String verificationId, [int code]) {
  //     print('codeSent');
  //   }
  //
  //   void codeAutoRetrievalTimeout(String verificationId) {
  //     print('codeAutoRetrievalTimeout');
  //   }
  //
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //     /// Make sure to prefix with your country code
  //     phoneNumber: phoneNumber,
  //
  //     /// `seconds` didn't work. The underlying implementation code only reads in `milliseconds`
  //     timeout: Duration(minutes: 1),
  //
  //     /// If the SIM (with phoneNumber) is in the current device this function is called.
  //     /// This function gives `AuthCredential`. Moreover `login` function can be called from this callback
  //     verificationCompleted: verificationCompleted,
  //
  //     /// Called when the verification is failed
  //     verificationFailed: verificationFailed,
  //
  //     /// This is called after the OTP is sent. Gives a `verificationId` and `code`
  //     codeSent: codeSent,
  //
  //     /// After automatic code retrival `tmeout` this function is called
  //     codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
  //   ); // All the callbacks are above
  // }

  getMessageErorr(message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  addToRealTime(phone, email) {
    fbrt.reference().child("userData").child(phone).set({
      'phone': phone,
      'email': email,
    });
  }

  Future<bool> getFromRealTime(phone) {
    print("dddddddddddd $phone");
    Future<bool> future =
        fbrt.reference().child("userData").child(phone).once().then((value) {

      return value.value == null ? false : true;
    }).catchError((error) => false);
    //     .then((DataSnapshot snapshot) {
    //   print("Data: ${snapshot.value}");
    // });

    return future;
  }
}

 */





/// ElSweFy Trial
class FireAuthHelper {
  FireAuthHelper._();

  static FireAuthHelper fireAuthHelper = FireAuthHelper._();
  FirebaseAuth fba = FirebaseAuth.instance;
  FirebaseDatabase fbrt = FirebaseDatabase.instance;

  myLogin(code ,phone, context, progress) async {
    print(code+" "+phone);
    await fba.verifyPhoneNumber(
      phoneNumber: code+" "+phone,
      verificationCompleted: (PhoneAuthCredential credential) async {


        // Sign the user in (or link) with the auto-generated credential
        await fba.signInWithCredential(credential);
        print('The provided phfvd valid.');
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        String smsCode = 'xxxx';

        print('The provided cc d.');

        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

        // Sign the user in (or link) with the credential
        await fba.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print("time out $verificationId");
      },
    );
  }

  Future<bool> phoneLogin(phone, context, progress) async {
    bool isTrue = false;
    print("gggggggggggggg $phone");
    await fba.verifyPhoneNumber(
      timeout: Duration(minutes: 1),
      phoneNumber: phone,
      codeSent: (String verificationId, int resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        String smsCode = 'xxxx';
        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);
        print("ggggggggtg $verificationId");
        // Sign the user in (or link) with the credential
        await fba.signInWithCredential(credential);
      },

      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
        Provider.of<NewUserProvider>(context, listen: false).smsCode =
            phoneAuthCredential.smsCode;
        print("success ${phoneAuthCredential.smsCode}");
        // progress.dismiss();
        Provider.of<NewUserProvider>(context, listen: false).changeLoading(false);
        Get.to(() => OtpScreen(),
            transition: Transition.leftToRight, duration: Duration(seconds: 1));
        // NavigationService.navigationService.navigateTo(OtpScreen.routeName);

        isTrue = true;
      },
      verificationFailed: (FirebaseAuthException error) {
        print(" faill ${error.message}");
        isTrue = false;
        // progress.dismiss();
        Provider.of<NewUserProvider>(context, listen: false).changeLoading(false);

        addToastMessage(error: error.message,type: false);

      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print("time out $verificationId");
        isTrue = false;
        // progress.dismiss();
        Provider.of<NewUserProvider>(context, listen: false).changeLoading(false);
        addToastMessage(error: "TimeOut",type: false);
      },
    );

    return isTrue;
  }

  addToRealTime(phone, email) {
    fbrt.reference().child("userData").child(phone).set({
      'phone': phone,
      'email': email,
    });
  }

  Future<bool> getFromRealTime(phone) {
    print("dddddddddddd $phone");
    Future<bool> future =
    fbrt.reference().child("userData").child(phone).once().then((value) {

      return value.value == null ? false : true;
    }).catchError((error) => false);
    //     .then((DataSnapshot snapshot) {
    //   print("Data: ${snapshot.value}");
    // });

    return future;
  }

  Future<void> afterPhoneVerification (context) async {
    String phone = Provider.of<NewUserProvider>(context, listen: false)
        .phoneController
        .text;
    String email = Provider.of<NewUserProvider>(context, listen: false)
        .emailController
        .text;
    String password = Provider.of<NewUserProvider>(context, listen: false)
        .passwordController
        .text;

    String country =
        Provider.of<NewUserProvider>(context, listen: false).countryName;

    String code =
        Provider.of<NewUserProvider>(context, listen: false).countryCode;

    // progress.show();
    Provider.of<NewUserProvider>(context, listen: false).changeLoading(true);

    Loginjson loginjson = await HttpService.apiHelper
        .newUser(email, code + phone, password, country);

    if (loginjson.status) {
      SharedPrefrencesHelper.sharedPrefrencesHelper.saveLoginData(
          isLogin: true,
          token: loginjson.data.token.accessToken,
          password: Provider.of<NewUserProvider>(context, listen: false)
              .passwordController
              .text);

      // SharedPrefrencesHelper.sharedPrefrencesHelper.setData("fName", loginjson.data.user.firstName??"empty");
      // SharedPrefrencesHelper.sharedPrefrencesHelper.setData("lName", loginjson.data.user.lastName??"empty");

      await FireAuthHelper.fireAuthHelper.addToRealTime(code + phone, email);
      // NavigationService.navigationService.navigateTo(GMap.routeName);

      // progress.dismiss();
      Provider.of<NewUserProvider>(context, listen: false).changeLoading(false);


      Provider.of<NewUserProvider>(context, listen: false).disposeController();

      Get.offAll(() => GMap(),
          transition: Transition.rightToLeft, curve:Curves.easeInOutCubic,duration: Duration(milliseconds: 550));
    } else {
      // progress.dismiss();
      Provider.of<NewUserProvider>(context, listen: false).changeLoading(false);

      addToastMessage(error:loginjson.message[0] ,type: false);

    }
  }

  Future<void> handleManualOTP (String _otpCode ,context) async {
    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential _phoneAuthCredential =
    PhoneAuthProvider.credential(verificationId: Provider.of<NewUserProvider>(context, listen: false).verificationId , smsCode: _otpCode );

    print(_phoneAuthCredential.smsCode);

    if(Provider.of<MainProvider>(context,
        listen: false).isReset){
      Provider.of<MainProvider>(context,
          listen: false).smsCode = _phoneAuthCredential.smsCode;
      String phone = Provider.of<NewUserProvider>(context, listen: false)
          .phoneController
          .text;

      String countryCode = Provider.of<NewUserProvider>(context, listen: false)
          .countryCode;

      print(phone+countryCode);
      sendSMS(countryCode+phone,_phoneAuthCredential.smsCode,context);

    }else{
      afterPhoneVerification (context) ;
    }
  }

  sendSMS(phone,code,context) async {
    Provider.of<NewUserProvider>(context, listen: false).changeLoading(true);
    ForgetPassResponse response =
        await HttpService.apiHelper.SMSCodeVerification(phone,code);
    if(response.status){
      Provider.of<NewUserProvider>(context, listen: false).changeLoading(false);
      Get.offAll(()=>ForgetPassword(),transition: Transition.rightToLeftWithFade);
    }else {
      Provider.of<NewUserProvider>(context, listen: false).changeLoading(false);

      addToastMessage(error: response.message.first,type: false);
    }
  }

  Future<void> verifyPhoneNumber(String _userPhone,context) async {
    /// NOTE: Either append your phone number country code or add in the code itself
    /// Since I'm in India we use "+91 " as prefix `phoneNumber`
    // String userPhoneNumber = "+91 " + _phoneNumberController.text.toString().trim();
    // print(userPhoneNumber);
   //  +970123456789

    /// Handle This
    // oTPPinTrials.value += 1 ;

    /// if Phone Auto Handled OTP Received Message
    /// The below functions are the callbacks, separated so as to make code more redable
    void verificationCompleted(AuthCredential _phoneAuthCredential ) async {
      print('verificationCompleted');
      print(_phoneAuthCredential);
      // Provider.of<NewUserProvider>(context, listen: false).changeLoading(false);

      if(  Provider.of<MainProvider>(context,
          listen: false).isReset){
        PhoneAuthCredential _phoneAuthCredential =
        PhoneAuthProvider.credential(verificationId: Provider.of<NewUserProvider>(context, listen: false).verificationId , smsCode: "" );
        Provider.of<MainProvider>(context,
            listen: false).smsCode = _phoneAuthCredential.smsCode;
      }else{
        afterPhoneVerification (context) ;
      }

    }

    void verificationFailed( FirebaseAuthException _e) {
      print('verificationFailed');
      print(_e);
      print(_e.code);

      Provider.of<NewUserProvider>(context, listen: false).changeLoading(false);
      addToastMessage(error:_e.message,type: false);
    }


    /// if Phone Didn't Handled OTP Received Message Automaticly
    // void codeSent(String verificationId, [int code]) {
    void codeSent(String _verificationId, int _resendToken ) async {
      print( 'codeSent' );
      print( _verificationId );
      print( 'resendToken' );
      print( _resendToken.toString() );

      Provider.of<NewUserProvider>(context, listen: false).verificationId = _verificationId ;

      Provider.of<NewUserProvider>(context, listen: false).changeLoading(false);
      Get.to(() => OtpScreen(),
          transition: Transition.leftToRight, duration: Duration(seconds: 1));

    }

    void codeAutoRetrievalTimeout(String _verificationId ) {
      print('codeAutoRetrievalTimeout');
     // _authController.registerRefuseReason.value = errorOTPTimeOut ;
      print( _verificationId );

      Provider.of<NewUserProvider>(context, listen: false).changeLoading(false);
      addToastMessage(error: "TimeOut",type: false);
    }

    await FirebaseAuth.instance.verifyPhoneNumber(
      /// Make sure to prefix with your country code
      phoneNumber: _userPhone ,
      /// `seconds` didn't work. The underlying implementation code only reads in `millisenconds`
      // timeout: Duration(milliseconds: 10000),
      timeout: const Duration(seconds: 120),
      /// If the SIM (with phoneNumber) is in the current device this function is called.
      /// This function gives `AuthCredential`. Moreover `login` function can be called from this callback
      // verificationCompleted: verificationCompleted ,
      /// Called when the verification is failed
      verificationFailed: verificationFailed ,
      /// This is called after the OTP is sent. Gives a `verificationId` and `code`
      codeSent: codeSent ,
      /// After automatic code retrival `tmeout` this function is called
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    ); // All the callbacks are above

  }

}


