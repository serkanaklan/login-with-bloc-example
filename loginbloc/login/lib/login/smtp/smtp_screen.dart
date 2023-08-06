import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import '../Controller/mailCodeController.dart';
import '../Controller/mailController.dart';
import 'bloc/smtp_bloc.dart';

class SmtpScreen extends StatefulWidget {
  SmtpScreen({required this.smtpBloc, super.key});
  SmtpBloc? smtpBloc;
  @override
  State<SmtpScreen> createState() => _SmtpScreenState();
}

class _SmtpScreenState extends State<SmtpScreen> {
  String merhaba = "Merhaba 👋 ";
  String validateCode = "Doğrulama kodu gönderildi";
  String mailFailed = "Böyle mail bulunamadı tekrar deneyin";
  String TextNullAlert = "DOLDURMANIZ GEREKİYOR";
  String kodDogru = "Kod doğru";
  String kodYanlis = "Kod yanlış tekrar deneyin";
  EmailOTP emailOTP = EmailOTP();

  void basariliMail() {
    AlertController.show(merhaba, validateCode, TypeAlert.success);
  }

  void hataliMail() {
    AlertController.show(merhaba, mailFailed, TypeAlert.error);
  }

  void BosKalamaz() {
    AlertController.show(merhaba, TextNullAlert, TypeAlert.warning);
  }

  void basariliCode() {
    AlertController.show(merhaba, kodDogru, TypeAlert.success);
  }

  void HataliCode() {
    AlertController.show(merhaba, kodYanlis, TypeAlert.error);
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Mail otp"),
      ),
      body: Center(
        child: Form(
            key: formKey,
            child: Flex(
              mainAxisAlignment: MainAxisAlignment.center,
              direction: Axis.vertical,
              children: [
                TextFormField(
                  controller: mail,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.mail,
                        color: Colors.amber,
                        size: 40,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      hintText: "Mail adresinizi girin",
                      filled: true,
                      fillColor: Colors.blue.shade50),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "TEXT FORM FİELD BOŞ OLAMAZ";
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                    onPressed: () async {
                      emailOTP.setConfig(
                          appEmail: "aklanserkansamet@gmai.com",
                          appName: "OTP PROJESİ",
                          userEmail: mail.text,
                          otpLength: 6,
                          otpType: OTPType.digitsOnly);
                      if (formKey.currentState!.validate()) {
                        if (await emailOTP.sendOTP() == true) {
                          basariliMail();
                        }
                        hataliMail();
                      } else {
                        print(
                            ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
                        BosKalamaz();
                      }
                    },
                    child: Text(
                      "MAİLE KOD GÖNDER",
                      style: TextStyle(fontSize: 20),
                    )),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: MailCode,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "TEXT FORM FİELD BOŞ OLAMAZ";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.pin,
                        color: Colors.indigoAccent.shade100,
                        size: 40,
                      ),
                      filled: true,
                      fillColor: Colors.blue.shade50,
                      hintText: "Maile gelen kodu girin",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        if (await emailOTP.verifyOTP(otp: MailCode.text) ==
                            true) {
                          basariliCode();
                        } else {
                          print("object");
                          HataliCode();
                        }
                      } else {
                        BosKalamaz();
                      }
                    },
                    child: Text(
                      "KODU DOĞRULA",
                      style: TextStyle(fontSize: 20),
                    ))
              ],
            )),
      ),
    );
  }
}
