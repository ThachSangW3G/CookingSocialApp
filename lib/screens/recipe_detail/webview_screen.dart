import 'dart:developer';
import 'package:cooking_social_app/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebViewPage extends StatefulWidget {
  final String url;

  const NewsWebViewPage({super.key, required this.url});

  @override
  State<NewsWebViewPage> createState() => _NewsWebViewPageState();
}

class _NewsWebViewPageState extends State<NewsWebViewPage> {
  double _progress = 0.0;
  late WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    const Color color = Colors.black;
    return WillPopScope(
      onWillPop: () async {
        if (await _webViewController.canGoBack()) {
          _webViewController.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            widget.url,
            style: const TextStyle(
                color: Colors.black,
                fontFamily: "CeraPro",
                fontSize: 17,
                fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.more_horiz),
              onPressed: () async {
                await _showWebViewBottomSheet();
              },
            ),
          ],
        ),
        body: Column(
          children: [
            LinearProgressIndicator(
              value: _progress,
              color: _progress == 1 ? Colors.transparent : Colors.black,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
            Expanded(
              child: WebView(
                //initialUrl: "https://flutter.dev/",
                initialUrl: widget.url,
                zoomEnabled: true,
                onProgress: (value) {
                  setState(() {
                    _progress = value / 100;
                  });
                },
                onWebViewCreated: (controller) {
                  _webViewController = controller;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showWebViewBottomSheet() async {
    await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  height: 5,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const Text(
                "More option",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  thickness: 2,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.screen_share_outlined),
                title: const Text("Share"),
                onTap: () async {
                  try {
                    await Share.share(widget.url);
                  } catch (e) {
                    // GlobalMethods.errorDialog(
                    //     errorMessage: e.toString(), context: context);
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.open_in_browser_outlined),
                title: const Text("Open in browser"),
                onTap: () async {
                  if (!await launchUrl(Uri.parse(widget.url))) {
                    throw "Could not launch ${widget.url}";
                  }
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.refresh),
                title: const Text("Refesh"),
                onTap: () async {
                  try {
                    await _webViewController.reload();
                  } catch (e) {
                    log("refresh Web view error :: ${e}");
                  } finally {
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          );
        });
  }
}
