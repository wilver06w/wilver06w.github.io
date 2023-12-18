import 'package:cv_send/_childrens/home/_childrens/info/bloc/bloc.dart';
import 'package:cv_send/_childrens/home/_childrens/repository.dart';
import 'package:cv_send/utils/colors.dart';
import 'package:cv_send/utils/functions.dart';
import 'package:cv_send/utils/navigation.dart';
import 'package:cv_send/utils/text/text.dart';
import 'package:cv_send/utils/xigo_ui.dart';
import 'package:cv_send/widget/option_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif_view/gif_view.dart';
import 'package:lottie/lottie.dart';

part 'package:cv_send/_childrens/home/_childrens/info/_sections/about_widget.dart';
part 'package:cv_send/_childrens/home/_childrens/info/_sections/global_drawer.dart';
part 'package:cv_send/_childrens/home/_childrens/info/_sections/item_experience.dart';
part 'package:cv_send/_childrens/home/_childrens/info/_sections/item_responsability.dart';
part 'package:cv_send/_childrens/home/_childrens/info/_sections/project_widget.dart';

final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();

class Page extends StatelessWidget {
  const Page({
    super.key,
    required this.pass,
  });

  final int pass;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => BlocInfo(
        repository: Repository(),
      )
        ..add(GetExperiencesEvent())
        ..add(GetProjectsEvent())
        ..add(ChangedOptionSelectedEvent(optionSelected: pass)),
      child: Scaffold(
        key: _scaffoldkey,
        backgroundColor: XigoColors.backgroundColor,
        drawer: const GlobalDrawer(),
        body: Padding(
          padding: EdgeInsets.all(
            size.width < 650
                ? InitProyectUiValues.spacingMedium
                : InitProyectUiValues.spacingXl * 2,
          ).copyWith(
            bottom: InitProyectUiValues.spacingMedium,
          ),
          child: ListView(
            children: [
              const SizedBox(height: InitProyectUiValues.spacingMedium),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox.shrink(),
                  size.width < 650
                      ? InkWell(
                          onTap: () {
                            _scaffoldkey.currentState?.openDrawer();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 5.0,
                                  spreadRadius: 2.0,
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.menu_rounded,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : BlocSelector<BlocInfo, InfoState, int>(
                          selector: (state) {
                            return state.model.optionSelected;
                          },
                          builder: (context, value) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (value != 0) ...[
                                  OptionTitle(
                                    title: InitProyectUiValues.about,
                                    onTap: () {
                                      context.read<BlocInfo>().add(
                                            const ChangedOptionSelectedEvent(
                                              optionSelected: 0,
                                            ),
                                          );
                                    },
                                  ),
                                  const SizedBox(
                                    width: InitProyectUiValues.spacingMedium,
                                  ),
                                ],
                                if (value != 1) ...[
                                  OptionTitle(
                                    title: InitProyectUiValues.project,
                                    onTap: () {
                                      context.read<BlocInfo>().add(
                                            const ChangedOptionSelectedEvent(
                                              optionSelected: 1,
                                            ),
                                          );
                                    },
                                  ),
                                  const SizedBox(
                                    width: InitProyectUiValues.spacingMedium,
                                  ),
                                ],
                                if (value != 2) ...[
                                  OptionTitle(
                                    title: InitProyectUiValues.contact,
                                    onTap: () {
                                      context.read<BlocInfo>().add(
                                            const ChangedOptionSelectedEvent(
                                              optionSelected: 2,
                                            ),
                                          );
                                    },
                                  ),
                                  const SizedBox(
                                    width: InitProyectUiValues.spacingMedium,
                                  ),
                                ],
                                const Icon(
                                  Icons.ads_click_sharp,
                                  color: Colors.white,
                                ),
                              ],
                            );
                          },
                        ),
                ],
              ),
              const SizedBox(height: InitProyectUiValues.spacingMedium),
              BlocSelector<BlocInfo, InfoState, int>(
                selector: (state) {
                  return state.model.optionSelected;
                },
                builder: (context, value) {
                  switch (value) {
                    case 0:
                      return const AboutMeWidget();
                    case 1:
                      return const ProjectWidget();
                    case 2:
                      return Column(
                        children: [
                          XigoText.title(
                            label: InitProyectUiValues.writeCallMe,
                            color: XigoColors.textColor,
                            fontWeight: FontWeight.bold,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: InkWell(
                                  onTap: () {
                                    Functions.launchInBrowser(
                                      url: InitProyectUiValues.wasapMe,
                                    );
                                  },
                                  child: Lottie.asset(
                                    InitProyectUiValues.wasapGif,
                                    height: 200,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: InkWell(
                                  onTap: () {
                                    Functions.launchEmail();
                                  },
                                  child: Lottie.asset(
                                    InitProyectUiValues.emailGif,
                                    height: 200,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    default:
                      return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconTap extends StatelessWidget {
  const IconTap({
    super.key,
    this.width = 30.0,
    this.height = 30.0,
    required this.iconRoute,
    required this.onTap,
  });

  final double height;
  final String iconRoute;
  final VoidCallback onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Lottie.asset(
        iconRoute,
        width: width,
        height: height,
      ),
    );
  }
}
