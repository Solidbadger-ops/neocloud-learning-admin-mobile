// import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/services/auth_service.dart';
import 'package:neocloud_mobile/screens/login_signup/components/login_form.dart';
import 'package:neocloud_mobile/screens/login_signup/components/signup_form.dart';
import 'package:neocloud_mobile/screens/search/search_screen.dart';
import 'package:neocloud_mobile/size_config.dart';

// @RoutePage()
class LoginSignupScreen extends StatefulWidget {
  LoginSignupScreen({super.key, this.showLogin = true});
  static String screenName = 'auth';
  bool showLogin;

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  @override
  Widget build(BuildContext context) {
    // logout user if on page build
    AuthService().logout();
    
    double getScreenHeight() {
      if (SizeConfig.screenHeight! < 800) return 800;
      return SizeConfig.screenHeight!;
    }

    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: screenPadding,
            child: Container(
              constraints: BoxConstraints(maxHeight: getScreenHeight() / 1.03),
              child: Column(
                children: <Widget>[
                  // Logo
                  // Image(image: AssetImage(nctFaviconBlue), width: 50,),
                  Spacer(),
                  SvgPicture.asset(nctFaviconBlue, width: 70, color: kBlueLight,),
        
                  // Section 1 - Intro Text'
                  SizedBox(height: defaultSize),
                  TextExtraLarge(title: widget.showLogin ? "Log into your Account" : "Create your Account", weight: FontWeight.w600),
        
                  // Section 2 - Form
                  SizedBox(height: defaultSize),
                  widget.showLogin ? LoginForm() : SignupForm(),
        
                  // Section 3 - switch forms
                  Spacer(),
                  Center(
                    child: TextMedium(
                        title: widget.showLogin
                            ? "Don't have an account?"
                            : "Already have an account?",
                        color: kBlack.withOpacity(.4)),
                  ),

                  SizedBox(height: defaultSize),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        OutlinedButton(
                          onPressed: () => setState(() => widget.showLogin = !widget.showLogin),
                          child: Container(
                            constraints: BoxConstraints(minHeight: defaultSize * 5.5, maxHeight: defaultSize * 5.5),        
                            child: Center(child: TextMedium(title: widget.showLogin ? 'Sign up' : 'Login')),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(borderRadius: appsBorderRadius)
                            ),
                          ),
                        )
                      ]),
        
                  SizedBox(height: defaultSize * 2),
                ],
              ),
            ),
          ),
        ));
  }
}
