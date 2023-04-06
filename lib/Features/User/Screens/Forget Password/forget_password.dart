import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_emergency_app/Common%20Widgets/constants.dart';
import '../../../../Common Widgets/form_footer.dart';
import 'forget_password_form.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Get the size in LoginHeaderWidget()
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color(color),
        centerTitle: true,
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
        bottom: PreferredSize(
            preferredSize:  Size.fromHeight(Get.height * 0.1),
            child: Container(
              padding: const EdgeInsets.only(bottom: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 30,),
                      Center(
                        child: SizedBox.fromSize(
                          size: const Size(36, 36),
                          child: ClipOval(
                            child: Material(
                              color: Color(color),
                              child: InkWell(
                                splashColor: Colors.white,
                                onTap: () {  Get.back();
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    Icon(Icons.arrow_back, color: Colors.white, size: 30,),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 10,),
                      // SizedBox(width: 15,),
                      // Center(
                      //   child: SizedBox.fromSize(
                      //     size: Size(56, 56),
                      //     child: ClipOval(
                      //       child: Material(
                      //         color: Colors.black12,
                      //         child: InkWell(
                      //           splashColor: Colors.white,
                      //           onTap: () {  Get.back();
                      //           },
                      //           child: Column(
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             children: <Widget>[
                      //               Icon(Icons.arrow_back, color: Colors.white, size: 30,),
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                       Image(
                          image:
                             const AssetImage("assets/logos/emergencyAppLogo.png"),
                          height: Get.height * 0.08,),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Forget Password",
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      )

                    ],
                  ),
                    ],
                  ),
                ],
              ),
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              ForgetFormWidget(),
              FooterWidget(Texts: "Don't Have Account ", Title: "Sign Up"),
            ],
          ),
        ),
      ),
    );
  }
}
