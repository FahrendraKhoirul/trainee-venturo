import 'package:get/route_manager.dart';
import 'package:trainee/configs/routes/main_route.dart';
import 'package:trainee/modules/features/counter/binddings/counter_bindding.dart';
import 'package:trainee/modules/features/counter/views/ui/counter_view.dart';
import 'package:trainee/modules/features/forgot_password/binddings/forgot_password_bindding.dart';
import 'package:trainee/modules/features/forgot_password/binddings/otp_binding.dart';
import 'package:trainee/modules/features/forgot_password/views/ui/forgot_password_view.dart';
import 'package:trainee/modules/features/forgot_password/views/ui/otp_view.dart';
import 'package:trainee/modules/features/initial/bindings/get_location_binding.dart';
import 'package:trainee/modules/features/initial/views/ui/get_location_view.dart';
import 'package:trainee/modules/features/no_connection/views/ui/no_connection_view.dart';
import 'package:trainee/modules/features/sign_in/binddings/sign_in_bindding.dart';
import 'package:trainee/modules/features/sign_in/views/ui/sign_in_view.dart';
import 'package:trainee/modules/features/splash/binddings/splash_bindding.dart';
import 'package:trainee/modules/features/splash/views/ui/splash_view.dart';

abstract class MainPage {
  static final main = [
    /// Setup
    GetPage(
      name: MainRoute.initial,
      page: () => const GetLocationView(),
      binding: GetLocationBinding(),
    ),
    GetPage(
        name: MainRoute.counter,
        page: () => const CounterView(),
        binding: CounterBindding()),
    GetPage(
      name: MainRoute.splash,
      page: () => const SplashView(),
      binding: SplashBindding(),
    ),
    GetPage(
      name: MainRoute.noConnection,
      page: () => const NoConnectionView(),
    ),
    GetPage(
        name: MainRoute.signIn,
        page: () => const SignInView(),
        binding: SignInBindding()),
    GetPage(
        name: MainRoute.forgotPassword,
        page: () => const ForgotPasswordView(),
        binding: ForgotPasswordBindding()),
    GetPage(
        name: MainRoute.otp, page: () => const OtpView(), binding: OtpBinding())
  ];
}
