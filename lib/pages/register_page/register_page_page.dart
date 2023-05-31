import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/auth_service.dart';
import '../home_page.dart';
import '../login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController passwordconfirmController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: const Text('Register Page'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Icon(Icons.account_box, size: 100),
              const SizedBox(height: 30),
              TextField(
                controller: emailController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: passwordController,
                obscureText: true,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: passwordconfirmController,
                obscureText: true,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              loading
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });
                          if (emailController.text == '' || passwordController.text == '') {
                            Get.snackbar(
                              'Error',
                              'All Fields are required!',
                              snackPosition: SnackPosition.BOTTOM,
                              colorText: Colors.white,
                              backgroundColor: Colors.red,
                            );
                          } else if (passwordController.text != passwordconfirmController.text) {
                            Get.snackbar(
                              'Error',
                              "Password does't match!",
                              snackPosition: SnackPosition.BOTTOM,
                              colorText: Colors.white,
                              backgroundColor: Colors.red,
                            );
                          } else {
                            await AuthService().register(emailController.text, passwordController.text);
                            Get.to(() => const HomePage(), fullscreenDialog: true);
                          }
                          setState(() {
                            loading = false;
                          });
                        },
                        child: const Text('Submit', style: TextStyle(fontSize: 24)),
                      ),
                    ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () => Get.to(() => const LoginPage()),
                child: const Text('Already have an account? Login here'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
