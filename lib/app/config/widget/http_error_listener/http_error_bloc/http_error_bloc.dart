// ignore_for_file: lines_longer_than_80_chars
import 'package:bloc/bloc.dart';
import 'package:flutter_mobile_challenge_pragma/app/config/widget/http_error_listener/http_error_bloc/http_error_event.dart';
import 'package:flutter_mobile_challenge_pragma/app/config/widget/http_error_listener/http_error_bloc/http_error_state.dart';

class HttpErrorBloc extends Bloc<HttpErrorEvent, HttpErrorState> {
  HttpErrorBloc() : super(HttpErrorState.initial()) {
    on<UnauthorizedEvent>(unauthorizedEvent);
    on<BadRequestEvent>(badRequestEvent);
    on<InitialEvent>(initialEvent);
    on<NotFoundEvent>(notFoundEvent);
    on<UnavailableServiceEvent>(unavailableServiceEvent);
    on<WithoutConnectionEvent>(withoutConnectionEvent);
    on<InternalServerErrorEvent>(internalServerErrorEvent);
    on<ManyRequestEvent>(manyRequestEvent);
    on<OtherErrorEvent>(otherErrorEvent);
    on<WebViewErrorEvent>(webViewErrorEvent);
  }

  Future<void> initialEvent(InitialEvent event, Emitter<HttpErrorState> emit) async {
    emit(HttpErrorState.initial());
  }

  Future<void> unauthorizedEvent(HttpErrorEvent event, Emitter<HttpErrorState> emit) async {
    emit(HttpErrorState.unauthorized('Vencido'));
  }

  Future<void> badRequestEvent(BadRequestEvent event, Emitter<HttpErrorState> emit) async {
    emit(HttpErrorState.badRequest(event.error));
  }

  Future<void> notFoundEvent(NotFoundEvent event, Emitter<HttpErrorState> emit) async {
    emit(HttpErrorState.notFound(event.error));
  }

  Future<void> unavailableServiceEvent(UnavailableServiceEvent event, Emitter<HttpErrorState> emit) async {
    emit(HttpErrorState.notFound("Servicio no disponible"));
  }

  Future<void> withoutConnectionEvent(WithoutConnectionEvent event, Emitter<HttpErrorState> emit) async {
    emit(HttpErrorState.withoutConnection());
  }

  Future<void> internalServerErrorEvent(InternalServerErrorEvent event, Emitter<HttpErrorState> emit) async {
    emit(HttpErrorState.internalServerError(event.error));
  }

  Future<void> manyRequestEvent(ManyRequestEvent event, Emitter<HttpErrorState> emit) async {
    emit(HttpErrorState.manyRequest());
  }

  Future<void> otherErrorEvent(OtherErrorEvent event, Emitter<HttpErrorState> emit) async {
    emit(HttpErrorState.otherError());
  }

  Future<void> webViewErrorEvent(WebViewErrorEvent event, Emitter<HttpErrorState> emit) async {
    emit(HttpErrorState.webviewError(event.error));
  }
}
