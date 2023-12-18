import 'package:cv_send/utils/text/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cv_send/_childrens/init/bloc/bloc.dart' as bloc;
import 'package:cv_send/utils/colors.dart';
import 'package:cv_send/utils/navigation.dart';
import 'package:cv_send/utils/xigo_ui.dart';
import 'package:lottie/lottie.dart';

part 'package:cv_send/_childrens/init/listeners/core.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: XigoColors.backgroundColor,
      body: BlocListener<bloc.Bloc, bloc.State>(
        listener: listener,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              InitProyectUiValues.developer,
            ),
            const SizedBox(height: InitProyectUiValues.spacingMedium),
            XigoText.title(
              label: InitProyectUiValues.welcomeToMyResum,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
