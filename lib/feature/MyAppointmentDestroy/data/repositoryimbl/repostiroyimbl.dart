import 'package:my_mydical/feature/MyAppointmentDestroy/domain/antites/antites.dart';
import 'package:my_mydical/feature/MyAppointmentDestroy/domain/repository/repostiory.dart';

import '../remotedata/remotedata.dart';

class RepositoryImblMyAppointmentDestroy
    extends RepositoryMyAppointmentDestroy {
  RemoteDataMyAppointmentDestroy remoteDataMyAppointmentDestroy;
  RepositoryImblMyAppointmentDestroy(
      {required this.remoteDataMyAppointmentDestroy});
  @override
  Future<List<MyAppointmentDestroy>> Destroy() async {
    try {
      final remotedata = await remoteDataMyAppointmentDestroy.Destroy();
      return remotedata;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
