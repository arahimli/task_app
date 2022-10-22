


import 'package:flutter/material.dart';

import '../../../../domain/uses_cases/common/styles.dart';
import '../../../../generated/assets.dart';

class ListMessageWidget extends StatefulWidget {
  final String text;
  final Function refresh;
  const ListMessageWidget({Key? key, required this.text, required this.refresh}) : super(key: key);

  @override
  _ListMessageWidgetState createState() => _ListMessageWidgetState();
}

class _ListMessageWidgetState extends State<ListMessageWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LayoutBuilder(
        builder: (context, constraint) {
          return RefreshIndicator(
            onRefresh: ()async{
              await widget.refresh();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 1.5 / 10),
                      child: Image.asset(Assets.errorListEmptyMessage),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 1.2 / 10, vertical: 32),
                      child: Text(widget.text, style: MainStyles.boldTextStyle.copyWith(fontSize: 20),),
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}


class ListErrorMessageWidget extends StatefulWidget {
  final String text;
  final Function() refresh;
  const ListErrorMessageWidget({Key? key, required this.text, required this.refresh}) : super(key: key);

  @override
  _ListErrorMessageWidgetState createState() => _ListErrorMessageWidgetState();
}

class _ListErrorMessageWidgetState extends State<ListErrorMessageWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LayoutBuilder(
        builder: (context, constraint) {
          return RefreshIndicator(
            onRefresh: ()async{
              await widget.refresh();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 1.5 / 10),
                      child: Image.asset(Assets.errorErrorWentWrong),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 1.2 / 10, vertical: 32),
                      child: Text(widget.text, style: MainStyles.boldTextStyle.copyWith(fontSize: 20),),
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
