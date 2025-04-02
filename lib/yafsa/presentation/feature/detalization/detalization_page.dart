import 'package:flutter/cupertino.dart';

import 'detalization_view.dart';

class DetalizationPage extends StatelessWidget {
  final String id;

  const DetalizationPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return DetalizationView(id);
  }
}
