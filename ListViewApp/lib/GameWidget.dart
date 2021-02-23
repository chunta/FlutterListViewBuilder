import 'dart:ui';

import 'dart:math';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flame/flame.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/gestures.dart';

final rnd = Random();
final textConfig = TextConfig(
  color: BasicPalette.white.color,
  fontSize: 48.0,
  fontFamily: 'Halo',
);
const CRATE_SIZE = 114.0;

class Crate extends SpriteComponent {
  Vector2 initPos;
  Crate(this.initPos)
      : super.fromImage(
          Vector2.all(CRATE_SIZE),
          Flame.images.fromCache('chopper.png'),
        ) {
    x = initPos.x;
    y = initPos.y;
    print(initPos);
  }
}

class MyGame extends BaseGame with TapDetector {
  Image chopper;
  SpriteAnimation animation;

  MyGame() {
    add(Crate(Vector2(0.0, 0.0)));
  }

  @override
  Future<void> onLoad() async {
    print("MyGame - load");
    chopper = await images.load('ManWalkSequence.png');
    animation = SpriteAnimation.fromFrameData(
      chopper,
      SpriteAnimationData.sequenced(
        amount: 8,
        textureSize: Vector2(170.0, 210.0),
        stepTime: 0.13,
        loop: true,
      ),
    );

    final spriteSize = Vector2(170.0, 210.0);
    final animationComponent2 =
        SpriteAnimationComponent.fromSpriteAnimation(spriteSize, animation);
    animationComponent2.x = size.x / 2 - spriteSize.x;
    animationComponent2.y = spriteSize.y;

    final reversedAnimationComponent =
        SpriteAnimationComponent.fromSpriteAnimation(
      spriteSize,
      animation.reversed(),
    );
    reversedAnimationComponent.x = size.x / 2;
    reversedAnimationComponent.y = spriteSize.y;

    add(animationComponent2);
    //add(reversedAnimationComponent);
  }

  int points = 0;

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final text = points.toString();
    textConfig.render(canvas, text, Vector2(10, 100));
  }

  @override
  void update(double t) {
    super.update(t);
    points++;
  }

  @override
  void onTapDown(TapDownDetails details) {
    print('tap');
    add(Crate(Vector2(details.localPosition.dx, details.localPosition.dy)));
  }
}
