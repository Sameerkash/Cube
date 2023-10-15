import 'package:cube/auth/secrets.dart';
import 'package:cube/common_utils/colors.dart';
import 'package:cube/common_utils/text_style.dart';
import 'package:cube/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/cube_logo.png'),
          const SizedBox(height: 40,),
          CustomButton(title: 'Get Started', onTap: redirectForAuth, gradientColors: [AppColors.cardPrimary,Colors.white]),
          const SizedBox(height: 20,),
          Text('We use Square to help manage  your businesses.',style: AppTextStyle.regular,textAlign: TextAlign.center,)
        ],
      ),
    );
  }

  void redirectForAuth() async {
    Uri uri = Uri.parse('https://connect.squareupsandbox.com/oauth2/authorize?client_id=${Secrets.squareClientId}&redirect_uri=https://cube65.page.link/onboarding');
    if (!await launchUrl(uri)) {
    throw Exception('Could not launch $uri');
    }
  }
}
