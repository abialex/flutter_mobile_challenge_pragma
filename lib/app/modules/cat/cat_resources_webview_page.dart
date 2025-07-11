import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_challenge_pragma/app/config/widget/http_error_listener/http_error_bloc/http_error_bloc.dart';
import 'package:flutter_mobile_challenge_pragma/app/config/widget/http_error_listener/http_error_bloc/http_error_event.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/widget/app_base_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CatResourcesWebViewPage extends StatefulWidget {
  const CatResourcesWebViewPage({super.key, required this.url, required this.title});
  final String url;
  final String title;

  @override
  State<CatResourcesWebViewPage> createState() => _CatResourcesWebViewPageState();
}

class _CatResourcesWebViewPageState extends State<CatResourcesWebViewPage> {
  late final WebViewController webController;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    webController =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {
                // Update loading bar.
              },
              onPageStarted: (String url) {},
              onPageFinished: (String url) {},
              onHttpError: (HttpResponseError error) {
                setState(() {
                  _hasError = true;
                });
              },
              onWebResourceError: (WebResourceError error) {
                if (error.description.contains('ERR_BLOCKED_BY_ORB')) {
                  context.read<HttpErrorBloc>().add(
                    HttpErrorEvent.webViewError("⚠️ Recursos bloqueados por política ORB"),
                  );
                } else if (error.description.contains('ERR_CLEARTEXT_NOT_PERMITTED')) {
                  context.read<HttpErrorBloc>().add(
                    HttpErrorEvent.webViewError('❌ HTTP not permitted. Use HTTPS or allow cleartext traffic.'),
                  );
                }
              },
              onNavigationRequest: (NavigationRequest request) {
                if (request.url.startsWith(widget.url)) {
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
            ),
          )
          ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      title: widget.title,
      paddingBody: EdgeInsets.zero,
      bodyWidget:
          _hasError
              ? const Center(child: Text('Lo sentimos, ha ocurrido un error al cargar la página.'))
              : WebViewWidget(controller: webController),
    );
  }
}
