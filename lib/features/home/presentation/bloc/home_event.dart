part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class InitialHomeEvent extends HomeEvent {
  final BuildContext context;

  const InitialHomeEvent(this.context);

  @override
  List<Object> get props => [context];
}


class OnPageChangeHomeEvent extends HomeEvent {
  final int pageIndex;

  const OnPageChangeHomeEvent(this.pageIndex);

  @override
  List<Object> get props => [pageIndex];
}