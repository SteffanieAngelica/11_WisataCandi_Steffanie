import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //TODO: 1.Deklarasikan variable
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';

  bool _isSignIn = false;

  bool _obscurePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: 2.Pasang AppBar
      appBar: AppBar(
        title: Text('Sign Up'),
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
                //TODO: 9.Pasang TextFormFieldNama
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: "Nama",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
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
                  child: const Text('Sign Up'),
                ),
                //TODO: 8.Pasang TextButton Sign Up
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: (){}, 
                  child: const Text('Belum punya akun? Daftar disini.'),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Sudah punya akun?', 
                    style: const TextStyle(fontSize: 16, color: Colors.deepPurple),
                    children: <TextSpan> [
                      TextSpan(
                        text: 'Masuk di sini.',
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = (){},
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