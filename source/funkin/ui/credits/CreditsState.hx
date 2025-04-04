package funkin.ui.credits;

import flixel.text.FlxText;
import flixel.util.FlxColor;
import funkin.audio.FunkinSound;
import flixel.FlxSprite;
import funkin.ui.mainmenu.MainMenuState;
import flixel.group.FlxSpriteGroup;

/**
 * The state used to display the credits scroll.
 */
class CreditsState extends MusicBeatState
{
  /**
   * The height the credits should start at.
   * Make this an instanced variable so it gets set by the constructor.
   */
  final STARTING_HEIGHT = FlxG.height;

  /**
   * The padding on each side of the screen.
   */
  static final SCREEN_PAD = 24;

  /**
   * The width of the screen the credits should maximally fill up.
   * Make this an instanced variable so it gets set by the constructor.
   */
  final FULL_WIDTH = FlxG.width - (SCREEN_PAD * 2);

  /**
   * The font to use to display the text.
   * To use a font from the `assets` folder, use `Paths.font(...)`.
   * Choose something that will render Unicode properly.
   */
  #if windows
  static final CREDITS_FONT = 'Consolas';
  #elseif mac
  static final CREDITS_FONT = 'Menlo';
  #else
  static final CREDITS_FONT = "Courier New";
  #end

  /**
   * The size of the font.
   */
  static final CREDITS_FONT_SIZE = 24;

  static final CREDITS_HEADER_FONT_SIZE = 32;

  /**
   * The color of the text itself.
   */
  static final CREDITS_FONT_COLOR = FlxColor.WHITE;

  /**
   * The color of the text's outline.
   */
  static final CREDITS_FONT_STROKE_COLOR = FlxColor.BLACK;

  /**
   * The speed the credits scroll at, in pixels per second.
   */
  static final CREDITS_SCROLL_BASE_SPEED = 100.0;

  /**
   * The speed the credits scroll at while the button is held, in pixels per second.
   */
  static final CREDITS_SCROLL_FAST_SPEED = CREDITS_SCROLL_BASE_SPEED * 4.0;

  /**
   * The actual sprites and text used to display the credits.
   */
  var creditsGroup:FlxSpriteGroup;

  var scrollPaused:Bool = false;

  var canScrollUp:Bool = false;

  var pausedText:FlxText;

  public function new()
  {
    super();
  }

  public override function create():Void
  {
    super.create();

    // Background
    var bg = new FlxSprite(Paths.image('menuDesat'));
    bg.scrollFactor.x = 0;
    bg.scrollFactor.y = 0;
    bg.setGraphicSize(Std.int(FlxG.width));
    bg.updateHitbox();
    bg.x = 0;
    bg.y = 0;
    bg.alpha = 0.1;
    bg.visible = true;
    bg.color = 0xFFB57EDC; // Lavender
    // add(bg);

    // TODO: Once we need to display Kickstarter backers,
    // make this use a recycled pool so we don't kill peformance.
    creditsGroup = new FlxSpriteGroup();
    creditsGroup.x = SCREEN_PAD;
    creditsGroup.y = STARTING_HEIGHT;

    buildCreditsGroup();

    add(creditsGroup);

    pausedText = new FlxText(-10, 10, FlxG.width, 'PAUSED');
    pausedText.setFormat(Paths.font('vcr.ttf'), 60, FlxColor.WHITE, FlxTextAlign.RIGHT);
    pausedText.scrollFactor.set(0, 0);
    pausedText.visible = false;
    add(pausedText);

    var upDownText = new FlxText(-10, 670, FlxG.width, 'UP/DOWN to Navigate');
    upDownText.setFormat(Paths.font('vcr.ttf'), 20, FlxColor.WHITE, FlxTextAlign.RIGHT);
    upDownText.scrollFactor.set(0, 0);
    upDownText.alpha = 0.4;
    add(upDownText);

    var howToPauseText = new FlxText(-10, 695, FlxG.width, 'SPACE/ENTER to Pause');
    howToPauseText.setFormat(Paths.font('vcr.ttf'), 20, FlxColor.WHITE, FlxTextAlign.RIGHT);
    howToPauseText.scrollFactor.set(0, 0);
    howToPauseText.alpha = 0.4;
    add(howToPauseText);

    // Music
    FunkinSound.playMusic('breakfast-spooky',
      {
        startingVolume: 0.8,
        overrideExisting: true,
        restartTrack: true,
        loop: true
      });
  }

  function buildCreditsGroup():Void
  {
    var y:Float = 0;

    for (entry in CreditsDataHandler.CREDITS_DATA.entries)
    {
      if (entry.header != null)
      {
        var header = buildCreditsLine(entry.header, y, true, CreditsSide.Left);
        header.bold = true;
        creditsGroup.add(header);
        y += CREDITS_HEADER_FONT_SIZE + (header.textField.numLines * CREDITS_HEADER_FONT_SIZE);
      }

      for (line in entry?.body ?? [])
      {
        var entry = buildCreditsLine(line.line, y, false, CreditsSide.Left);
        creditsGroup.add(entry);
        y += CREDITS_FONT_SIZE * entry.textField.numLines;
      }

      if (entry.appendBackers)
      {
        var backers = CreditsDataHandler.fetchBackerEntries();
        for (backer in backers)
        {
          creditsGroup.add(buildCreditsLine(backer, y, false, CreditsSide.Left));
          y += CREDITS_FONT_SIZE;
        }
      }

      // Padding between each role.
      y += CREDITS_FONT_SIZE * 2.5;
    }
  }

  function buildCreditsLine(text:String, yPos:Float, header:Bool, side:CreditsSide = CreditsSide.Center):FlxText
  {
    // CreditsSide.Center: Full screen width
    // CreditsSide.Left: Left half of screen
    // CreditsSide.Right: Right half of screen
    var xPos = (side == CreditsSide.Right) ? (FULL_WIDTH / 2) : 0;
    var width = (side == CreditsSide.Center) ? FULL_WIDTH : (FULL_WIDTH / 2);
    var size = header ? CREDITS_HEADER_FONT_SIZE : CREDITS_FONT_SIZE;

    var creditsLine:FlxText = new FlxText(xPos, yPos, width + 50, text);
    creditsLine.setFormat(CREDITS_FONT, size, CREDITS_FONT_COLOR, FlxTextAlign.LEFT, FlxTextBorderStyle.OUTLINE, CREDITS_FONT_STROKE_COLOR, true);

    return creditsLine;
  }

  public override function update(elapsed:Float):Void
  {
    super.update(elapsed);

    if (creditsGroup.y <= 360)
    {
        canScrollUp = true;
    }

    if (FlxG.keys.pressed.DOWN)
    {
        // Move the whole group.
        scrollPaused = false;
        pausedText.visible = false;
        creditsGroup.y -= CREDITS_SCROLL_FAST_SPEED * elapsed;
    }
    else if (FlxG.keys.pressed.UP && creditsGroup.y <= 360 && canScrollUp == true)
    {
        // Move the whole group.
        scrollPaused = false;
        pausedText.visible = false;
        creditsGroup.y += CREDITS_SCROLL_FAST_SPEED * elapsed;
    }
    else if (canScrollUp == false && scrollPaused != true)
    {
        // Move the whole group.
        pausedText.visible = false;
        creditsGroup.y -= CREDITS_SCROLL_BASE_SPEED * elapsed;
    }
    else if (!FlxG.keys.pressed.UP && canScrollUp == true && scrollPaused != true)
    {
        // Move the whole group.
        pausedText.visible = false;
        creditsGroup.y -= CREDITS_SCROLL_BASE_SPEED * elapsed;
    }

    if (controls.BACK || hasEnded())
    {
      exit();
    }
    else if (FlxG.keys.justPressed.SPACE || FlxG.keys.justPressed.ENTER)
    {
      pausedText.visible = true;
      scrollPaused = !scrollPaused;
    }
  }

  function hasEnded():Bool
  {
    return creditsGroup.y < -creditsGroup.height;
  }

  function exit():Void
  {
    FlxG.switchState(() -> new MainMenuState());
  }

  public override function destroy():Void
  {
    super.destroy();
  }
}

enum CreditsSide
{
  Left;
  Center;
  Right;
}
