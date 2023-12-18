import 'package:cv_send/_childrens/home/_childrens/info/models/item_experience.dart';
import 'package:cv_send/_childrens/home/_childrens/info/models/item_project.dart';
import 'package:cv_send/utils/xigo_ui.dart';

class Repository {
  List<ItemExperience> getExperiences() {
    return [
      const ItemExperience(
        title: InitProyectUiValues.tulSas,
        profile: InitProyectUiValues.mobileDeveloper,
        date: InitProyectUiValues.twentyOneTwentyThree,
        description:
            'I was in charge of the Core of the business, including authentication, home profile, services, developing functionalities from 0%',
        resposabilitys: [
          'Scrum methodology, establishment of OKR objectives.',
          'Version control: Git, BitBucket.',
          '	State management: BLOC, Riverpod, Provider.',
          '	Design and collaboration: Figma, Slack.',
          '	Cross-platform frameworks: Dart: Flutter 3.',
          '	Native platforms: iOS and Android.',
          '	Firebase integration: Firebase Analytics, remote configuration.',
          '	Google Maps integration: maps, GPS.',
          '	Database Management: PostgreSQL, DBeaver.',
          '	Data visualization: Redash.',
          '	API Documentation: Swagger.',
          '	Clean code principles: SOLID.',
          '	Clean architecture: modular and maintainable code.',
          '	Unit and integration tests: guarantee the functionality of the code.',
        ],
      ),
      const ItemExperience(
        title: 'Acacompro',
        profile: InitProyectUiValues.mobileDeveloper,
        date: '2020-2021',
        description:
            'This was an ecommerce, here I played the role of leader, defining the technology and communicating with the product part to download the requirements and designs.',
        resposabilitys: [
          'Development of the Acacompro.com platform',
          'Use of the Dart programming language.',
          'Consumption of RESTful APIs',
          'Use of integrations with different payment gateways.',
          'Use of databases such as: Mysql and MongoDB.',
          'Connecting to the Facebook SDK, to Login and obtain the user data.',
          'Firebase Analytics.',
          'Push Notifications in Firebase.',
          'Applying Flutter Static Analysis.',
        ],
      ),
      const ItemExperience(
        title: 'MotaxiGo',
        profile: InitProyectUiValues.mobileDeveloper,
        date: '2019-2021',
        description:
            'This was an ecommerce, here I played the role of leader, defining the technology and communicating with the product part to download the requirements and designs.',
        resposabilitys: [
          'Development of the XiGo platform',
          'Use of integrations with different payment gateways.',
          'Use of databases such as: Mysql and MongoDB.',
          'Use of Frameworks such as: Codeigniter, Creating REST APIs.',
        ],
      ),
      const ItemExperience(
        title: 'Dr Tecnology',
        profile: InitProyectUiValues.softwareDeveloper,
        date: '2019-2020',
        description:
            'Software developer on e-commerce platforms such as Vitrisur being sponsored by the chamber of commerce (https://vitrisur.com). with mobile application.',
        resposabilitys: [
          'Use of Frameworks such as: Codeigniter, Creating REST APIs.',
          'Use of databases such as: Mysql and MongoDB.',
          'Creation app',
        ],
      ),
      const ItemExperience(
        title: 'Somos Junior',
        profile: InitProyectUiValues.mobileDeveloper,
        date: '2018-2021',
        description:
            'This is an entertainment and news App about a soccer team, Implement the designs and what is required',
        resposabilitys: [
          'Development of the XiGo platform',
          'Use of integrations with different payment gateways.',
          'Use of databases such as: Mysql and MongoDB.',
          'Use of Frameworks such as: Codeigniter, Creating REST APIs.',
        ],
      ),
    ];
  }

  List<ItemProject> getProjects() {
    return [
      const ItemProject(
        title: InitProyectUiValues.tulSas,
        subtitle: InitProyectUiValues.theMarketplaceAppTul,
        about: InitProyectUiValues
            .wideRangeProductsAndMakePurchaseSelectionTheirPrefferedSellers,
        technologies: [
          'Flutter',
          'Bloc',
          'Dart',
          'Kotlin',
          'Micropackages',
          'Spring Boot',
          'Microservices',
        ],
        routeGif: InitProyectUiValues.tulGif,
        urlSite:
            'https://play.google.com/store/apps/details?id=co.com.tul.ironmonger',
      ),
      const ItemProject(
        title: 'Acacompro',
        subtitle: 'MarketPlace of products',
        about: 'MarketPlace of products, style Mercadolibre',
        technologies: [
          'Flutter',
          'Provider',
          'Dart',
          'Laravel',
        ],
        routeGif: InitProyectUiValues.acacomproGif,
        urlSite:
            'https://play.google.com/store/apps/details?id=com.acacompro.acacompro',
      ),
      const ItemProject(
        title: 'Acacompro Proveedores',
        subtitle: 'MarketPlace of products for clients interns',
        about: 'MarketPlace of products for providers, ty business B2B',
        technologies: [
          'Flutter',
          'Provider',
          'Dart',
          'Laravel',
        ],
        routeImage: InitProyectUiValues.acacomproProveedoresImage,
        urlSite:
            'https://play.google.com/store/apps/details?id=com.acacompro.proveedores',
      ),
      const ItemProject(
        title: 'XigoCliente',
        subtitle: 'Transport application',
        about:
            'Faster in each city and locate the city effectively #Colombia #Mexico',
        technologies: [
          'Java',
          'Kotlin'
          'RxJava',
          'Retrofit',
          'MVC',
          'Laravel',
        ],
        routeGif: InitProyectUiValues.xigoClient,
        urlSite:
            'https://play.google.com/store/apps/details?id=com.motaxisas.motaxigo',
      ),
      const ItemProject(
        title: 'XigoConductor',
        subtitle: 'Transport application',
        about:
            'Complementary application, which is used to manage the services that come out from the Client App',
        technologies: [
          'Java - Kotlin',
          'Retrofit',
          'MVVM',
          'Dart',
          'Laravel',
        ],
        routeGif: InitProyectUiValues.xigoConductor,
        urlSite:
            'https://play.google.com/store/apps/details?id=com.motaxisas.motaxigoconductor',
      ),
      const ItemProject(
        title: 'Somos Junior',
        subtitle: 'Transport application',
        about:
            'This is an entertainment and news App about a soccer team, Implement the designs and what is required',
        technologies: [
          'Java',
          'RxJava',
          'Retrofit',
          'MVC',
          'Laravel',
        ],
        routeImage: InitProyectUiValues.somosjuniorGif,
        urlSite:
            'https://play.google.com/store/apps/details?id=com.wfprogramador.somosjuniors',
      ),
    ];
  }
}
