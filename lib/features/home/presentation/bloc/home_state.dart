part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool loading;
  final int pageIndex;

  const HomeState({
    this.loading = false,
    this.pageIndex = 0,
  });

  factory HomeState.initial() {
    return const HomeState(
      loading: false,
      pageIndex: 0,
    );
  }

  HomeState copyWith({
    bool? loading,
    int? pageIndex,
  }) {
    return HomeState(
      loading: loading ?? this.loading,
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }

  @override
  List<Object> get props => [
        loading,
        pageIndex,
      ];
}
