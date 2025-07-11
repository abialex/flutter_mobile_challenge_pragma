// ignore_for_file: lines_longer_than_80_chars, depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
part 'http_error_event.freezed.dart';

@freezed
class HttpErrorEvent with _$HttpErrorEvent {
  const HttpErrorEvent._();
  factory HttpErrorEvent.initial() = InitialEvent;
  factory HttpErrorEvent.withoutConnection() = WithoutConnectionEvent;
  factory HttpErrorEvent.notfound404(String error) = NotFoundEvent;
  factory HttpErrorEvent.unauthorized() = UnauthorizedEvent;
  factory HttpErrorEvent.badRequest(String error) = BadRequestEvent;
  factory HttpErrorEvent.internalServerError(String error) = InternalServerErrorEvent;
  factory HttpErrorEvent.manyRequest() = ManyRequestEvent;
  factory HttpErrorEvent.unavailableService() = UnavailableServiceEvent;
  factory HttpErrorEvent.otherError() = OtherErrorEvent;
  factory HttpErrorEvent.webViewError(String error) = WebViewErrorEvent;
}
