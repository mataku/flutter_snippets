import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HooksScreen extends HookWidget {
  const HooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(seconds: 1),
    );

    // initState + didUpdateWidget + dispose
    useEffect(() {
      // animationController.forward();

      return animationController.dispose;
    }, [animationController]);

    final isFadeIn = useState(false);

    void toggleFadeInAnimation() {
      if (isFadeIn.value) {
        animationController.reverse();
      } else {
        animationController.forward();
      }
      isFadeIn.value = !isFadeIn.value;
    }

    final fadeAnimation = Tween(
      begin: 1.toDouble(),
      end: 0.toDouble(),
    ).animate(animationController);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hooks Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: animationController,
              child: const Text(
                'Hello, Flutter Hooks!',
                style: TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: toggleFadeInAnimation,
              child: Text(isFadeIn.value ? 'Fade Out' : 'Fade In'),
            ),
          ],
        ),
      ),
    );
  }
}
