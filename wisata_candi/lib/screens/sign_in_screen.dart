import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  //TODO: 1.Deklarasikan variable
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';
  bool _isSignIn = false;
  bool _obscurePassword = true;

  void _signIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String savedUsername = prefs.getString('username') ?? '';
    final String savedpassword = prefs.getString('password') ?? '';
    final String enteredUsername = _usernameController.text.trim();
    final String enteredPassword = _passwordController.text.trim();
    
    if (enteredUsername == savedUsername && enteredPassword == savedpassword) {
      setState(() {
        _errorText = '';
        _isSignIn = true;
        prefs.setBool('isSignedIn', true);
      });
      // Pemanggilan untuk menghapus semua halaman dalam tumpukkan navigasi 
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      });
      //Sign In berhasil, navigasikan ke layar utama 
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, '/');
      });
    } else {
      setState(() {
        _errorText = 'Nama Pengguna atau Kata Sandi Salah!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: 2.Pasang AppBar
      appBar: AppBar(
        title: Text('Sign In'),
        ),
      //TODO: 3.Pasang body
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
                child: Column(
                  //TODO: 4.Atur MainAxisAlignment dan CrossAxisAlignment
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //TODO: 5.Pasang TextFormField Nama Pengguna
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: "Nama Pengguna",
                    border: OutlineInputBorder(),
                  ),
                ),
                //TODO: 6.Pasang TextFormField Kata Sandi
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Kata Sandi",
                    errorText: _errorText.isNotEmpty ? _errorText :  null,
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      }, 
                      icon: Icon(_obscurePassword 
                          ? Icons.visibility_off 
                          : Icons.visibility),
                    )
                  ),
                ), 
                //TODO: 7.Pasang ElevatedButton Sign In
                const SizedBox(
                  height: 20,
                  ),
                ElevatedButton(
                  onPressed: (){}, 
                  child: const Text('Sign In'),
                ),
                //TODO: 8.Pasang TextButton Sign Up
                const SizedBox(
                  height: 20,
                ),
                // TextButton(
                //   onPressed: (){}, 
                //   child: const Text('Belum punya akun? Daftar disini.'),
                // ),
                RichText(
                  text: TextSpan(
                    text: 'Belum punya akun?', 
                    style: const TextStyle(fontSize: 16, color: Colors.deepPurple),
                    children: <TextSpan> [
                      TextSpan(
                        text: 'Daftar di sini.',
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = (){
                            Navigator.pushNamed(context, '/signup');
                          },
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}