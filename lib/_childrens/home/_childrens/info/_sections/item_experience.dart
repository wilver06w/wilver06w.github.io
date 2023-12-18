part of 'package:cv_send/_childrens/home/_childrens/info/page.dart';

class ItemExperienceWidget extends StatelessWidget {
  const ItemExperienceWidget({
    super.key,
    required this.title,
    required this.profile,
    required this.date,
    required this.description,
    required this.listResponsabilitys,
  });

  final String title;
  final String profile;
  final String date;
  final String description;
  final List<String> listResponsabilitys;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                XigoText.title(
                  label: title,
                  color: XigoColors.textColor,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  width: InitProyectUiValues.spacingXs,
                ),
                XigoText.small(
                  label: profile,
                  color: XigoColors.textColor,
                ),
              ],
            ),
            XigoText.labelText(
              label: date,
              color: XigoColors.textColor,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ],
        ),
        XigoText.labelText(
          label: description,
          color: XigoColors.textColor,
          decoration: TextDecoration.underline,
        ),
        const SizedBox(height: InitProyectUiValues.spacingMedium),
        ...List.generate(listResponsabilitys.length, (index) {
          final item = listResponsabilitys[index];
          return ItemResponsability(item: item);
        }),
      ],
    );
  }
}
