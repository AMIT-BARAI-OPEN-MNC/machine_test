import 'package:flutter/material.dart';
import 'package:machine_test/view/home.dart';

import 'package:machine_test/view_model/provider_controller.dart';
import 'package:machine_test/view_model/downloadController.dart';
import 'package:provider/provider.dart';
// Assuming home.dart is in the same directory

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ImageProvidermodel()),
        // ChangeNotifierProvider(create: (_) => PageNotifier())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            // Define your app theme here
            ),
        home: home(), // Use Home() instead of home()
      ),
    );
  }
}
