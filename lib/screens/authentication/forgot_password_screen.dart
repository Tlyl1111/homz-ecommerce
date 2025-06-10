import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/controllers/auth_controller.dart';
import 'package:timberr/utils/font_style.dart';
import 'package:timberr/widgets/buttons/primary_button.dart';
import 'package:timberr/widgets/input/custom_input_box.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
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
                    const Text(
                      "Forgot\nPassword",
                      style: HTextTheme.title32SemiBoldDark,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Please enter your email.\nYou will receive a link to reset your password",
                      style: HTextTheme.body16MediumDark
                          .copyWith(color: kGrayText),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 46),
                    Column(
                      children: [
                        CustomInputBox(
                          headerText: "Email",
                          hintText: "Enter your email",
                          textInputType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                          onChanged: controller.emailOnChanged,
                          validator: controller.emailValidator,
                        ),
                      ],
                    ),
                    const SizedBox(height: 53),
                    PrimaryButton(
                      text: "Submit",
                      onTap: controller.forgotPassword,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Remember your account? ",
                          style: HTextTheme.body16MediumDark
                              .copyWith(color: kColorText),
                        ),
                        GestureDetector(
                          onTap: controller.toLoginScreen,
                          child: Text(
                            "Sign in",
                            style: HTextTheme.body16MediumDark.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
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
