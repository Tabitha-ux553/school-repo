import 'package:flutter/material.dart';
import 'package:shool_repo/component/custom_textfield.dart';
import 'package:shool_repo/component/my_loading_circle.dart';
import 'package:shool_repo/services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _auth = AuthService();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController conpasswordcontroller = TextEditingController();

  //

  void register() async {
    if (passwordcontroller.text == conpasswordcontroller.text) {
      showLoadingCircle(context);

      try {
        // Register the user
        await _auth.registerEmailAndPassword(
          emailcontroller.text,
          passwordcontroller.text,
        );
      } catch (e) {
        if (mounted) hideLoadingCircle(context);
        if (mounted) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(e.toString()),
            ),
          );
        }
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Center(child: Text("Passwords don't match")),
          titleTextStyle:
              const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      );
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
                "Let create an account for you",
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
                        const SizedBox(height: 20),
                        CustomTextfield(
                          controller: namecontroller,
                          hintText: "Name",
                        ),
                        //email TextField
                        const SizedBox(height: 20),
                        CustomTextfield(
                          controller: emailcontroller,
                          hintText: "Email",
                        ),
                        //password textdield
                        const SizedBox(height: 10),
                        CustomTextfield(
                          controller: passwordcontroller,
                          hintText: "Password",
                        ),
                        const SizedBox(height: 20),
                        CustomTextfield(
                          controller: conpasswordcontroller,
                          hintText: "Confirm Password",
                        ),
                        //login button
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: register,
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: const Text(
                                "Register",
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
                    "'Already have a account ? ",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      "Login now",
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
