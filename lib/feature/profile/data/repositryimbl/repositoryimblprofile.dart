import 'package:my_mydical/feature/profile/data/remotedata/remotedataprofile.dart';
import 'package:my_mydical/feature/profile/domain/antites/antitesprofile.dart';
import 'package:my_mydical/feature/nurses/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:my_mydical/feature/profile/domain/repository/repositoryprofile.dart';

class RepositoryImblProfile extends RepositoryProfile {
  RemoteDataProfile remoteDataProfile;
  RepositoryImblProfile({required this.remoteDataProfile});
  @override
  Future<Either<Faluer, DataProfile>> Profile() async {
    try {
      final remotewithapi = await remoteDataProfile.remotedata();
      return Right(remotewithapi);
    } catch (e) {
      throw Exception();
    }
  }
}
