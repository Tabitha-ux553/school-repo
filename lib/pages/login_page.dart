import 'package:flutter/material.dart';
import 'package:shool_repo/component/custom_textfield.dart';
import 'package:shool_repo/component/my_loading_circle.dart';
import 'package:shool_repo/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = AuthService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  void login() async {
    //showloading circle
    showLoadingCircle(context);
    //attempt to login
    try {
      await _auth.loginEmailPassword(
          emailController.text, passwordcontroller.text);

      if (mounted) hideLoadingCircle(context);
    } catch (e) {
      if (mounted) hideLoadingCircle(context);
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Center(
              child: Text(
                e.toString(),
              ),
            ),
            titleTextStyle:
                const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // app name
              const Text(
                "School Repo",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Login with your email and password",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                //wrapper
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        //email TextField
                        const SizedBox(height: 20),
                        CustomTextfield(
                          controller: emailController,
                          hintText: "Email",
                        ),
                        //password textdield
                        const SizedBox(height: 10),
                        CustomTextfield(
                          controller: passwordcontroller,
                          hintText: "Password",
                        ),

                        //login button
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: login,
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),

              // rwgister now
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have a account ? ",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  //
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      "Register now",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
