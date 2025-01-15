import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login Your Account",
                style: GoogleFonts.getFont(
                  "Lato",
                  color: Color(0xFF0d120E),
                  fontWeight: FontWeight.bold, 
                  fontSize:23,
                ),
              ),
              Text(
                'To Explore the world exclusives',
                style: GoogleFonts.getFont(
                  'Lato',
                  color: Color(0xFF0d120E),
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
                )
              ),
        
        
              TextFormField(
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
        
              SizedBox(
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
                )
              ),

              TextFormField(
                obscureText: true,
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
                  suffixIcon: Icon(Icons.visibility),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Container(
                width: 310,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 14, 14, 172),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Center(
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                )
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: GoogleFonts.getFont(
                      "Nunito Sans",
                      fontSize: 14,
                      letterSpacing: 0.1,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.getFont(
                        "Nunito Sans",
                        fontSize: 14,
                        letterSpacing: 0.1,
                        color: Color.fromARGB(255, 14, 14, 172),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}