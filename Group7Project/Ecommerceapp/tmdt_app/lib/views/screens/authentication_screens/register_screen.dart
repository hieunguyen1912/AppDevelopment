import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdt_app/controllers/auth_controller.dart';
import 'package:tmdt_app/views/screens/authentication_screens/login_screens.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();
  bool _isLoading = false;
  late String email;
  late String password;

  late String fullName;

  bool _isObscure = true;

  registerUser() async {
    BuildContext localContext = context;
    setState(() {
      _isLoading = true;
    });

    String res =
        await _authController.registerNewUser(email, fullName, password);
    if (res == 'success') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Đăng ký thành công!")),
      );
    } else {
      setState(() {
        _isLoading = false;
      });

      Future.delayed(Duration.zero, () {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(res)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Create Your Account",
                    style: GoogleFonts.getFont(
                      "Lato",
                      color: const Color(0xFF0d120E),
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                  Text(
                    'To Explore the world exclusives',
                    style: GoogleFonts.getFont(
                      'Lato',
                      color: const Color(0xFF0d120E),
                      fontSize: 14,
                      letterSpacing: 0.2,
                    ),
                  ),
                  Image.asset(
                    'assets/images/illustration.png',
                    width: 200,
                    height: 200,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Email',
                        style: GoogleFonts.getFont(
                          'Nunito Sans',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.2,
                        ),
                      )),
                  TextFormField(
                    onChanged: (value) => email = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      labelText: "Enter your email",
                      labelStyle: GoogleFonts.getFont(
                        "Nunito Sans",
                        fontSize: 14,
                        letterSpacing: 0.1,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'assets/icons/email.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Full Name',
                        style: GoogleFonts.getFont(
                          'Nunito Sans',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.2,
                        ),
                      )),
                  TextFormField(
                    onChanged: (value) => fullName = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your full name";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      labelText: "Enter your full name",
                      labelStyle: GoogleFonts.getFont(
                        "Nunito Sans",
                        fontSize: 14,
                        letterSpacing: 0.1,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'assets/icons/user.jpeg',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Password',
                        style: GoogleFonts.getFont(
                          'Nunito Sans',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.2,
                        ),
                      )),
                  TextFormField(
                    onChanged: (value) => password = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your full name";
                      } else {
                        return null;
                      }
                    },
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      labelText: "Enter your password",
                      labelStyle: GoogleFonts.getFont(
                        "Nunito Sans",
                        fontSize: 14,
                        letterSpacing: 0.1,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'assets/icons/password.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        registerUser();
                      } else {
                        print('failed');
                      }
                    },
                    child: Container(
                        width: 310,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 14, 14, 172),
                              Color.fromARGB(255, 14, 14, 172),
                            ],
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: GoogleFonts.getFont(
                          "Nunito Sans",
                          fontSize: 14,
                          letterSpacing: 0.1,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: _isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  "Sign In",
                                  style: GoogleFonts.getFont(
                                    "Lato",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
