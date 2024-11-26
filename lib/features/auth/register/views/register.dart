import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soute_wasel/core/Utils/app_color.dart';
import 'package:soute_wasel/core/Utils/routes/app_routes.dart';
import 'package:soute_wasel/core/models/user_model.dart';
import 'package:soute_wasel/features/auth/manager/auth_cubit.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPagePageState();
}

class _RegisterPagePageState extends State<RegisterPage> {
  late final GlobalKey<FormState> _formKey;
  late DateTime date = DateTime.now();
  late final TextEditingController _emailController,
      _passwordController,
      _firstNameController,
      _lastNameController;
  late FocusNode _emailFocusNode,
      _passwordFocusNode,
      _firstNameFocusedNode,
      _lastNameFocusedNode;
  bool visibility = false;
  String? genderValue;
  String? univercityBuilding;
  String? specializationName;
  String? colleqeName;
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _firstNameFocusedNode = FocusNode();
    _lastNameFocusedNode = FocusNode();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  int fieldIndex = 0;
  bool isLastPage = false;
  late UserModel newUser;
  Future<void> register() async {
    debugPrint(
        "first=${_firstNameController.text}, last=${_lastNameController.text}, email=${_emailController.text}, passowrd=${_passwordController.text}");
    // if (_formKey.currentState!.validate()) {
    //   BlocProvider.of<AuthCubit>(context).studentRegister(
    //     StudentRegisterModel(
    //       name: _firstNameController.text,
    //       password: _passwordController.text,
    //       email: _emailController.text,
    //       phoneNumber: _lastNameController.text,
    //       gender: genderValue!,
    //       role: 'طالب',
    //       birthDate: BoardDateFormat("yyyy-MM-dd").format(date),
    //       college: colleqeName!,
    //       specialization: specializationName!,
    //       universityBuilding: univercityBuilding!,
    //     ),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.grey1,
        
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(bottom: 8.0),
                      child: Image.asset(
                        'assets/images/souti_wasel_logo.png',
                        width: size.width,
                        height: size.height * 0.2,
                      ),
                    ),
                  ),
                  Text(
                    'إنشاء حساب',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: AppColor.blue, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.002),
                  Text(
                    'قم بملء الحقول المطلوبة لإنشاء حسابك',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColor.grey),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Text(
                    'الإسم الأول',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  SizedBox(height: size.height * 0.002),
                  TextFormField(
                    textAlign: TextAlign.right,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "الرجاء إدخال الإسم الأول";
                      } else if (!RegExp(r'^[ء-ي\s]+$').hasMatch(value)) {
                        return "الرجاء إدخال إسم صحيح يحتوي على الأحرف العربية فقط";
                      } else {
                        return null;
                      }
                    },
                    onEditingComplete: () {
                      _firstNameFocusedNode.unfocus();
                      FocusScope.of(context).requestFocus(_lastNameFocusedNode);
                    },
                    textInputAction: TextInputAction.next,
                    focusNode: _firstNameFocusedNode,
                    keyboardType: TextInputType.name,
                    controller: _firstNameController,
                    decoration: const InputDecoration(
                      hintText: 'قم بإدخال إسمك الأول',
                      prefixIcon: Icon(
                        Icons.person_outline,
                      ),
                      prefixIconColor: AppColor.grey,
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    'إسم العائلة',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  SizedBox(height: size.height * 0.002),
                  TextFormField(
                    textAlign: TextAlign.right,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "الرجاء إدخال إسم العائلة";
                      } else if (!RegExp(r'^[ء-ي\s]+$').hasMatch(value)) {
                        return "الرجاء إدخال إسم صحيح يحتوي على الأحرف العربية فقط";
                      } else {
                        return null;
                      }
                    },
                    onEditingComplete: () {
                      _lastNameFocusedNode.unfocus();
                      FocusScope.of(context).requestFocus(_emailFocusNode);
                    },
                    textInputAction: TextInputAction.next,
                    focusNode: _lastNameFocusedNode,
                    keyboardType: TextInputType.name,
                    controller: _lastNameController,
                    decoration: const InputDecoration(
                      hintText: 'قم بإدخال إسم العائلة',
                      prefixIcon: Icon(
                        Icons.person_outline,
                      ),
                      prefixIconColor: AppColor.grey,
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    'البريد الإلكتروني',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  SizedBox(height: size.height * 0.002),
                  TextFormField(
                    textAlign: TextAlign.right,
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    onEditingComplete: () {
                      _emailFocusNode.unfocus();
                      FocusScope.of(context).requestFocus(_passwordFocusNode);
                    },
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "قم بإدخال البريد الإلكتروني الخاص بك";
                      } else {
                        // Improved regular expression for validating email
                        String emailPattern =
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                        RegExp regex = RegExp(emailPattern);
                        if (!regex.hasMatch(value)) {
                          return "البريد الإلكتروني غير مناسب";
                        } else {
                          // Additional check for common domains
                          List<String> commonDomains = [
                            "gmail.com",
                            "yahoo.com",
                            "hotmail.com",
                            "outlook.com"
                          ];
                          String domain = value.split('@').last;
                          if (!commonDomains.contains(domain)) {
                            return "البريد الإلكتروني غير مناسب";
                          }
                          return null;
                        }
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: 'قم بإدخال البريد الإلكتروني الخاص بك',
                      prefixIcon: Icon(Icons.email_outlined),
                      prefixIconColor: AppColor.grey,
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    'كلمة المرور',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  SizedBox(height: size.height * 0.002),
                  TextFormField(
                    textAlign: TextAlign.right,
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    obscureText: !visibility,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "قم بإدخال كلمة المرور";
                      } else if (value.length < 8) {
                        return "يجب أن تكون كلمة المرور 8 أحرف على الأقل";
                      } else {
                        return null;
                      }
                    },
                    textInputAction: TextInputAction.done,
                    onEditingComplete: () {
                      _passwordFocusNode.unfocus();
                      if (_formKey.currentState!.validate()) {
                        register();
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'قم بإدخال كلمة المرور',
                      prefixIcon: const Icon(Icons.lock_outline_rounded),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            visibility = !visibility;
                          });
                        },
                        child: Icon(
                          visibility
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                      prefixIconColor: AppColor.grey,
                      suffixIconColor: AppColor.grey,
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  SizedBox(
                    width: double.infinity,
                    child: BlocConsumer<AuthCubit, AuthState>(
                      bloc: BlocProvider.of<AuthCubit>(context),
                      listenWhen: (previous, current) =>
                          current is AuthSuccess || current is AuthError,
                      listener: (context, state) {
                        if (state is AuthSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('تم إنشاء الحساب بنجاح'),
                            ),
                          );
                          Navigator.of(context)
                              .pushNamed(AppRoutes.home, arguments: state.user);
                        } else if (state is AuthError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.message),
                            ),
                          );
                        }
                      },
                      buildWhen: (previous, current) =>
                          current is AuthLoading || current is AuthError,
                      builder: (context, state) {
                        if (state is AuthLoading) {
                          return ElevatedButton(
                            onPressed: null,
                            style: ElevatedButton.styleFrom(
                              padding:
                                  EdgeInsetsDirectional.all(size.width * 0.025),
                              backgroundColor: AppColor.blue,
                              foregroundColor: AppColor.white,
                            ),
                            child: const Center(
                              child: CircularProgressIndicator.adaptive(),
                            ),
                          );
                        } else {
                          return ElevatedButton(
                            onPressed: register,
                            style: ElevatedButton.styleFrom(
                              padding:
                                  EdgeInsetsDirectional.all(size.width * 0.025),
                              backgroundColor: AppColor.blue,
                              foregroundColor: AppColor.white,
                            ),
                            child: Text(
                              'إنشاء الحساب',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      color: AppColor.white,
                                      fontWeight: FontWeight.w600),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
