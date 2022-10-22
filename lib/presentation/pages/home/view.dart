part of 'page.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationFailure) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const MainView()),
                    (Route<dynamic> route) => false);
          }
        },
        buildWhen: ((previous, current) {
          if (current is AuthenticationFailure) {
            return false;
          }
          return true;
        }),
      builder: (context, authState) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              Utils.getString(context, "home_page__title")
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: (){
                  context.read<AuthenticationBloc>().add(AuthenticationSignedOut());
                }, icon: const Icon(Icons.logout)
              ),
            ],
          ),
            body: const _DataListWidget()
        );
      }
    );
  }
}




class _DataListWidget extends StatefulWidget {
  const _DataListWidget({Key? key}) : super(key: key);

  @override
  _DataListWidgetState createState() => _DataListWidgetState();
}

class _DataListWidgetState extends State<_DataListWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state){
        },
        builder: (BuildContext context, state){
          return state is HomeLoadedState ?
          state.dataList.isNotEmpty ?
          LayoutBuilder(
              builder: (context, constraints) {
                return RefreshIndicator(
                  onRefresh: ()async{
                    BlocProvider.of<HomeBloc>(context).add(HomeFetchingEvent());
                  },
                  child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            minHeight: constraints.maxHeight
                        ),
                        // padding: const PagePadding.leftRight16(),
                        child: Column(
                          children: state.dataList.map((e) => _DataItemWidget(dataItem: e)).toList(),
                        ),
                      )
                  ),
                );
              }
          ) :
          ListMessageWidget(
            refresh: () {
              BlocProvider.of<HomeBloc>(context).add(HomeFetchingEvent());
            },
            text: Utils.getString(context, "general__list__empty_message"),
          ) :
          state is HomeErrorState ?
          ListErrorMessageWidget(
            refresh: (){
              BlocProvider.of<HomeBloc>(context).add(HomeFetchingEvent());
            },
            text: Utils.getString(context, "error_went_wrong"),
          ):
          SkeletonListWidget(
            itemCount: ((size.height - 200)  / 100).round(),
            child: const HomeListItemShimmerWidget(),
          );
        }
    );
  }
}






class _DataItemWidget extends StatelessWidget {
  final AppealModel dataItem;
  const _DataItemWidget({Key? key, required this.dataItem}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        ModalUtils.showInfoByDateModal(context, size, title: dataItem.title, text: dataItem.content, buttonText: Utils.getString(context, "general__close_button_text"), dateText: dataItem.date.toString(),
            extraWidget: _FileListWidget(files: dataItem.files,)
            , onTap: (ctx){Navigator.pop(ctx);});
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Container(
          // padding: const EdgeInsets.symmetric(horizontal: 12),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: MainColors.middleGrey150!
                  )
              )
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      if(dataItem.date != null)
                      Text(
                        dataItem.date.toString(),
                        style: MainStyles.extraBoldTextStyle.copyWith(color: MainColors.middleGrey400, fontSize: 12, height: 1.1),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if(dataItem.title != null && dataItem.title != '')
                        const SizedBox(height: 8),
                      if(dataItem.title != null && dataItem.title != '')
                        Text(
                          dataItem.title!,
                          style: MainStyles.boldTextStyle.copyWith(color: MainColors.middleGrey750, fontSize: 16, height: 1.1),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      const SizedBox(height: 8),
                      Text(
                        dataItem.content ?? "-",
                        style: MainStyles.semiBoldTextStyle.copyWith(color: MainColors.middleGrey750, fontSize: 14, height: 1.1),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(dataItem.status == true ? Assets.svgsCheck : Assets.svgsTime, color: dataItem.status == true ? MainColors.green : null, height: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class _FileListWidget extends StatelessWidget {
  final List<String>? files;
  const _FileListWidget({Key? key, this.files}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return files != null && files!.isNotEmpty ? Container(
      padding: const EdgeInsets.all(4),
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: files!.length,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (context, index) {
            return _FileWidget(file: files![index],);
          }),
    ):Container();
  }
}



class _FileWidget extends StatelessWidget {
  final String file;
  const _FileWidget({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isImage = Utils.isImage(file.split('?')[0]);
    return Stack(
      children: [
        if(isImage)
          const Center(
            child: CircularProgressIndicator(),
          ),
        Container(
          margin: const EdgeInsets.all(3),
          decoration: isImage ? BoxDecoration(
              color: MainColors.middleGrey150!.withOpacity(0.6),
              image: DecorationImage(
                  image: NetworkImage(file),
                  fit: BoxFit.cover)) : BoxDecoration(
              color: MainColors.darkPink100!.withOpacity(0.6)
          ),
          child: !isImage ? Center(
            child: Text(Utils.getExtensionFile(file.split('?')[0]).toUpperCase(), style: MainStyles.boldTextStyle.copyWith(fontSize: 20),),
          ):Container(),
        ),
      ],
    );
  }
}

