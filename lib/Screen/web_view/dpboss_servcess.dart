import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:dpboss/Screen/back_to_close/systum_back_close_app.dart';
import 'package:dpboss/Screen/web_view/drawer.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

class ShowWeb extends StatefulWidget {
  final String urll;
  ShowWeb({required this.urll, super.key});

  @override
  State<ShowWeb> createState() => _ShowWebState();
}

class _ShowWebState extends State<ShowWeb> {
  bool _isLoading = true;
  final BackTocloseApp _backTocloseApp = BackTocloseApp();
  late final _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    // ..runJavaScript(
    //     "document.getElementsByTagName('body')[0].style.display='none';")
    ..loadRequest(Uri.parse(widget.urll))
    ..enableZoom(false);

  // ..setNavigationDelegate(NavigationDelegate(
  //   onProgress: (int progress) {
  //     CircularProgressIndicator();
  //     // Update loading bar.
  //   },
  //   onPageStarted: (String url) {
  //       if (url.contains('https://getmobie.de/')) {
  //            //Added delayed future method for wait for the website to load fully before calling javascript
  //             Future.delayed(Duration(milliseconds: 900), () {
  //               _controller.runJavascriptReturningResult(
  //                     "document.getElementsByClassName('elementor elementor-7715 elementor-location-header')[0].style.display='none';"
  //                     "document.getElementsByClassName('elementor elementor-2727 elementor-location-footer')[0].style.display='none';"
  //               );
  //             });
  //   },
  // onPageFinished: (String url) {
  //   print(url);

  // _controller.runJavascript("document.getElementsByTagName('header')[0].style.display='none'");
  // onPageFinished: (url) async {
  // _controller.runJavascript("document.getElementsByTagName('header')[0].style.display='none'");
  // },
  //  },
  //   onWebResourceError: (WebResourceError error) {},
  //   // onNavigationRequest: (NavigationRequest request) {
  //   //   if (request.url.startsWith('https://www.youtube.com/')) {
  //   //     return NavigationDecision.prevent;
  //   //   }
  //   //   return NavigationDecision.navigate;
  //   // },
  //));

  // static get section => null;
  // ..runJavaScript(
  //     "document.getElementsByTagName('footer')[0].style.display='none'");
  // ..runJavaScript(
  //     "document.getElementsByTagName('header')[0].style.display='none'")

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BackButtonInterceptor.add(_myInterceptor);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.setNavigationDelegate(NavigationDelegate(
        onPageStarted: (String url) {
          setState(() {
            _isLoading = true;
          });
        },
        onPageFinished: (url) async {
          setState(() {
            _isLoading = false;
          });
          // _controller.runJavaScript(
          //     "document.getElementById('masthead').style.display='none';" //
          //     "document.getElementById('colophon').style.display='none';" //
          //     "document.getElementById('feranta').style.display='none';" //
          //     "document.getElementsByTagName('footer').style.display='none'"); //uk-background-cover
        },
      ));
    });
    //     .setNavigationDelegate(NavigationDelegate(onProgress: (int progress) {
    //   CircularProgressIndicator();
    //   // Update loading bar.
    // }, onPageStarted: (String url) {
    //   if (url.contains('https://getmobie.de/')) {
    //     //Added delayed future method for wait for the website to load fully before calling javascript
    //     Future.delayed(Duration(milliseconds: 900), () {
    //       _controller.runJavaScriptReturningResult(
    //           "document.getElementsByClassName('elementor elementor-7715 elementor-location-header')[0].style.display='none';"
    //           "document.getElementsByClassName('elementor elementor-2727 elementor-location-footer')[0].style.display='none';");
    //     });
    //   }
    //   // onPageFinished: (String url) {
    //   //   print(url);
    //   // },
    //   // onWebResourceError: (WebResourceError error) {},
    //   // onNavigationRequest: (NavigationRequest request) {
    //   //   if (request.url.startsWith('https://www.youtube.com/')) {
    //   //     return NavigationDecision.prevent;
    //   //   }
    //   //   return NavigationDecision.navigate;
    //   // },
    // }));

    // _controller.runJavaScript(
    //     "document.getElementsByClassName('uk-container')[0].style.display");//navbar
  }

  @override
  void dispose() {
    // TODO: implement dispose
    BackButtonInterceptor.remove(_myInterceptor);
    super.dispose();
  }

  Future<bool> _myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    return _backTocloseApp.myInterceptor(
        stopDefaultButtonEvent, info, _controller);
  }

  @override
  Widget build(BuildContext context) {
    _controller.scrollTo(0, 0);
    return Scaffold(
        backgroundColor: Color(0xFFFFCC99),
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          // leading: InkWell(
          //     onTap: () {
          //       _controller.goBack();
          //     },
          //     child: const Icon(Icons.arrow_back)),
          centerTitle: true,
          backgroundColor: Color(0xFFFFCB99),
          title: SizedBox(
              height: 40,
              // width: 100,

              ///MediaQuery.of(context).size.width * 1,
              child: Image.asset(
                "assets/logo/dpboss_top_title.jpeg",
                fit: BoxFit.fill,
              )),
          actions: [
            SizedBox(
                width: 50,
                child: Image.asset(
                  "assets/logo/dpboss_top_action.jpeg",
                  fit: BoxFit.fill,
                ))
          ],
        ),
        drawer: drawer(context),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : WebViewWidget(controller: _controller),
        )));
  }
}
