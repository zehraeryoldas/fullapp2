import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fullapp2/feature/home/home_view.dart';
import 'package:fullapp2/feature/splash/splash_provider.dart';
import 'package:fullapp2/product/constant/index.dart';
import 'package:fullapp2/product/enum/image_constant.dart';
import 'package:fullapp2/product/widget/text/wavy_text.dart';
import 'package:kartal/kartal.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  final splashProvider =
      StateNotifierProvider<SplasProvider, SplashState>((ref) {
    return SplasProvider();
  });

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ''.version; //version aldık burada
    ref.read(splashProvider.notifier).checkApplicationVersion(''.ext.version);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(splashProvider, (previous, next) {
      //burada bir logic yazıyoruz
      if (next.isRequiredForceUpdate ?? false) {
        //eğer next isRequiredForceUpdate null değilse
        showAboutDialog(
            context: context); //showAboutDialog ile bir dialog gösteriyorum
        //işim bittikten sonra return ile kapatıyorum
        return;
      }
      //diyelim ki bir logic daha ekleyecem
      if (next.isRedirectHome != null) {
        //eğer next isRedirectHome null değilse

        if (next.isRedirectHome!) //eğer next isRedirectHome true ise
        {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => const HomeView()));
          // MaterialPageRoute(builder: (context) => const HomeView());
          context.navigateToPage(const HomeView());
        } else {}
      }
    });
    return Scaffold(
      backgroundColor: ColorConstants.purplePrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //!!!!!!BUNU DA BASİTLEŞTİRDİK
            // Image.asset(IconConstants.appIcon.toPng)
            IconConstants.appIcon.toImage,
            const SizedBox(
              height: 30,
            ),

            //!!!!!!!!!!!!!!!!!!!!!!!!!!
            //her zaman parçalamayı bir strateji haline getirmeliyiz. mesela wavy boldu direkt burada da yazarız ama
            //hızlı olması için
            const WavyBoldText(title: StringContants.appName)
          ],
        ),
      ),
    );
  }
}
