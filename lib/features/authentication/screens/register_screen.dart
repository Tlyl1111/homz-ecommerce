import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/features/authentication/controllers/auth_controller.dart';
import 'package:timberr/utils/font_style.dart';
import 'package:timberr/common/widgets/buttons/primary_button.dart';
import 'package:timberr/common/widgets/input/custom_input_box.dart';
/*import 'package:timberr/screens/authentication/login_screen.dart';*/

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      id: kRegister,
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
                    const Text("Sign up",
                        style: HTextTheme.title32SemiBoldDark),
                    const SizedBox(height: 12),
                    Text("Hi! Welcome to,",
                        style: HTextTheme.body16MediumDark
                            .copyWith(color: kGrayText)),
                    const SizedBox(height: 46),
                    Column(
                      children: [
                        CustomInputBox(
                          headerText: "Full Name",
                          hintText: "Enter your full name",
                          textInputType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          onChanged: controller.nameOnChanged,
                          validator: controller.nameValidator,
                        ),
                        const SizedBox(height: 20),
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
                          textInputType: TextInputType.visiblePassword,
                          onChanged: controller.passwordOnChanged,
                          validator: controller.passwordValidator,
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
                    const SizedBox(height: 40),
                    PrimaryButton(
                      text: "Sign up",
                      onTap: controller.signUp,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: HTextTheme.body12MediumLight
                              .copyWith(color: kColorText),
                        ),
                        GestureDetector(
                          onTap: controller.toLoginScreen,
                          child: Text(
                            "Sign in",
                            style: HTextTheme.body12MediumLight.copyWith(
                              fontWeight: FontWeight.bold,
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
