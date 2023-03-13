import 'package:fingerprint/components/authenticationcomponent.dart';
import 'package:fingerprint/pages/landing.dart';
import 'package:fingerprint/screens/home.dart';
import 'package:fingerprint/utilities/variable.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../utilities/colors.dart';
import '../utilities/font.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool? hide = false;
  List<String>? hints = ["everistus", "hamilton"];

  @override
  void initState() {
    super.initState();
    userAuthenticate(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Scaffold(
        // backgroundColor: nocolor,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ############# top icon image #######################
                const Icon(IconlyLight.profile, size: 100),
                vgap(10),
                // ################ username input #####################
                TextField(
                  autocorrect: true,
                  autofillHints: hints,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(IconlyLight.profile, size: 30),
                    hintText: "Username",
                  ),
                ),
                vgap(10),
                // ###################### password input ##############
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(IconlyLight.password, size: 30),
                    suffixIcon: IconButton(
                      onPressed: () async => userAuthenticate(context),
                      icon: const Icon(Icons.fingerprint, size: 35),
                    ),
                    hintText: "Password",
                  ),
                  obscureText: hide!,
                  obscuringCharacter: "*",
                ),
                vgap(5),
                // ################# hide password ############################
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    h2("Hide Password?", size: 12, color: blue),
                    Checkbox(
                        value: hide,
                        onChanged: (value) {
                          setState(() => hide = value);
                        })
                  ],
                ),
                vgap(10),
                // #################### submit button ##########################
                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  color: blue,
                  padding: const EdgeInsets.all(10),
                  onPressed: () {},
                  child: h2("Login", color: white),
                ),
                vgap(5),
                // ######################## forgotten pwd ##########################
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      child: h2("Forgotten Password?", size: 12, color: blue),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future userAuthenticate(context) async {
  {
    final bool isAuthenticated = await LocalAuth.authenticate();
    if (isAuthenticated) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LandingPage(),
        ),
      );
    }
  }
  ;
}
