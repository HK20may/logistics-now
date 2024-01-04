import 'package:flutter/material.dart';
import 'package:logistics_now/core/constants/app_assets_path.dart';
import 'package:logistics_now/core/theme/color_constants.dart';
import 'package:logistics_now/core/theme/widgets_and_attributes.dart';
import 'package:logistics_now/core/widgets/custom_textfield.dart';
import 'package:logistics_now/core/widgets/primary_button.dart';
import 'package:logistics_now/domain/firebase/authentication_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTEC = TextEditingController();
  final TextEditingController _passwordTEC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.bgColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              const SizedBox(
                height: kToolbarHeight,
              ),
              Image.asset(
                AppAssetsPath.loginLogo,
                height: 200,
              ),
              sizedBoxH40,
              const Text(
                "Welcome",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold),
              ),
              sizedBoxH10,
              const Text(
                "Please Enter your Email and Password",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              sizedBoxH30,
              CustomTextField(
                controller: _emailTEC,
                labelText: "Your Email",
                height: 60,
              ),
              sizedBoxH20,
              CustomTextField(
                controller: _passwordTEC,
                labelText: "Your Password",
                shouldHideText: true,
                height: 60,
              ),
              sizedBoxH20,
              PrimaryButton("Login", onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                AuthenticationServices().authenticateUser(
                    _emailTEC.text.trim(), _passwordTEC.text.trim());
              }),
            ],
          ),
        ),
      ),
    );
  }
}
