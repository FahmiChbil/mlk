import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mlk/Auth/presentation/Auth_cubit/auth_cubit.dart';
import 'package:mlk/Auth/presentation/widgets/custom_Text_Form_Field.dart';
import 'package:mlk/Auth/presentation/widgets/custom_elevated_button.dart';
import 'package:mlk/core/const.dart';

class Registerpage extends StatefulWidget {
  Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final _formKey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isEmpty || !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  final emailController = TextEditingController();

  final passwordContoller = TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomTextFomField(
                      val: validateEmail,
                      label: "email",
                      keytype: null,
                      myContoller: emailController,
                      myhint: "email",
                      suffix: null,
                      obscure: false),
                  CustomTextFomField(
                      val: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      label: "password",
                      keytype: null,
                      myContoller: passwordContoller,
                      myhint: "password",
                      suffix: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      obscure: _obscurePassword),
                  BlocListener<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is RegisterSuccesState) {
                        print("stat is $state");
                        ScaffoldMessenger.of(context).showSnackBar(
                            customSnackBar(
                                "Register Succes", Colors.green, Icons.check));
                      } else if (state is RegisterFailedState) {
                        print("stat is $state");
                        ScaffoldMessenger.of(context).showSnackBar(
                            customSnackBar(
                                "Register Failed", Colors.red, Icons.error));
                      }
                    },
                    child: CustomElevatedButton(
                        onpress: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthCubit>().register(
                                emailController.text, passwordContoller.text);
                          }
                        },
                        buttonText: "Register"),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
