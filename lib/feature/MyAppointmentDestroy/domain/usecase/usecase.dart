import 'package:my_mydical/feature/MyAppointmentDestroy/domain/antites/antites.dart';

import '../repository/repostiory.dart';

class UseCaseMyAppointemetDestroy {
  RepositoryMyAppointmentDestroy repositoryMyAppointmentDestroy;
  UseCaseMyAppointemetDestroy({required this.repositoryMyAppointmentDestroy});
  Future<List<MyAppointmentDestroy>> call() async {
    return await repositoryMyAppointmentDestroy.Destroy();
  }
}
