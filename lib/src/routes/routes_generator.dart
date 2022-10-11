import 'package:app_flutter_thientin/src/donate/index.dart';
import 'package:app_flutter_thientin/src/home/models/campaign_model.dart';
import 'package:app_flutter_thientin/src/pdf/index.dart';
import 'package:app_flutter_thientin/src/proof/index.dart';
import 'package:app_flutter_thientin/src/splash/index.dart';
import 'package:flutter/material.dart';

import '../apply/index.dart';
import '../approve/index.dart';
import '../campaign/index.dart';
import '../create_campaign/index.dart';
import '../error/index.dart';
import '../home/index.dart';
import '../login/index.dart';
import '../profile/index.dart';
import '../tranfers/index.dart';
import '../transaction/index.dart';

class RoutesGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => const Login());
      case '/home':
        return MaterialPageRoute(builder: (_) => const Home());
      case '/apply':
        if (args is CampaignModel) {
          return MaterialPageRoute(
              builder: (_) => Apply(
                    data: args,
                  ));
        }
        return MaterialPageRoute(builder: (_) => const Home());
      case '/approve':
        if (args is int) {
          return MaterialPageRoute(
              builder: (_) => Approve(
                    id: args,
                  ));
        }
        return MaterialPageRoute(builder: (_) => const Home());
      case '/campaign':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => Campaign(
                    id: args,
                  ));
        }
        return MaterialPageRoute(
            builder: (_) => ErrorPage(
                  message: "Không tìm thấy thông tin chiến dịch",
                ));
      case '/create_campaign':
        return MaterialPageRoute(builder: (_) => const CreateCampaign());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const Profile());
      case '/tranfers':
        return MaterialPageRoute(builder: (_) => const Tranfers());
      case '/donate':
        if (args is int) {
          return MaterialPageRoute(
              builder: (_) => Donate(
                    id: args,
                  ));
        }
        return MaterialPageRoute(builder: (_) => const Home());
      case '/transaction':
        if (args is int) {
          return MaterialPageRoute(
              builder: (_) => Transaction(
                    id: args,
                  ));
        }
        return MaterialPageRoute(builder: (_) => const Home());
      case '/proof':
        if (args is CampaignModel) {
          return MaterialPageRoute(
              builder: (_) => Proof(
                    data: args,
                  ));
        }
        return MaterialPageRoute(builder: (_) => const Home());
      case '/splash':
        return MaterialPageRoute(builder: (_) => const Splash());
      case '/erorr':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => ErrorPage(
                    message: args,
                  ));
        }
        return MaterialPageRoute(builder: (_) => ErrorPage());
      case '/pdf':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => PDFScreen(
                    path: args,
                  ));
        }
        return MaterialPageRoute(builder: (_) => const Home());
      default:
        return MaterialPageRoute(builder: (_) => const Login());
    }
  }
}
