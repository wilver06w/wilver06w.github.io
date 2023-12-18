part of 'package:cv_send/_childrens/home/_childrens/info/page.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          XigoText.fontSizeCustom(
            label: '${InitProyectUiValues.aboutMe}.',
            fontWeight: FontWeight.bold,
            fontSize: 32.0,
            color: XigoColors.textColor,
          ),
          const SizedBox(
            height: InitProyectUiValues.spacingXSL,
          ),
          XigoText.title(
            label: InitProyectUiValues.lastestWorks,
            fontWeight: FontWeight.bold,
            color: XigoColors.textColor,
          ),
          const SizedBox(
            height: InitProyectUiValues.spacingXSL,
          ),
          BlocBuilder<BlocInfo, InfoState>(
            builder: (context, state) {
              return Column(
                children: List.generate(
                  state.model.experiences.length,
                  (index) {
                    final item = state.model.experiences[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: InitProyectUiValues.spacingXSL,
                      ),
                      child: ItemExperienceWidget(
                        title: item.title,
                        profile: item.profile,
                        date: item.date,
                        description: item.description,
                        listResponsabilitys: item.resposabilitys,
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
