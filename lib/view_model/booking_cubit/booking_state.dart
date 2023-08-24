part of 'booking_cubit.dart';

@immutable
abstract class BookingState {}

class BookingInitial extends BookingState {}

class PatientAddedSuccessfully extends BookingState {}

class IsLoading extends BookingState {}

class ChangeDate extends BookingState {}
