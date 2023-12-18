part of 'package:cv_send/_childrens/init/page.dart';

void listener(BuildContext context, bloc.State state) {
  if (state is bloc.LoadedState) {
    XigoRoute.navHomeReplaceName();
  }
}
