import 'package:data_mites/user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _date = TextEditingController();
  var txtUserNameController = TextEditingController();
  var txtUserEmailController = TextEditingController();
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
              // This is a Logo Feild.
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
                "New User Register!",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 12, 62, 97),
                    fontSize: 22),
              ),
              const SizedBox(
                height: 20,
              ),
              // This is Username Feild.
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
                    hintText: "Username",
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
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]').hasMatch(value)) {
                      return "Enter correct Username";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              // This is an Email Feild.
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 12, 62, 97),
                  ),
                  controller: txtUserEmailController,
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
              // This is DOB Feild.
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 12, 62, 97),
                  ),
                  controller: _date,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Select a Date",
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
                      suffix: const InkWell(
                        child: Icon(Icons.calendar_today_rounded),
                      )),
                  onTap: () async {
                    DateTime? pickeddate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101));
                    if (pickeddate != null) {
                      setState(() {
                        _date.text =
                            DateFormat('yyyy-mm-dd').format(pickeddate);
                      });
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // This is a SignUpButton.
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 55,
                  color: const Color.fromARGB(255, 12, 62, 97),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  onPressed: () {
                    formKey.currentState!.validate();
                    bool signedUp = Provider.of<User>(context, listen: false)
                        .signUp(
                            txtUserEmailController.text.toString(),
                            txtUserNameController.text.toString(),
                            txtUserPwdController.text.toString());
                    if (signedUp) {
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text(
                    "Sign Up",
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
                  left: 40,
                ),
                child: Row(
                  children: [
                    const Text(
                      "Already Have an Account ?",
                      style: TextStyle(
                          color: Color.fromARGB(255, 12, 62, 97),
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Log In",
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
