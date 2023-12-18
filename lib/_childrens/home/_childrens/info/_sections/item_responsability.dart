part of 'package:cv_send/_childrens/home/_childrens/info/page.dart';

class ItemResponsability extends StatelessWidget {
  const ItemResponsability({
    super.key,
    required this.item,
  });

  final String item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.ac_unit_sharp,
          color: Colors.white,
        ),
        const SizedBox(
          width: InitProyectUiValues.spacingXs,
        ),
        Flexible(
          child: XigoText.labelText(
              label: item,
              color: XigoColors.textColor,
              decoration: TextDecoration.underline,
              textOverflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }
}
