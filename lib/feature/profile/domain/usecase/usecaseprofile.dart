import 'package:dartz/dartz.dart';
import 'package:my_mydical/feature/nurses/domain/repository/repository.dart';
import 'package:my_mydical/feature/profile/domain/antites/antitesprofile.dart';
import 'package:my_mydical/feature/profile/domain/repository/repositoryprofile.dart';

class UseCaseProfile {
  RepositoryProfile repositoryProfile;
  UseCaseProfile({required this.repositoryProfile});
  Future<Either<Faluer, DataProfile>> call() async {
    return await repositoryProfile.Profile();
  }
}
