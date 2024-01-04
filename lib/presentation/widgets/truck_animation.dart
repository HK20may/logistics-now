import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:logistics_now/core/constants/app_assets_path.dart';
import 'package:logistics_now/core/utils/routes/route_helper.dart';
import 'package:logistics_now/core/utils/routes/routes.dart';
import 'package:logistics_now/core/widgets/toast.dart';

class TruckAnimation extends StatefulWidget {
  const TruckAnimation({super.key});

  @override
  State<TruckAnimation> createState() => _TruckAnimationState();
}

class _TruckAnimationState extends State<TruckAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    Toast.init();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(
      begin: -100.0,
      end: MediaQuery.of(RouteHelper.navigatorContext).size.width / 2.35,
    ).animate(_controller);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        RouteHelper.pushReplacement(Routes.LOGIN);
      }
    });

    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Stack(
          children: [
            Positioned(
              left: _animation.value,
              top: MediaQuery.of(context).size.height / 2 - 75,
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssetsPath.truckImage),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Center(
                child: AnimatedTextKit(
              totalRepeatCount: 1,
              isRepeatingAnimation: false,
              animatedTexts: [
                TypewriterAnimatedText('Logistics Now',
                    speed: const Duration(milliseconds: 100),
                    textStyle: const TextStyle(
                        // fontFamily: Constants.FONT_FAMILY_FOLDIT,
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold))
              ],
            )),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
