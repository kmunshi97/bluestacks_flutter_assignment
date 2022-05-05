import 'package:flutter/material.dart';

import '../../../logic/blocs/internet_bloc/widget/internet_connectivity_widget.dart';
import '../../widgets/drawer_widget/drawer_widget.dart';
import 'widgets/home_body_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const BSTDrawerWidget(),
      appBar: AppBar(
        title: const Text("FlyingWolf"),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: InternetConnectivityWidget(
          child: HomeBodyWidget(),
        ),
      ),
    );
  }
}
