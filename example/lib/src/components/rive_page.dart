import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RivePage extends StatefulWidget {
  const RivePage({Key? key}) : super(key: key);

  @override
  State<RivePage> createState() => _RivePageState();
}

class _RivePageState extends State<RivePage> {
  late RiveAnimationController _controller;
  SMITrigger? _bump;

  void _onRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(artboard, 'onHover');
    artboard.addController(controller!);
    _bump = controller.findInput<bool>('onHover') as SMITrigger;
  }

  void _hitBump() => _bump?.fire();

  /// Toggles between play and pause animation states
  void _togglePlay() => _controller.isActive = !_controller.isActive;

  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation('windshield_wipers');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      child: ListView(
        controller: ScrollController(),
        children: [
          Text(
              "This is local Rive animation. When you click on it it will change animation."),
          GestureDetector(
            onTap: _togglePlay,
            child: SizedBox(
              height: 500,
              width: 500,
              child: RiveAnimation.network(
                'https://cdn.rive.app/animations/vehicles.riv',
                artboard: 'Jeep',
                animations: ['idle'],
                controllers: [_controller],
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
