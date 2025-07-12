import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:water_tracking/screens/login/cubit/login_cubit.dart';
import 'package:water_tracking/screens/register/cubit/register_cubit.dart';
import 'package:water_tracking/screens/splash/splash_screen.dart';

import '../../core/constants/app_theme_const.dart';
import '../../core/enum/app_enum.dart';
import '../../i18n/strings.g.dart';
import '../../widgets/form/app_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    super.key,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late final RegisterCubit registerCubit;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    registerCubit = RegisterCubit();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state.status == BlocStatus.success) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SplashScreen(),
                ),
              );
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
              ),
              body: SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Gap(10),
                          Text(
                            t.core.createAccountToTrack,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const Gap(10),
                          // Email textfield
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25,
                            ),
                            child: AppTextField(
                              controller: _emailController,
                              hintText: t.core.email,
                              prefixIcon: const Icon(Icons.email),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Email is required';
                                }
                                final emailRegex = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                                if (!emailRegex.hasMatch(value)) {
                                  return 'Invalid email';
                                }
                                return null;
                              },
                            ),
                          ),
                          const Gap(10),

                          // Password textfield
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25,
                            ),
                            child: AppTextField(
                              controller: _passwordController,
                              hintText: t.core.password,
                              prefixIcon: const Icon(Icons.lock),
                              obscureText: true,
                            ),
                          ),
                          const Gap(10),

                          // Password textfield
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25,
                            ),
                            child: AppTextField(
                              controller: _passwordController,
                              hintText: t.core.confirmPassword,
                              prefixIcon: const Icon(Icons.lock),
                              obscureText: true,
                            ),
                          ),
                          const Gap(30),
                          // Sign in
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25,
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: AppThemeConst.primaryColor,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  // if (_formKey.currentState!.validate()) {
                                  //   loginCubit.login(
                                  //     _emailController.text.trim(),
                                  //     _passwordController.text.trim(),
                                  //   );
                                  // }
                                },
                                child: state.status == BlocStatus.loading
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : Center(
                                        child: Text(
                                          t.core.login,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),

                          // Register
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                t.core.dontHaveAccount,
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  LocaleSettings.setLocale(AppLocale.vi);
                                },
                                child: Text(
                                  " ${t.core.login}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
