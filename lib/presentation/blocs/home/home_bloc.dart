

part of 'bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IHomeRepository homeRepository;
  HomeBloc({required this.homeRepository}) : super(HomeFetchingState()) {
    on<HomeFetchingEvent>(_getData);
  }

  _getData(HomeFetchingEvent event, Emitter emit) async{
    await Future.delayed(const Duration(milliseconds: 3000));
    try {
      emit(HomeLoadedState(
          dataList: await homeRepository.getAppeals()
      ));
    }catch(_){
      emit(HomeErrorState());
    }
  }
}
