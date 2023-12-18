import 'package:cv_send/_childrens/home/_childrens/detail_project/bloc/bloc.dart';
import 'package:cv_send/_childrens/home/_childrens/info/models/item_project.dart';
import 'package:cv_send/utils/colors.dart';
import 'package:cv_send/utils/functions.dart';
import 'package:cv_send/utils/text/text.dart';
import 'package:cv_send/utils/xigo_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gif_view/gif_view.dart';

part 'package:cv_send/_childrens/home/_childrens/detail_project/_sections/item_technologies.dart';

class Page extends StatelessWidget {
  const Page({
    super.key,
    required this.itemProject,
  });

  final ItemProject itemProject;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailProjectBloc()
        ..add(ChangedItemProjectEvent(
          itemProject: itemProject,
        )),
      child: Scaffold(
        backgroundColor: XigoColors.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      BlocBuilder<DetailProjectBloc, DetailProjectState>(
                        buildWhen: (_, state) =>
                            state is ChangedItemProjectState,
                        builder: (context, state) {
                          return state.model.itemProject.routeGif.isEmpty
                              ? Image.asset(
                                  state.model.itemProject.routeImage,
                                )
                              : GifView.asset(
                                  state.model.itemProject.routeGif,
                                  frameRate: 30,
                                );
                        },
                      ),
                      Positioned(
                        left: 10,
                        top: 10,
                        child: Card(
                          color: XigoColors.backgroundColor,
                          child: Padding(
                            padding: const EdgeInsets.all(
                              InitProyectUiValues.spacingEight,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Modular.to.pop();
                                  },
                                  child: const Icon(
                                    Icons.arrow_back_ios_new,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: InitProyectUiValues.spacingMedium,
                                ),
                                BlocBuilder<DetailProjectBloc,
                                    DetailProjectState>(
                                  builder: (context, state) {
                                    return XigoText.labelText(
                                      label: state.model.itemProject.title,
                                      color: XigoColors.textColor,
                                      fontWeight: FontWeight.bold,
                                    );
                                  },
                                ),
                                const SizedBox.shrink(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: InitProyectUiValues.spacingXs),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      XigoText.labelText(
                        label: InitProyectUiValues.about,
                        color: XigoColors.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                      BlocBuilder<DetailProjectBloc, DetailProjectState>(
                        builder: (context, state) {
                          return XigoText.labelText(
                            label: state.model.itemProject.about,
                            color: XigoColors.textColor,
                          );
                        },
                      ),
                      const SizedBox(height: InitProyectUiValues.spacingXSL),
                      XigoText.labelText(
                        label: InitProyectUiValues.technologies,
                        color: XigoColors.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                      BlocBuilder<DetailProjectBloc, DetailProjectState>(
                        builder: (context, state) {
                          return Row(
                            children: List.generate(
                              state.model.itemProject.technologies.length,
                              (index) => ItemTechnologies(
                                technologies:
                                    state.model.itemProject.technologies[index],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: XigoColors.backgroundColor,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 20,
                        ),
                        textStyle: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Functions.launchInBrowser(
                          url: itemProject.urlSite,
                        );
                      },
                      child: XigoText.labelText(
                        label: InitProyectUiValues.seeMoreAboutProject,
                        color: XigoColors.textColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return BlocBuilder<DetailProjectBloc, DetailProjectState>(
      buildWhen: (_, state) => state is ChangedItemProjectState,
      builder: (context, state) {
        return AppBar(
          backgroundColor: XigoColors.backgroundColor,
          title: XigoText.labelText(
            label: state.model.itemProject.title,
            color: XigoColors.textColor,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }
}
