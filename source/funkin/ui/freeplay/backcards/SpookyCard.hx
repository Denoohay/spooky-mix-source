package funkin.ui.freeplay.backcards;

import funkin.ui.freeplay.FreeplayState;
import flash.display.BitmapData;
import flixel.FlxCamera;
import flixel.math.FlxMath;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import flixel.math.FlxAngle;
import flixel.math.FlxPoint;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxSpriteUtil;
import flixel.util.FlxTimer;
import funkin.graphics.adobeanimate.FlxAtlasSprite;
import funkin.graphics.FunkinSprite;
import funkin.ui.freeplay.charselect.PlayableCharacter;
import funkin.ui.MusicBeatSubState;
import openfl.display.BlendMode;
import flixel.group.FlxSpriteGroup;
import funkin.graphics.shaders.AdjustColorShader;
import flixel.addons.display.FlxTiledSprite;
import flixel.addons.display.FlxBackdrop;

class SpookyCard extends BackingCard
{
  var topCandyRow:FlxBackdrop;
  var lowCandyRow:FlxBackdrop;

  var glow:FlxSprite;
  var backLines:FlxSprite;

  var confirmAtlas:FlxAtlasSprite;

  public override function enterCharSel():Void
  {
    FlxTween.tween(topCandyRow.velocity, {x: 0}, 0.8, {ease: FlxEase.sineIn});
    FlxTween.tween(lowCandyRow.velocity, {x: 0}, 0.8, {ease: FlxEase.sineIn});
  }

  public override function applyExitMovers(?exitMovers:FreeplayState.ExitMoverData, ?exitMoversCharSel:FreeplayState.ExitMoverData):Void
  {
    super.applyExitMovers(exitMovers, exitMoversCharSel);
    if (exitMovers == null || exitMoversCharSel == null) return;

    exitMoversCharSel.set([topCandyRow],
      {
        y: -90,
        speed: 0.8,
        wait: 0.1
      });

    exitMoversCharSel.set([lowCandyRow],
      {
        y: -80,
        speed: 0.8,
        wait: 0.1
      });

    exitMoversCharSel.set([backLines],
      {
        y: -70,
        speed: 0.8,
        wait: 0.1
      });
  }

  public override function init():Void
  {
    FlxTween.tween(pinkBack, {x: 0}, 0.6, {ease: FlxEase.quartOut});
    add(pinkBack);

    confirmTextGlow.blend = BlendMode.ADD;
    confirmTextGlow.visible = false;

    confirmGlow.blend = BlendMode.ADD;

    confirmGlow.visible = false;
    confirmGlow2.visible = false;

    backLines = new FlxSprite(-27, 193).loadGraphic(Paths.image('freeplay/backingCards/spooky/freeplayLines'));
    add(backLines);

    topCandyRow = new FlxBackdrop(Paths.image('freeplay/backingCards/spooky/candyRow1'), X, 20);
    topCandyRow.setPosition(0, 165);
    topCandyRow.velocity.x = -200;
    add(topCandyRow);

    lowCandyRow = new FlxBackdrop(Paths.image('freeplay/backingCards/spooky/candyRow2'), X, 15);
    lowCandyRow.setPosition(0, 340);
    add(lowCandyRow);
    lowCandyRow.velocity.x = 200;

    glow = new FlxSprite(-280, 400).loadGraphic(Paths.image('freeplay/backingCards/spooky/spookyGlow'));
    glow.blend = BlendMode.MULTIPLY;
    add(glow);

    backLines.visible = false;
    topCandyRow.visible = false;
    lowCandyRow.visible = false;
    glow.visible = false;

    confirmAtlas = new FlxAtlasSprite(3, 55, Paths.animateAtlas("freeplay/backingCards/spooky/spooky-confirm"));
    confirmAtlas.visible = false;
    add(confirmAtlas);

    cardGlow.blend = BlendMode.ADD;
    cardGlow.visible = false;
    add(cardGlow);
  }

  override public function confirm():Void
  {
    confirmAtlas.visible = true;
    confirmAtlas.anim.play("");

    FlxTween.color(instance.bgDad, 10 / 24, 0xFFFFFFFF, 0xFF8A8A8A,
      {
        ease: FlxEase.expoOut,
        onUpdate: function(_) {
          instance.angleMaskShader.extraColor = instance.bgDad.color;
        }
      });

    new FlxTimer().start(10 / 24, function(_) {
      // shoot
      FlxTween.color(instance.bgDad, 3 / 24, 0xFF343036, 0xFF696366,
        {
          ease: FlxEase.expoOut,
          onUpdate: function(_) {
            instance.angleMaskShader.extraColor = instance.bgDad.color;
          }
        });
    });

    new FlxTimer().start(14 / 24, function(_) {
      // shoot
      FlxTween.color(instance.bgDad, 3 / 24, 0xFF27292D, 0xFF686A6F,
        {
          ease: FlxEase.expoOut,
          onUpdate: function(_) {
            instance.angleMaskShader.extraColor = instance.bgDad.color;
          }
        });
    });

    new FlxTimer().start(18 / 24, function(_) {
      // shoot
      FlxTween.color(instance.bgDad, 3 / 24, 0xFF2D282D, 0xFF676164,
        {
          ease: FlxEase.expoOut,
          onUpdate: function(_) {
            instance.angleMaskShader.extraColor = instance.bgDad.color;
          }
        });
    });

    new FlxTimer().start(21 / 24, function(_) {
      // shoot
      FlxTween.color(instance.bgDad, 3 / 24, 0xFF29292F, 0xFF62626B,
        {
          ease: FlxEase.expoOut,
          onUpdate: function(_) {
            instance.angleMaskShader.extraColor = instance.bgDad.color;
          }
        });
    });

    new FlxTimer().start(24 / 24, function(_) {
      // shoot
      FlxTween.color(instance.bgDad, 3 / 24, 0xFF29232C, 0xFF808080,
        {
          ease: FlxEase.expoOut,
          onUpdate: function(_) {
            instance.angleMaskShader.extraColor = instance.bgDad.color;
          }
        });
    });
  }

  var beatFreq:Int = 1;
  var beatFreqList:Array<Int> = [1, 2, 4, 8];

  public override function beatHit():Void
  {
    // increases the amount of beats that need to go by to pulse the glow because itd flash like craazy at high bpms.....
    beatFreq = beatFreqList[Math.floor(Conductor.instance.bpm / 140)];

    if (Conductor.instance.currentBeat % beatFreq != 0) return;
  }

  public override function introDone():Void
  {
    pinkBack.color = 0xFF6620AD;

    backLines.visible = true;
    topCandyRow.visible = true;
    lowCandyRow.visible = true;
    glow.visible = true;

    cardGlow.visible = true;
    FlxTween.tween(cardGlow, {alpha: 0, "scale.x": 1.2, "scale.y": 1.2}, 0.45, {ease: FlxEase.sineOut});
  }

  public override function disappear():Void
  {
    FlxTween.color(pinkBack, 0.25, 0xFF98A2F3, 0xFFFFD0D5, {ease: FlxEase.quadOut});

    backLines.visible = false;
    topCandyRow.visible = false;
    lowCandyRow.visible = false;
    glow.visible = false;

    cardGlow.visible = true;
    cardGlow.alpha = 1;
    cardGlow.scale.set(1, 1);
    FlxTween.tween(cardGlow, {alpha: 0, "scale.x": 1.2, "scale.y": 1.2}, 0.25, {ease: FlxEase.sineOut});
  }

  override public function update(elapsed:Float):Void
  {
    super.update(elapsed);
    var scrollProgress:Float = Math.abs(topCandyRow.x % (topCandyRow.frameWidth + 20));
  }
}
