package funkin.play.event;

import flixel.tweens.FlxTween;
import flixel.FlxCamera;
import flixel.tweens.FlxEase;
// Data from the chart
import funkin.data.song.SongData;
import funkin.data.song.SongData.SongEventData;
// Data from the event schema
import funkin.play.event.SongEvent;
import funkin.data.event.SongEventSchema;
import funkin.data.event.SongEventSchema.SongEventFieldType;

/**
 * 
 *
 * 
 * ```
 * {
 *   'e': 'FadeInOut',
 *   'v': {
 *    'inout': 0,
 *    'object': 0,
 *    'seconds': 0,
 *   }
 * }
 * ```
 *
 * Example: Reset to default values.
 * ```
 * {
 *   'e': 'FadeInOut',
 * 	 'v': {}
 * }
 * ```
 */
class FadeInOutSongEvent extends SongEvent
{
  public function new()
  {
    super('FadeInOut');
  }

  public override function handleEvent(data:SongEventData):Void
  {
    // Does nothing if there is no PlayState camera or stage.
    if (PlayState.instance == null) return;

    var seconds:Null<Float> = data.getFloat('seconds');
    if (seconds == null) seconds = 0;

    var object:Null<Int> = data.getInt('object');
    if (object == null) object = 0;

    var inout:Null<Int> = data.getInt('inout');
    if (inout == null) inout = 0;

    if (inout == 1) //fade out
    {
        if (object == 1)
        {
            if (seconds != 0)
            {
                PlayState.instance.fadeInTween = FlxTween.tween(PlayState.instance.camHUD, {alpha: 0}, seconds);
            }
            else
            {
                PlayState.instance.camHUD.alpha = 0;
            }
        }
        else if (object == 2)
        {
            if (seconds != 0)
            {
                if (PlayState.instance.subtitleTextOVER.text != "")
                {
                    PlayState.instance.fadeInTween = FlxTween.tween(PlayState.instance.subtitleTextOVER, {alpha: 0}, seconds);
                }
                else
                {
                    PlayState.instance.fadeInTween = FlxTween.tween(PlayState.instance.subtitleText, {alpha: 0}, seconds);
                }
            }
            else
            {
                PlayState.instance.subtitleText.alpha = 0;
                PlayState.instance.subtitleTextOVER.alpha = 0;
            }
        }
        else
        {
            if (seconds != 0)
            {
                PlayState.instance.fadeInTween = FlxTween.tween(PlayState.instance.coverscreen, {alpha: 0}, seconds);
            }
            else
            {
                PlayState.instance.coverscreen.alpha = 0;
            }
        }
    }
    else //fade in
    {
        if (object == 1)
        {
            if (seconds != 0)
            {
                PlayState.instance.fadeInTween = FlxTween.tween(PlayState.instance.camHUD, {alpha: 1}, seconds);
            }
            else
            {
                PlayState.instance.camHUD.alpha = 1;
            }
        }
        else if (object == 2)
        {
            if (seconds != 0)
            {
                if (PlayState.instance.subtitleTextOVER.text != "")
                {
                    PlayState.instance.fadeInTween = FlxTween.tween(PlayState.instance.subtitleTextOVER, {alpha: 1}, seconds);
                }
                else
                {
                    PlayState.instance.fadeInTween = FlxTween.tween(PlayState.instance.subtitleText, {alpha: 1}, seconds);
                }
            }
            else
            {
                PlayState.instance.subtitleText.alpha = 1;
                PlayState.instance.subtitleTextOVER.alpha = 1;
            }
        }
        else
        {
            if (seconds != 0)
            {
                PlayState.instance.fadeInTween = FlxTween.tween(PlayState.instance.coverscreen, {alpha: 1}, seconds);
            }
            else
            {
                PlayState.instance.coverscreen.alpha = 1;
            }
        }
    }
  }

  public override function getTitle():String
  {
    return 'Fade In/Out';
  }

  public override function getIconPath():String
  {
    return 'ui/chart-editor/events/FadeInOut';
  }

  /**
   * ```
   * {
   *   'inout': ENUM, // Object
   *   'object': ENUM, // Object
   *   'seconds': FLOAT, // Seconds
   * }
   * ```
   * @return SongEventSchema
   */
  public override function getEventSchema():SongEventSchema
  {
    return new SongEventSchema([
      {
        name: "inout",
        title: "Fade",
        defaultValue: 0,
        type: SongEventFieldType.ENUM,
        keys: ["In" => 0, "Out" => 1]
      },
      {
        name: "object",
        title: "Object",
        defaultValue: 0,
        type: SongEventFieldType.ENUM,
        keys: ["Black Screen" => 0, "UI" => 1, "Subtitles" => 2]
      },
      {
        name: 'seconds',
        title: 'Duration',
        defaultValue: 0,
        step: 0.1,
        type: SongEventFieldType.FLOAT,
        units: 'seconds'
      }
    ]);
  }
}
