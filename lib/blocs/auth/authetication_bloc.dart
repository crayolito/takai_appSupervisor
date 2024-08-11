import 'package:app_supervisor/features/home/domain/entities/historial.dart';
import 'package:app_supervisor/features/home/domain/entities/licencia.dart';
import 'package:app_supervisor/features/home/domain/entities/metaMask.dart';
import 'package:app_supervisor/features/home/infrastructure/repositories/geo_repository_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'authetication_event.dart';
part 'authetication_state.dart';

class AutheticationBloc extends Bloc<AutheticationEvent, AuthenticationState> {
  final homeRepositoryImpl = HomeRepositoryImpl();

  AutheticationBloc() : super(AuthenticationState()) {
    // on<OnFiltroViewClienteDPC>((event, emit) {
    // final verCliente = state.clienteDataCorte
    //     .where((element) => element.nombre
    //         .toLowerCase()
    //         .contains(event.filtroViewCliente.toLowerCase()))
    //     .toList();
    // emit(state.copyWith(verCliente: verCliente));
    // });

    // on<OnResetViewClienteDPC>((event, emit) {
    //   emit(state.copyWith(verCliente: state.clienteDataCorte));
    // });

    on<OnLoginKEYPrivada>((event, emit) async {
      // add(const OnChangedProccessAuth(ProcesoAuthentication.procesando));
      // a305f66de4bd76959ad7f989a7d8b7dcb00306aac65576d94e84b5bbfba5de15

      // InfoMetaMask infoMetaMask =
      //     await homeRepositoryImpl.getInfoMetaMask(event.keyPrivada);

      InfoMetaMask infoMetaMask = await homeRepositoryImpl.getInfoMetaMask(
          "a305f66de4bd76959ad7f989a7d8b7dcb00306aac65576d94e84b5bbfba5de15");

      emit(state.copyWith(infoMetaMask: infoMetaMask));
      event.context.push("/searchLicencia");
    });

    on<OnChangedInfoLicencias>((event, emit) async {
      List<DataLicencia> licencias = [...listaLicencias];
      emit(state.copyWith(
        dataLicenciasBackend: licencias,
        dataLicenciasFrontend: licencias,
      ));

      // READ : HACER CON EL ABI JSON BLOCKCHAIN
      // List<DataLicencia> licenciasBlockChain = await homeRepositoryImpl.getDataLicencias();
      // licenciasBlockChain = [...listaLicencias];
      // emit(state.copyWith(
      //   dataLicenciasBackend:
      //       event.dataLicenciasBackend ?? state.dataLicenciasBackend,
      //   dataLicenciasFrontend:
      //       event.dataLicenciasFrontend ?? state.dataLicenciasFrontend,
      // ));
    });

    on<OnChangedInfoHistorial>((event, emit) {
      List<Historial> historiasLicencias = [...listaHistorial];
      emit(state.copyWith(
        dataHistorialBackend: historiasLicencias,
        dataHistorialFrontend: historiasLicencias,
      ));

      // READ : HACER CON EL ABI JSON BLOCKCHAIN
      // List<Historial> historiasLicenciasBlockChain = await homeRepositoryImpl.getDataHistorial();
      // historiasLicenciasBlockChain = [...listaHistorial];
      // emit(state.copyWith(
      //   dataHistorialBackend: event.dataHistorialBackend ?? state.dataHistorialBackend,
      //   dataHistorialFrontend: event.dataHistorialFrontend ?? state.dataHistorialFrontend,
      // ));
    });
  }
}
