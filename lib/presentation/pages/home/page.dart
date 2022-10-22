
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_app/generated/assets.dart';

import '../../../data/repositories/home/home_repository.dart';
import '../../../domain/uses_cases/common/modal_utlis.dart';
import '../../../domain/uses_cases/common/styles.dart';
import '../../../domain/uses_cases/common/utlis.dart';
import '../../../domain/uses_cases/config/get_it.dart';
import '../../../domain/uses_cases/config/main_colors.dart';
import '../../../domain/uses_cases/models/appeal/appeal.dart';
import '../../blocs/authentication/bloc.dart';
import '../../blocs/home/bloc.dart';
import '../../widgets/components/page_messages/list_message.dart';
import '../../widgets/components/skeleton/skeleton_list_widget.dart';
import '../../widgets/home/home_data_item_shimmer.dart';
import '../main/view.dart';
part 'view.dart';


class HomePage extends StatefulWidget {

  static const String pageUrl = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (BuildContext context) => HomeBloc(
          homeRepository: getIt<HomeRepository>()
      )..add(HomeFetchingEvent()),
      child: const HomeView(),
    );
  }
}
