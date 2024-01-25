import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotifier/application/usecases/auth/sign_in.dart';
import 'package:spotifier/ui/theme/fonts.dart';
import 'package:spotifier/ui/widgets/primary_button.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  // テキストフィールドコントローラ
  final _emailTextEditingController = TextEditingController();
  final _passwordTextEditingController = TextEditingController();

  // パスワードを表示するかどうか
  bool _isHiddenPassword = true;

  // パスワードの表示を切り替える
  void toggleShowPassword() {
    setState(() => _isHiddenPassword = !_isHiddenPassword);
  }

  // テキストフォームのタイトル
  Widget textFormFieldTitle(String title) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: AppText.bodyM,
      ),
    );
  }

  // テキストフォームの本体
  Widget textFormFieldBody({
    required controller,
    String? hintText,
    bool isHiddenText = false,
    Widget? suffixIcon,
    void Function(String)? onChanged,
  }) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: "パスワードを入力してください",
        suffixIcon: suffixIcon,
      ),
      onChanged: onChanged,
      obscureText: isHiddenText,
      focusNode: FocusNode(),
      maxLength: 40,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (inputText) {
        if (inputText == null || inputText == '') {
          return '入力してください';
        } else if (inputText.contains(' ')) {
          return 'スペースが含まれています';
        }
        return null;
      },
    );
  }

  // パスワードテキストフィールドの右端に設置するIcon（押すとパスが表示されることを想定）
  Widget suffixIcon({
    String text = "Show",
    void Function()? onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // メアド、パスワードの状態
    final email = ref.watch(emailProvider.notifier);
    final password = ref.watch(passwordProvider.notifier);

    // メールアドレス入力に関するWidget
    final emailTextFormFieldTitle = textFormFieldTitle('メールアドレス');
    final emailTextFormFieldBody = textFormFieldBody(
      controller: _emailTextEditingController,
      hintText: 'メールアドレスを入力してください',
      onChanged: (value) => email.update(value),
    );

    // パスワード入力に関するWidget
    final passwordTextFormFieldTitle = textFormFieldTitle('パスワード');
    final passwordTextFormFieldBody = textFormFieldBody(
      controller: _passwordTextEditingController,
      hintText: 'パスワードを入力してください',
      isHiddenText: _isHiddenPassword,
      suffixIcon: suffixIcon(
        onPressed: toggleShowPassword,
      ),
      onChanged: (value) => password.update(value),
    );

    // ボタン
    final button = PrimaryButton(
      label: 'サインイン',
      onPressed: () async {
        // サインイン実行
        await ref.read(signInProvider.future).catchError(
              (e) => debugPrint('🍎${e.toString()}'),
            );
      },
    );

    /// 画面全体
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 100),
            emailTextFormFieldTitle,
            emailTextFormFieldBody,
            const SizedBox(height: 20),
            passwordTextFormFieldTitle,
            passwordTextFormFieldBody,
            const SizedBox(height: 20),
            button,
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
