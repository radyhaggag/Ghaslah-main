import 'package:flutter/cupertino.dart';

class HomeGradient extends StatelessWidget {
  const HomeGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF3D41B6), Color(0xFF5B47EC)],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(300, 100),
          bottomRight: Radius.elliptical(750, 275),
        ),
      ),
    );
  }
}
