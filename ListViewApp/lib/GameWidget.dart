import 'dart:math';
import 'dart:ui';
import 'package:flame/components/sprite_component.dart';
import 'package:flame/extensions/vector2.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flame/text_config.dart';
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
  var canvasSize;
  Crate()
      : super.fromImage(
          Vector2.all(CRATE_SIZE),
          Flame.images.fromCache('square.png'),
        ) {
    x = 0.0;
    y = 0.0;
    print(canvasSize);
  }
}

class MyGame extends BaseGame with TapDetector {
  MyGame() {
    add(Crate());
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
    //add(Crate(Vector2.all(20)));
  }
}
