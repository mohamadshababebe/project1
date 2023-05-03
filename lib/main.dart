import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:my_mydical/feature/AddAppointment/presentaion/page/AddapointmentPage.dart';
import 'package:my_mydical/feature/Doctors/data/remotedata/remtedataDoctor.dart';
import 'package:my_mydical/feature/Doctors/data/repositoryimbl/repositoryimblDoctor.dart';
import 'package:my_mydical/feature/Doctors/domain/usecase/getalldatadoctor.dart';
import 'package:my_mydical/feature/Doctors/presentaion/pages/Doctorpage.dart';
import 'package:my_mydical/feature/MyAppointment/data/remotedata/remotedata.dart';
import 'package:my_mydical/feature/MyAppointment/data/repositoryimbl/repositoryimbl.dart';
import 'package:my_mydical/feature/MyAppointment/domain/repository/repository.dart';
import 'package:my_mydical/feature/MyAppointment/domain/usecase/usecase.dart';
import 'package:my_mydical/feature/MyAppointmentDestroy/data/remotedata/remotedata.dart';
import 'package:my_mydical/feature/MyAppointmentDestroy/data/repositoryimbl/repostiroyimbl.dart';
import 'package:my_mydical/feature/MyAppointmentDestroy/domain/usecase/usecase.dart';

import 'package:my_mydical/feature/auth/data/datasorce/remotedata.dart';
import 'package:my_mydical/feature/auth/data/repositryimbl/repositoryImbl.dart';
import 'package:my_mydical/feature/auth/domain/usecase/loginusecase.dart';
import 'package:my_mydical/feature/auth/presentation/pages/loginpage.dart';
import 'package:my_mydical/feature/bottomnavigationbar/homepage.dart';
import 'package:my_mydical/feature/nurses/data/remotedata/remotedata.dart';
import 'package:my_mydical/feature/nurses/data/repositryimbl/repositoryimbl.dart';
import 'package:my_mydical/feature/nurses/domain/usecase/getallnursesusecase.dart';
import 'package:my_mydical/feature/pharmacy/data/datasource/remtedata.dart';
import 'package:my_mydical/feature/pharmacy/data/repositoryimbl/repositryimbl.dart';
import 'package:my_mydical/feature/pharmacy/domain/usecase/usecasepharmcy.dart';
import 'package:my_mydical/feature/profile/data/remotedata/remotedataprofile.dart';
import 'package:my_mydical/feature/profile/data/repositryimbl/repositoryimblprofile.dart';
import 'package:my_mydical/feature/profile/domain/usecase/usecaseprofile.dart';

import 'feature/AddAppointment/data/remotedata/remotedataaddapointment.dart';
import 'feature/AddAppointment/data/repositryimbl/repositoryimbladdapointment.dart';
import 'feature/AddAppointment/domain/usecase/addapontmentusecase.dart';
import 'feature/AddAppointment/presentaion/bloc/bloc/add_bloc.dart';
import 'feature/Doctors/presentaion/bloc/bloc/doctor_bloc.dart';

import 'feature/MyAppointment/presentaion/bloc/bloc/my_appointment_bloc.dart';
import 'feature/MyAppointment/presentaion/blocdelete/bloc/delete_bloc.dart';
import 'feature/MyAppointment/presentaion/blocupdate/bloc/update_bloc.dart';
import 'feature/MyAppointment/presentaion/widget/myAppointment.dart';
import 'feature/MyAppointmentDestroy/presentaion/bloc/bloc/destroy_bloc.dart';
import 'feature/auth/data/models/errors.dart';
import 'feature/auth/presentation/blocAuth/bloc/auth_bloc.dart';
import 'feature/nurses/presentation/bloc/bloc/nurses_bloc.dart';
import 'feature/nurses/presentation/pages/NursesPage.dart';
import 'feature/pharmacy/presentaion/bloc/bloc/pharmacy_bloc.dart';
import 'feature/profile/presentation/bloc/bloc/profile_bloc.dart';
import 'feature/splashscreen/page/splashscreenpage.dart';
import 'feature/splashscreen/splashscreenbloc/bloc/splash_screen_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashScreenBloc()..add(SetSplashScreenEvent()),
        ),
        BlocProvider(
          create: (context) => AuthBloc(
              loginUseCase: LoginUseCase(
                  repositry: RepositryImbl(
                      remoteData: RemoteDataImbl(client: Client())))),
        ),
        BlocProvider(
          create: (context) => NursesBloc(
              getAllNursesUsesCase: GetAllNursesUsesCase(
                  repositryNurse: RepositoryImblNurses(
                      remoteDataNurses:
                          RemoteDataImblNurses(client: Client()))))
            ..add(GetAllNursesEvent()),
        ),
        BlocProvider(
          create: (context) => DoctorBloc(
              getalldatausecase: GetAllDoctorUseCase(
                  repositoryDoctor: RepositoryImblDoctor(
                      remoteDataDoctor:
                          RemoteDataImblDoctor(client: Client()))))
            ..add(GetAllDoctorEvent()),
        ),
        BlocProvider(
          create: (context) => PharmacyBloc(
              getallPharmacyusecase: getallPharmacyUsecase(
                  repositoryPharmicy: RepositryImblPharmcy(
                      remoteDataPharmacy:
                          RemoteDataPharmacyImbl(client: Client()))))
            ..add(GetallPharmecyEvent()),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(
              useCaseProfile: UseCaseProfile(
                  repositoryProfile: RepositoryImblProfile(
                      remoteDataProfile:
                          RemoteDataImblProfile(client: Client()))))
            ..add(SucProfileEvent()),
        ),
        BlocProvider(
            create: (context) => AddBloc(
                useCaseAddAppointment: UseCaseAddAppointment(
                    repositryAdd: RepositryImblAdd(
                        remoteDataAdd: RemoteDataImblAdd(client: Client()))),
                usecaseDoctorData: UsecaseDoctorData(
                    repositryAdd: RepositryImblAdd(
                        remoteDataAdd: RemoteDataImblAdd(client: Client()))),
                useCaseDoctorTime: UseCaseDoctorTimes(
                    repositryAdd: RepositryImblAdd(
                        remoteDataAdd: RemoteDataImblAdd(client: Client()))))
              ..add(GetDoctorEvent())),
        BlocProvider(
          create: (context) => MyAppointmentBloc(
              useCaseDoctorTime: UseCaseDoctorTime(
                  repositryMyAppointmentAdd: RepositryImblMyAppointment(
                      remoteDataMyAppointment:
                          RemoteDataImblMyAppointment(client: Client()))),
              usecaseDoctorData: UsecaseDoctorDatas(
                  repositoryMyAppointment: RepositryImblMyAppointment(
                      remoteDataMyAppointment:
                          RemoteDataImblMyAppointment(client: Client()))),
              usecaseMyAppointment: UsecaseMyAppointment(
                  repositoryMyAppointment: RepositryImblMyAppointment(
                      remoteDataMyAppointment:
                          RemoteDataImblMyAppointment(client: Client()))))
            ..add(MyAppointmentEventSuc()),
        ),
        BlocProvider(
          create: (context) => UpdateBloc(
              useCaseDoctorTime: UseCaseDoctorTime(
                  repositryMyAppointmentAdd: RepositryImblMyAppointment(
                      remoteDataMyAppointment:
                          RemoteDataImblMyAppointment(client: Client()))),
              usecaseMyAppointment: UsecaseMyAppointment(
                repositoryMyAppointment: RepositryImblMyAppointment(
                  remoteDataMyAppointment: RemoteDataImblMyAppointment(
                    client: Client(),
                  ),
                ),
              ),
              useCaseUpdateAppointment: UseCaseUpdateAppointment(
                  repositoryMyAppointment: RepositryImblMyAppointment(
                      remoteDataMyAppointment:
                          RemoteDataImblMyAppointment(client: Client()))),
              usecaseDoctorDatas: UsecaseDoctorDatas(
                  repositoryMyAppointment: RepositryImblMyAppointment(
                      remoteDataMyAppointment:
                          RemoteDataImblMyAppointment(client: Client())))),
        ),
        BlocProvider(
          create: (context) => DeleteBloc(
              usecaseDeleteAppointment: UsecaseDeleteAppointment(
                  repositoryMyAppointment: RepositryImblMyAppointment(
                      remoteDataMyAppointment:
                          RemoteDataImblMyAppointment(client: Client())))),
        ),
        BlocProvider(
          create: (context) => DestroysBloc(
              useCaseMyAppointemetDestroy: UseCaseMyAppointemetDestroy(
                  repositoryMyAppointmentDestroy:
                      RepositoryImblMyAppointmentDestroy(
                          remoteDataMyAppointmentDestroy:
                              RemoteDataImblMyAppointmentDestroy(
                                  client: Client()))))
            ..add(MyDestroyEvent()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreenPage(),
        theme: ThemeData(primarySwatch: Colors.blue),
        routes: {
          '/addapontmentpage': (context) => AddAppointmentPage(),
          '/home': (context) => HomePage(),
          '/login': (context) => LoginPage(),
          '/doctor': (context) => DoctorPage(),
          '/nurses': (context) => NursesPage(),
        },
      ),
    );
  }
}
