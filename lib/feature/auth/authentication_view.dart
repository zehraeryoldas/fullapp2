import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as firebase;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fullapp2/product/constant/index.dart';
import 'package:fullapp2/product/widget/text/sub_title_text.dart';
import 'package:fullapp2/product/widget/text/title_text.dart';

import 'authentication_provider.dart';

class AuthenticationView extends ConsumerStatefulWidget {
  const AuthenticationView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthenticationViewState();
}

class _AuthenticationViewState extends ConsumerState<AuthenticationView> {
  final authProvider =
      StateNotifierProvider<AuthenticationNotifier, AuthenticationState>((ref) {
    return AuthenticationNotifier();
  });
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(FirebaseAuth.instance.currentUser);
    checkUser(FirebaseAuth.instance.currentUser);
  }

  void checkUser(User? user) {
    ref.read(authProvider.notifier).fetchUserDetail(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: firebase.FirebaseUIActions(
        actions: [
          AuthStateChangeAction<SignedIn>((context, state) {
            if (state.user != null) {
              checkUser(state.user);
              print("Okay");
            }
          }),
        ],
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TitleText(
                    value: StringContants.homeBrowse,
                    color: ColorConstants.grayPrimary,
                  ),
                  const SubTitleText(value: StringContants.loginwelcomDetail),
                  Theme(
                    data: ThemeData(
                        outlinedButtonTheme: OutlinedButtonThemeData(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.yellow),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)))),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: firebase.LoginView(
                        //bu hazır yapıya birden fazla custom ekleyebiliriz
                        footerBuilder: (context, action) {
                          return const Text("data");
                        },
                        showTitle: false,
                        action: AuthAction.signIn,
                        providers: FirebaseUIAuth.providersFor(
                          FirebaseAuth.instance.app,
                        ),
                      ),
                    ),
                  ),
                  if (ref.watch(authProvider).isRedirect)
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        StringContants.continueToApp,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ), //loginview: firebase_ui_auth kütüphanesi sayesinde geldi
    );
  }
}
