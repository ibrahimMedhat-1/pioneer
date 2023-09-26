part of 'daily_report_cubit.dart';

@immutable
abstract class DailyReportState {}

class DailyReportInitial extends DailyReportState {}

class GetAllPatientsSuccessfully extends DailyReportState {}

class DeleteAllPatients extends DailyReportState {}
