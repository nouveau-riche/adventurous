import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

import 'package:adventurous_learner_app/utils/constants.dart';
import 'package:adventurous_learner_app/utils/const_color.dart';
import 'package:adventurous_learner_app/utils/widgets/back_button_widget.dart';

class ViewPdfScreen extends StatelessWidget {
  final String url;

  const ViewPdfScreen({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: oliveColor,
        leading: const BackButtonWidget(color: Colors.white),
        elevation: 0,
        centerTitle: true,
      ),
      body: const PDF().cachedFromUrl(
        url,
        placeholder: (progress) => Center(child: Text('$progress %')),
        errorWidget: (error) => Center(child: Text(error.toString())),
        headers: {'x-access-token': constCtr.token},
      ),
    );
  }
}
