import 'package:cv_send/_childrens/home/page.dart' as page;
import 'package:cv_send/_childrens/home/_childrens/detail_project/page.dart'
    as detail_project;
import 'package:cv_send/_childrens/home/_childrens/info/page.dart' as info;

import 'package:cv_send/utils/http/http_client.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds {
    return [];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(
        Modular.initialRoute,
        child: (_, args) => const page.Page(),
        transition: TransitionType.fadeIn,
      ),
      ChildRoute(
        '/info',
        child: (_, args) => info.Page(
          pass: (args.data ?? {})['pass_number'] ?? 0,
        ),
        transition: TransitionType.fadeIn,
      ),
      ChildRoute(
        '/project',
        child: (_, args) => detail_project.Page(
          itemProject: (args.data ?? {})['project'] ?? 0,
        ),
        transition: TransitionType.fadeIn,
      ),
    ];
  }
}
