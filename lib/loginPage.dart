import 'package:data_mites/homePage.dart';
import 'package:data_mites/signUpPage.dart';
import 'package:data_mites/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  var txtUserNameController = TextEditingController();
  var txtUserPwdController = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              // This is a Logo.
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Center(
                  child: Image.asset(
                    "assets/dm.png",
                    width: 200,
                  ),
                ),
              ),
              const Text(
                "Welcome Back,",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 12, 62, 97),
                    fontSize: 22),
              ),
              const Text(
                "You've been Missed!!",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 12, 62, 97),
                    fontSize: 22),
              ),
              const SizedBox(
                height: 20,
              ),
              // This is an Email Feild.
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 12, 62, 97),
                  ),
                  controller: txtUserNameController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Email",
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 12, 62, 97),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 12, 62, 97),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 12, 62, 97),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  // This is an Email Validator.
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                            .hasMatch(value)) {
                      return "Enter correct email";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              // This is a Password Feild.
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 12, 62, 97),
                  ),
                  obscureText: passToggle,
                  controller: txtUserPwdController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Password",
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 12, 62, 97),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 12, 62, 97),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 12, 62, 97),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    suffix: InkWell(
                      onTap: () {
                        setState(() {
                          passToggle = !passToggle;
                        });
                      },
                      child: Icon(
                        passToggle ? Icons.visibility : Icons.visibility_off,
                        size: 15,
                      ),
                    ),
                  ),
                  // This is a Password Validator.
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Password";
                    } else if (txtUserPwdController.text.length < 6) {
                      return "Password Length Should be more than 6 Characters";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 180),
                child: GestureDetector(
                  child: const Text(
                    "Forget Password ?",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.orange,
                        fontSize: 18),
                  ),
                  onTap: () {},
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // This is a LogIn Button.
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 55,
                  color: const Color.fromARGB(255, 12, 62, 97),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  // This is Form Validation Feild.
                  onPressed: () {
                    formKey.currentState!.validate();
                    bool signedIn = Provider.of<User>(context, listen: false)
                        .signIn(txtUserNameController.text.toString(),
                            txtUserPwdController.text.toString());
                    if (signedIn) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const Homepage()),
                      );
                    }
                  },
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                    textScaleFactor: 1,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 100,
                ),
                child: Row(
                  children: [
                    const Text(
                      "New user?",
                      style: TextStyle(
                          color: Color.fromARGB(255, 12, 62, 97),
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
