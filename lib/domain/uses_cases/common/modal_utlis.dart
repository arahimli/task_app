import 'package:flutter/material.dart';

import '../../../presentation/widgets/components/buttons/big_unborderd_button.dart';
import '../config/main_colors.dart';
import 'styles.dart';
import 'utlis.dart';

class ModalUtils {
  ModalUtils._();




  static dynamic showGeneralInfoModal(BuildContext context, Size size, {String? title, String? text, TextStyle? titleStyle, TextStyle? textStyle, String? image, String? buttonText, Function? onTap}) {

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Dialog(
                shape: const RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.all(
                        Radius.circular(12.0)
                    )
                ),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    // border: Border.all(color: Colors.blueAccent,width: 2),
                      borderRadius:
                      BorderRadius.all(Radius.circular(10.0))),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if(title!=null)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            title,
                            style: titleStyle ?? MainStyles.extraBoldTextStyle.copyWith(fontSize: 32),
                          ),
                        ),
                      // if(title!=null)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: const SizedBox(height: 24,),
                        ),
                      if(text!=null)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Center(
                            child: Text(
                              text,
                              style: textStyle ?? MainStyles.mediumTextStyle.copyWith(fontSize: 18),textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      if(text!=null)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: const SizedBox(height: 24,),
                        ),
                      Divider(color: MainColors.middleGrey200,height: 0,),
                      BigUnBorderedButton(
                        text: buttonText ?? Utils.getString(context, "general__close_button_text"),
                        buttonColor: MainColors.middleGrey100,
                        textColor: MainColors.darkBlue500,
                        borderRadius: 0,
                        onTap: () => onTap ?? Navigator.pop(context) ,
                      )
                    ],
                  ),
                )),
          ],
        );
      },
    );
  }



  static dynamic showInfoByDateModal(BuildContext context, Size size, {String? title, String? text , String? dateText, String? buttonText, Function? onTap, Widget? extraWidget}) {

    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (ctx) {
          return Container(
            padding: const EdgeInsets.symmetric(
                vertical:
                12,
                horizontal:
                16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Container(
                        width: 64,
                        height: 4,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          // borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                  SizedBox(height: size.height * 0.2 / 10,),
                  Text(title ?? '', style: MainStyles.appbarStyle,),
                  SizedBox(height: size.height * 0.2 / 10,),
                  Text(text ?? '', style: MainStyles.mediumTextStyle,),
                  SizedBox(height: size.height * 0.1 / 10,),
                  // Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(dateText ?? '', style: MainStyles.mediumTextStyle.copyWith(fontSize: 14),),
                    ],
                  ),
                  if(extraWidget != null)
                    const Divider(),
                  if(extraWidget != null)
                    extraWidget,
                  BigUnBorderedButton(
                    text: buttonText ?? Utils.getString(context, "general__close_button_text"),
                    onTap: (){
                      onTap!(ctx);
                    },
                    horizontal: 0,
                    vertical: size.height * 0.1 / 10,
                  )
                ],
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          );
        },
        isScrollControlled: true);
  }


}