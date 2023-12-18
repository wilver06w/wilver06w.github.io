part of 'package:cv_send/_childrens/home/_childrens/info/page.dart';

class GlobalDrawer extends StatelessWidget {
  const GlobalDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 3,
      backgroundColor: XigoColors.backgroundColor,
      child: BlocSelector<BlocInfo, InfoState, int>(
        selector: (state) {
          return state.model.optionSelected;
        },
        builder: (context, value) {
          return ListView(
            children: [
              const SizedBox(height: InitProyectUiValues.spacingXSL),
              if (value != 0) ...[
                ListTile(
                  title: OptionTitle(
                    title: InitProyectUiValues.about,
                    onTap: () {
                      context.read<BlocInfo>().add(
                            const ChangedOptionSelectedEvent(
                              optionSelected: 0,
                            ),
                          );
                      _scaffoldkey.currentState?.closeDrawer();
                    },
                  ),
                ),
                const SizedBox(
                  width: InitProyectUiValues.spacingMedium,
                ),
              ],
              if (value != 1) ...[
                ListTile(
                  title: OptionTitle(
                    title: InitProyectUiValues.project,
                    onTap: () {
                      context.read<BlocInfo>().add(
                            const ChangedOptionSelectedEvent(
                              optionSelected: 1,
                            ),
                          );
                      _scaffoldkey.currentState?.closeDrawer();
                    },
                  ),
                ),
                const SizedBox(
                  width: InitProyectUiValues.spacingMedium,
                ),
              ],
              if (value != 2) ...[
                ListTile(
                  title: OptionTitle(
                    title: InitProyectUiValues.contact,
                    onTap: () {
                      context.read<BlocInfo>().add(
                            const ChangedOptionSelectedEvent(
                              optionSelected: 2,
                            ),
                          );
                      _scaffoldkey.currentState?.closeDrawer();
                    },
                  ),
                ),
                const SizedBox(width: InitProyectUiValues.spacingXl),
                Lottie.asset(
                  InitProyectUiValues.drawerAnimation,
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
