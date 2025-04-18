import 'package:flutter/material.dart';
import 'package:robotics_app/feature/camera/presentation/views/camera_view.dart';
import 'package:robotics_app/feature/connection/presentation/view/connection_view.dart';
import 'package:robotics_app/feature/control/presentation/views/control_view.dart';
import 'package:robotics_app/feature/data/presentation/views/data_view.dart';
import 'package:robotics_app/feature/home/presentation/view/home_view.dart';
import 'package:robotics_app/feature/members/presentation/views/members_veiw.dart';
import 'package:robotics_app/feature/spalsh/presentation/view/splash_view.dart';
// Camera Page

Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
<<<<<<< HEAD
    case ConnectionView.routeName:
      return MaterialPageRoute(builder: (_) => const ConnectionView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (_) => const HomeView());

    //! Adding the four new pages for navigation
    case ControlView.routeName:
      return MaterialPageRoute(builder: (_) => const ControlView());
    case DataView.routeName:
      return MaterialPageRoute(builder: (_) => const DataView());
    case MembersView.routeName:
      return MaterialPageRoute(builder: (_) => const MembersView());
    case CameraView.routeName:
      return MaterialPageRoute(builder: (_) => const CameraView());
=======
    case BluetoothConnectionView.routeName:
      return MaterialPageRoute(builder: (_) => const BluetoothConnectionView());
>>>>>>> 2e07e575b852caa9aed3d6ab50afbc2f923c24be

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
