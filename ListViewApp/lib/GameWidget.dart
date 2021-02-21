import 'dart:math';
import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
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
          Flame.images.fromCache('square.png'),
        ) {
    x = initPos.x;
    y = initPos.y;
    print(initPos);
  }
}

class MyGame extends BaseGame with TapDetector {
  MyGame() {
    add(Crate(Vector2(0.0, 0.0)));
  }

  @override
  Future<void> onLoad() async {
    print("MyGame - load");
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
