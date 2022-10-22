import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/uses_cases/common/modal_utlis.dart';
import '../../../../domain/uses_cases/common/styles.dart';
import '../../../../domain/uses_cases/common/utlis.dart';
import '../../../../domain/uses_cases/config/main_colors.dart';
import '../../../../generated/assets.dart';
import '../../../blocs/authentication/bloc.dart';
import '../../../blocs/signup/bloc.dart';
import '../../../widgets/components/buttons/big_unborderd_button.dart';
import '../../../widgets/components/common/page_padding.dart';
import '../../../widgets/components/form/textfield/general.dart';
import '../../home/page.dart';
import '../sign_in/page.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MultiBlocListener(
        listeners: [
          BlocListener<SignUpFormBloc, SignUpFormValidate>(
            listener: (context, state) async{
              if (state.errorMessage.isNotEmpty) {
                ModalUtils.showGeneralInfoModal(context, size, text: state.errorMessage);
              } else if (state.isFormSuccessful) {
                if(state.warningMessage != ''){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(dismissDirection: DismissDirection.endToStart,content: Text(Utils.getString(context, state.warningMessage), style: MainStyles.semiBoldTextStyle.copyWith(color: MainColors.white),)));
                }
                Navigator.pushNamed(context, SignInPage.pageUrl);

              }else if (state.isFormValidateFailed) {
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
                          Text(Utils.getString(context, "sign_up_form_page__title"),
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

                            SizedBox(height: size.height * 0.01),
                            BlocBuilder<SignUpFormBloc, SignUpFormValidate>(
                              builder: (context, state) {
                                return GeneralTextField(
                                  size: size,
                                  label: Utils.getString(context,
                                      "sign_up_form_page__field__full_name_label"),
                                  hintText: Utils.getString(
                                      context, "sign_up_form_page__field__full_name_hint"),
                                  errorText: Utils.getString(context,
                                      "sign_up_form_page__field__full_name_error_text"),
                                  hasError: !state.isFullNameValid,
                                  controller: context
                                      .read<SignUpFormBloc>()
                                      .fullNameController,
                                  // format: [
                                  // ],
                                  toDo: (value) {
                                    context.read<SignUpFormBloc>().add(FullNameChanged(
                                        value));
                                  },
                                );
                              },
                            ),
                            SizedBox(height: size.height * 0.01),
                            BlocBuilder<SignUpFormBloc, SignUpFormValidate>(
                              builder: (context, state) {
                                return GeneralTextField(
                                  size: size,
                                  label: Utils.getString(context,
                                      "sign_up_form_page__field__email_label"),
                                  hintText: Utils.getString(
                                      context, "sign_up_form_page__field__email_hint"),
                                  errorText: Utils.getString(context,
                                      "sign_up_form_page__field__email_error_text"),
                                  hasError: !state.isEmailValid,
                                  controller: context
                                      .read<SignUpFormBloc>()
                                      .emailController,
                                  // format: [
                                  // ],
                                  toDo: (value) {
                                    context.read<SignUpFormBloc>().add(EmailChanged(
                                        value));
                                  },
                                );
                              },
                            ),
                            SizedBox(height: size.height * 0.01),

                            BlocBuilder<SignUpFormBloc, SignUpFormValidate>(
                              builder: (context, state) {
                                return GeneralTextField(
                                  size: size,
                                  obscureText: true,
                                  label: Utils.getString(context,
                                      "sign_up_form_page__field__password_label"),
                                  hintText: Utils.getString(
                                      context, "sign_up_form_page__field__password_hint"),
                                  errorText: Utils.getString(context,
                                      "sign_up_form_page__field__password_error_text"),
                                  hasError: !state.isPasswordValid,
                                  controller: context
                                      .read<SignUpFormBloc>()
                                      .passwordController,
                                  // format: [
                                  // ],
                                  toDo: (value) {
                                    context.read<SignUpFormBloc>().add(PasswordChanged(
                                        value));
                                  },
                                );
                              },
                            ),
                            SizedBox(height: size.height * 0.02),
                            BlocBuilder<SignUpFormBloc, SignUpFormValidate>(
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
                                            context.read<SignUpFormBloc>().add(
                                                const SignUpFormSubmitted());
                                          }
                                        },
                                        text: state.isLoading ? Utils.getString(
                                            context, "general__loading_text") : Utils.getString(context,
                                            "sign_up_form_page__field__submit_button_text")
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