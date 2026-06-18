import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final hintStyle = TextStyle(
    color: Color(int.parse('FFBDBDBD', radix: 16)),
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
  );

  final borderSide = UnderlineInputBorder(
    borderSide: BorderSide(
      color: Color.from(alpha: 0.15, red: 0, green: 0, blue: 0),
    ),
  );

  static final _phoneRegExp = RegExp(r'^1[3-9]\d{9}$');

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();
  bool isvisibility = false;

  @override
  void initState() {
    super.initState();
    userNameController.text = '13345678911';
    passwordController.text = '24141256';
  }

  void handleSubmit() {
    if ((formKey.currentState as FormState).validate()) {
      debugPrint(userNameController.text);
      debugPrint(passwordController.text);
      context.push('/chooseRole');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(toolbarHeight: 0, backgroundColor: Colors.white),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 152.0,
              horizontal: 64.0,
            ),
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUnfocus,
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  const Text(
                    '欢迎登录',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 32.0),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: TextFormField(
                      controller: userNameController,
                      keyboardType: TextInputType.number,
                      maxLength: 11,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        hintText: '请输入手机号',
                        hintStyle: hintStyle,
                        contentPadding: const EdgeInsets.fromLTRB(
                          0,
                          0,
                          0,
                          16.0,
                        ),
                        enabledBorder: borderSide,
                        focusedBorder: borderSide,
                        counter: const SizedBox.shrink(),
                      ),
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return '请输入手机号';
                        }
                        if (!_phoneRegExp.hasMatch(v)) {
                          return '请输入正确的手机号';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: !isvisibility,
                      decoration: InputDecoration(
                        hintText: '请输入密码',
                        hintStyle: hintStyle,
                        contentPadding: const EdgeInsets.fromLTRB(
                          0,
                          0,
                          0,
                          16.0,
                        ),
                        enabledBorder: borderSide,
                        focusedBorder: borderSide,
                        suffixIcon: Transform.translate(
                          offset: const Offset(10, -12),
                          child: IconButton(
                            style: IconButton.styleFrom(
                              highlightColor: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                isvisibility = !isvisibility;
                              });
                            },
                            icon: isvisibility
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                          ),
                        ),
                      ),
                      validator: (v) =>
                          v!.trim().length > 5 ? null : "密码不能少于6位",
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        handleSubmit();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(
                          int.parse('FF3D7EFF', radix: 16),
                        ),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        textStyle: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      child: const Text('立即登录'),
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
