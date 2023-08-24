part of 'fixtures_cubit.dart';

@immutable
abstract class FixturesState {}

class FixturesInitial extends FixturesState {}

class ChangePrintDate extends FixturesState {}

class ChangeReceiveDate extends FixturesState {}

class IsLoading extends FixturesState {}

class FixtureAddedSuccessfully extends FixturesState {}
