import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../model/patient_model.dart';

part 'daily_report_state.dart';

class DailyReportCubit extends Cubit<DailyReportState> {
  DailyReportCubit() : super(DailyReportInitial());
  static DailyReportCubit get(context) => BlocProvider.of(context);
  String drNameValue = 'الدكتور';
  List<PatientModel> patients = [];
  void getPatients() {
    var name = drNameValue.split('/');
    drNameValue = name.join();
    FirebaseFirestore.instance.collection('doctors').doc(drNameValue).collection('patients').get().then((value) {
      value.docs.forEach((element) {
        patients.add(PatientModel.fromJson(element.data()));
        emit(GetPatientsSuccessfully());
      });
    });
  }
}
