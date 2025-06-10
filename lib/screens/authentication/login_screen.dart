import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/controllers/auth_controller.dart';
import 'package:timberr/utils/font_style.dart';
import 'package:timberr/widgets/buttons/primary_button.dart';
import 'package:timberr/widgets/buttons/secondary_button.dart';
import 'package:timberr/widgets/input/custom_input_box.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      id: kLogin,
      builder: (controller) => Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SafeArea(
            minimum: const EdgeInsets.only(top: 40),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),
                    const Text("Sign in",
                        style: HTextTheme.title32SemiBoldDark),
                    const SizedBox(height: 12),
                    Text("Hi! Welcome back,",
                        style: HTextTheme.body16MediumDark
                            .copyWith(color: kGrayText)),
                    const SizedBox(height: 46),
                    Column(
                      children: [
                        CustomInputBox(
                          headerText: "Email",
                          hintText: "Enter your email",
                          textInputType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          onChanged: controller.emailOnChanged,
                          validator: controller.emailValidator,
                        ),
                        const SizedBox(height: 20),
                        CustomInputBox(
                          headerText: "Password",
                          hintText: "Enter your password",
                          onChanged: controller.passwordOnChanged,
                          obscureText: !controller.showPassword.value,
                          suffixIcon: GestureDetector(
                            onTap: controller.togglePasswordVisibility,
                            child: Icon(
                              controller.showPassword.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: HTextTheme.body12MediumLight
                              .copyWith(color: kColorText),
                        ),
                        GestureDetector(
                          onTap: controller.toRegisterScreen,
                          child: Text(
                            "Sign up",
                            style: HTextTheme.body12MediumLight.copyWith(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                        GestureDetector(
                          onTap: controller.toForgotPasswordScreen,
                          child: Text(
                            "FORGOT PASSWORD",
                            style: HTextTheme.body12MediumDark.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    PrimaryButton(
                      text: "Sign in",
                      onTap: controller.signIn,
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            thickness: 1,
                            color: kDivider,
                            endIndent: 10,
                          ),
                        ),
                        Text(
                          "Or",
                          style: HTextTheme.body12MediumDark
                              .copyWith(color: kDivider),
                        ),
                        const Expanded(
                          child: Divider(
                            thickness: 1,
                            color: kDivider,
                            indent: 10,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    SecondaryButton(
                      text: "Sign in with Google",
                      onTap: () {
                        // Add Google sign-in logic here
                      },
                      imagePath: "assets/icons/ic_google.png",
                    ),
                    const SizedBox(height: 15),
                    SecondaryButton(
                      text: "Sign in with Facebook",
                      onTap: () {
                        // Add Facebook sign-in logic here
                      },
                      imagePath: "assets/icons/ic_facebook.png",
                    ),
                    const SizedBox(height: 15),
                    SecondaryButton(
                      text: "Sign in with Apple",
                      onTap: () {
                        // Add Apple sign-in logic here
                      },
                      imagePath: "assets/icons/ic_apple.png",
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
