import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mockup_bloc/core/mvp/base_page.dart';
import 'package:flutter_mockup_bloc/core/mvp/base_state_view.dart';
import 'package:flutter_mockup_bloc/presentation/router/app_pages.dart';
import 'package:flutter_mockup_bloc/presentation/router/app_router.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/common/custom_text_field.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/common/load_image.dart';
import 'package:flutter_mockup_bloc/presentation/widgets/common/loading_button.dart';
import 'package:flutter_mockup_bloc/presenters/login_presenter.dart';
import 'package:flutter_mockup_bloc/resource/app_constant.dart';
import 'package:flutter_mockup_bloc/resource/gaps.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with BasePageMixin<LoginScreen, LoginPresenter> implements LoginView{
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  final usernameNode = FocusNode();
  final passwordNode = FocusNode();

  @override
  void dispose() async {
    username.dispose();
    password.dispose();
    usernameNode.dispose();
    passwordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          body: BlocProvider(
              create: (_) => presenter!.cubit,
            child: BlocBuilder<LoginCubit, BaseState>(
                builder: (context, state){
                  print("state: ${state}");
                  return SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      alignment: Alignment.center,
                      width: screenSize.width /
                          (2 / (screenSize.height / screenSize.width)),
                      constraints: const BoxConstraints(maxWidth: 700),
                      child: AutofillGroup(
                        child: Column(
                          children: <Widget>[
                            const SizedBox(height: 60),
                            Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 60,
                                      child: LoadImage(
                                        AppConstants.logo_app,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Gaps.vGap80,
                            CustomTextField(
                              key: const Key('loginEmailField'),
                              controller: username,
                              autofillHints: const [AutofillHints.email],
                              showCancelIcon: true,
                              autocorrect: false,
                              enableSuggestions: false,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              nextNode: passwordNode,
                              decoration: InputDecoration(
                                labelText: AppConstants.user_name_input,
                                hintText: AppConstants.user_name_input_hint,
                              ),
                            ),
                            CustomTextField(
                              key: const Key('loginPasswordField'),
                              autofillHints: const [AutofillHints.password],
                              obscureText: true,
                              showEyeIcon: true,
                              textInputAction: TextInputAction.done,
                              controller: password,
                              focusNode: passwordNode,
                              decoration: InputDecoration(
                                labelText: AppConstants.password_input,
                                hintText: AppConstants.password_input_hint,
                              ),
                            ),
                            Gaps.vGap24,
                            LoadingButton(
                              title: "Đăng nhập",
                              isLoading: state is LoadingState,
                              onSubmit: (){
                                _login();
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
        )
    );
  }

  void _login() async {
    if (username.text.isEmpty || password.text.isEmpty) {
      showToast("Vui lòng nhập đầy đủ thông tin");
    } else {
      presenter!.loginUser(username.text, password.text);
    }
  }

  @override
  LoginPresenter createPresenter() => LoginPresenter();

  @override
  void initViewDone() {
    // TODO: implement initViewDone
  }

  @override
  void gotoHome() {
    // TODO: implement gotoHome
    AppRouter.toPage(context, AppPages.Navigation);
  }

  @override
  void tryAgain() {
    // TODO: implement tryAgain
  }
}
