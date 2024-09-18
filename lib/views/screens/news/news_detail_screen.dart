import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hockey_live_score/models/news_model.dart';
import 'package:hockey_live_score/utils/dimen_const.dart';
import 'package:hockey_live_score/views/widgets/custom_card.dart';

import '../../../utils/color_const.dart';
import '../../widgets/custom_text.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsModel? newsModel;
  const NewsDetailScreen({super.key, this.newsModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        title: CustomText(
          text: '',
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: newsModel?.title ?? '',
              maxLines: 3,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
            kSizedBoxH10,
            CustomCard(
              widget: CustomText(
                text: newsModel?.desc ?? '',
                maxLines: 500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// import '../../../utils/color_const.dart';
// import '../../widgets/custom_text.dart';

// class NewsDetailScreen extends StatefulWidget {
//   final String? url;
//   const NewsDetailScreen({super.key, this.url});

//   @override
//   State<NewsDetailScreen> createState() => _NewsDetailScreenState();
// }

// class _NewsDetailScreenState extends State<NewsDetailScreen> {
//   late WebViewController controller;
//   var loadingPercentage = 0;

//   @override
//   void initState() {
//     super.initState();
//     controller = WebViewController()
//       ..setNavigationDelegate(NavigationDelegate(
//         onPageStarted: (url) {
//           setState(() {
//             loadingPercentage = 0;
//           });
//         },
//         onProgress: (progress) {
//           setState(() {
//             loadingPercentage = progress;
//           });
//         },
//         onPageFinished: (url) {
//           setState(() {
//             loadingPercentage = 100;
//           });
//         },
//       ))
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..loadRequest(
//         Uri.parse(widget.url ?? ''),
//       );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         centerTitle: true,
//         iconTheme: const IconThemeData(color: Colors.white),
//         backgroundColor: primaryColor,
//         title: CustomText(
//           text: '',
//           fontSize: 15.sp,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//       body: Stack(
//         children: [
//           WebViewWidget(
//             controller: controller,
//           ),
//           loadingPercentage < 100
//               ? LinearProgressIndicator(
//                   color: secondaryColor,
//                   value: loadingPercentage / 100.0,
//                 )
//               : Container()
//         ],
//       ),
//     );
//   }
// }
