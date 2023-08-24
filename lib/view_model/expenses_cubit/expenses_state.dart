part of 'expenses_cubit.dart';

@immutable
abstract class ExpensesState {}

class ExpensesInitial extends ExpensesState {}

class ChangeDate extends ExpensesState {}

class IsLoading extends ExpensesState {}

class ExpensesAddedSuccessfully extends ExpensesState {}
