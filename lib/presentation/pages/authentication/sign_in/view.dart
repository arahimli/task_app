import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/uses_cases/common/modal_utlis.dart';
import '../../../../domain/uses_cases/common/styles.dart';
import '../../../../domain/uses_cases/common/utlis.dart';
import '../../../../domain/uses_cases/config/main_colors.dart';
import '../../../../generated/assets.dart';
import '../../../blocs/authentication/bloc.dart';
import '../../../blocs/signin/bloc.dart';
import '../../../widgets/components/buttons/big_unborderd_button.dart';
import '../../../widgets/components/common/page_padding.dart';
import '../../../widgets/components/form/textfield/general.dart';
import '../../home/page.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MultiBlocListener(
        listeners: [
          BlocListener<SignInFormBloc, SignInFormValidate>(
            listener: (context, state) async{
              if (state.errorMessage.isNotEmpty) {
                ModalUtils.showGeneralInfoModal(context, size, text: state.errorMessage);
              } else if (state.isFormSuccessful) {
                context.read<AuthenticationBloc>().add(AuthenticationStarted());

              } else if (state.isFormValidateFailed) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(Utils.getString(context, "general_form_is_not_valid__title"), style: MainStyles.semiBoldTextStyle,)));
              }
            },
          ),
          BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              if (state is AuthenticationSuccess) {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const HomePage()),
                        (Route<dynamic> route) => false);
              }
            },
          ),
        ],
        child: Scaffold(
            backgroundColor: MainColors.backgroundColor,
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Image.asset(Assets.imagesLogo, height: size.height * 0.3,),
                          Padding(
                              padding: EdgeInsets.only(bottom: size.height * 0.02)),
                          Text(Utils.getString(context, "login_form_page__title"),
                              textAlign: TextAlign.center,
                              style: MainStyles.boldTextStyle.copyWith(fontSize: 24)),
                          Padding(
                              padding: EdgeInsets.only(bottom: size.height * 0.02)),
                        ],
                      ),
                      Padding(
                        padding: const PagePadding.leftRight16(),
                        child: Column(
                          children: [

                            BlocBuilder<SignInFormBloc, SignInFormValidate>(
                              builder: (context, state) {
                                return GeneralTextField(
                                  size: size,
                                  label: Utils.getString(context,
                                      "login_form_page__field__email_label"),
                                  hintText: Utils.getString(
                                      context, "login_form_page__field__email_hint"),
                                  errorText: Utils.getString(context,
                                      "login_form_page__field__email_error_text"),
                                  hasError: !state.isEmailValid,
                                  controller: context
                                      .read<SignInFormBloc>()
                                      .emailController,
                                  // format: [
                                  // ],
                                  toDo: (value) {
                                    context.read<SignInFormBloc>().add(EmailChanged(
                                        value));
                                  },
                                );
                              },
                            ),
                            SizedBox(height: size.height * 0.01),

                            BlocBuilder<SignInFormBloc, SignInFormValidate>(
                              builder: (context, state) {
                                return GeneralTextField(
                                  size: size,
                                  label: Utils.getString(context,
                                      "login_form_page__field__password_label"),
                                  hintText: Utils.getString(
                                      context, "login_form_page__field__password_hint"),
                                  errorText: Utils.getString(context,
                                      "login_form_page__field__password_error_text"),
                                  hasError: !state.isPasswordValid,
                                  obscureText: true,
                                  controller: context
                                      .read<SignInFormBloc>()
                                      .passwordController,
                                  // format: [
                                  // ],
                                  toDo: (value) {
                                    context.read<SignInFormBloc>().add(PasswordChanged(
                                        value));
                                  },
                                );
                              },
                            ),
                            SizedBox(height: size.height * 0.02),
                            BlocBuilder<SignInFormBloc, SignInFormValidate>(
                                builder: (context, state) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: BigUnBorderedButton(
                                        buttonColor: state.isFormValid && !state.isLoading
                                            ? null
                                            : MainColors.middleBlue100,
                                        onTap: () {
                                          Utils.focusClose(context);
                                          if (state.isFormValid && !state.isLoading) {
                                            // showLoading(context, Utils.getString(
                                            //     context, "general__loading_text"));
                                            context.read<SignInFormBloc>().add(
                                                const SignInFormSubmitted());
                                          }
                                        },
                                        text: state.isLoading ? Utils.getString(
                                            context, "general__loading_text") : Utils.getString(context,
                                            "login_form_page__field__submit_button_text")
                                    ),
                                  );
                                }),
                          ],
                        ),
                      )
                    ]),
              ),
            )
        )
    );
  }
}