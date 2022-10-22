part of 'bloc.dart';

@immutable
abstract class HomeState extends Equatable{}

class HomeFetchingState extends HomeState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class HomeLoadedState extends HomeState {
  final List<AppealModel> dataList;

  HomeLoadedState({this.dataList = const []});

  HomeLoadedState copyWith({
    List<AppealModel>? dataList,
  }) {
    return HomeLoadedState(
      dataList: dataList ?? this.dataList,
    );
  }

  @override
  List<Object> get props => [dataList];

  @override
  String toString() =>
      'HomeLoadedState { mainData: ${dataList.length} }';
}
class HomeErrorState extends HomeState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}