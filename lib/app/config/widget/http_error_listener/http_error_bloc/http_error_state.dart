// ignore_for_file: lines_longer_than_80_chars, depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
part 'http_error_state.freezed.dart';

@freezed
class HttpErrorState with _$HttpErrorState {
  const HttpErrorState._();
  factory HttpErrorState.initial() = ContratoListInitialState;
  factory HttpErrorState.loading() = ContratoListLoadingState;
  factory HttpErrorState.unauthorized(String mensaje) = UnauthorizedState;
  factory HttpErrorState.badRequest(String mensaje) = BadRequestState;
  factory HttpErrorState.notFound(String mensaje) = NotFoundState;
  factory HttpErrorState.failure(String error) = ContratoListErrorState;
  factory HttpErrorState.withoutConnection() = WithoutConnectionState;
  factory HttpErrorState.internalServerError(String mensaje) = InternalServerErrorState;
  factory HttpErrorState.manyRequest() = ManyRequestState;
  factory HttpErrorState.unavailableService() = UnavailableServiceState;
  factory HttpErrorState.otherError() = OtherErrorState;
  factory HttpErrorState.webviewError(String error) = WebViewErrorState;
}
