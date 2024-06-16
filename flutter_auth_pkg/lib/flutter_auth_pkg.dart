library flutter_auth_pkg;

import 'package:flutter_auth_pkg/src/core/theme/app_pallete.dart';
import 'package:flutter_auth_pkg/src/core/utils.dart';
import 'package:flutter_auth_pkg/src/core/widgets/custom_field.dart';
import 'package:flutter_auth_pkg/src/core/widgets/loader.dart';
import 'package:flutter_auth_pkg/src/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:flutter_auth_pkg/src/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import 'src/core/models/user_model.dart';
import 'src/core/providers/current_user_notifier.dart';

///
part 'src/features/auth/view/pages/splash_page.dart';
part 'src/features/auth/view/pages/login_page.dart';
part 'src/features/auth/view/pages/signup_page.dart';
part 'src/features/auth/view/pages/profile_page.dart';

late FlutterAuthPkgController flutterAuthPkgController;

class FlutterAuthPkgController {
  UserModel? currentUser;
}

// class FlutterAuthPkg extends StatelessWidget {
//   const FlutterAuthPkg({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const ProviderScope(child: SplashPageAuthPkg());
//   }
// }
