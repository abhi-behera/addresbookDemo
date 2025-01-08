import 'package:dumyapp1/view/CustomWidgets/custom_widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter/material.dart';

class MoviesDetailsWebview extends StatefulWidget {
  final String? url;

  const MoviesDetailsWebview({required this.url, Key? key}) : super(key: key);

  @override
  State<MoviesDetailsWebview> createState() => _MoviesDetailsWebviewState();
}

class _MoviesDetailsWebviewState extends State<MoviesDetailsWebview> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (url) {
            setState(() {
              _isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url!));
  }

  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Movies Details page"),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
