part of 'area_bloc.dart';

abstract class AreaState extends Equatable {
  const AreaState();
}

class AreaInitial extends AreaState {
  @override
  List<Object> get props => [];
}

class AreaLoadingState extends AreaState{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class AreaLoadedState extends AreaState{
  List<Area> areas;
  AreaLoadedState({@required this.areas});
  @override
  List<Object> get props => [areas];
}

class AreaErrorState extends AreaState{
  @override
  List<Object> get props => throw UnimplementedError();
}
