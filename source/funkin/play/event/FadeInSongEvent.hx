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
 *   'e': 'FadeIn',
 *   'v': {
 *    'object': 0,
 *    'seconds': 0,
 *   }
 * }
 * ```
 *
 * Example: Reset to default values.
 * ```
 * {
 *   'e': 'FadeIn',
 * 	 'v': {}
 * }
 * ```
 */
class FadeInSongEvent extends SongEvent
{
  public function new()
  {
    super('FadeIn');
  }

  public override function handleEvent(data:SongEventData):Void
  {
    // Does nothing if there is no PlayState camera or stage.
    if (PlayState.instance == null) return;

    var seconds:Null<Float> = data.getFloat('seconds');
    if (seconds == null) seconds = 0;

    var object:Null<Int> = data.getInt('object');
    if (object == null) object = 0;
    
    
    if (object == 1)
    {
        PlayState.instance.fadeInTween = FlxTween.tween(PlayState.instance.camHUD, {alpha: 1}, seconds);
    }
    else
    {
        PlayState.instance.coverscreen.alpha = 1;
        PlayState.instance.fadeInTween = FlxTween.tween(PlayState.instance.coverscreen, {alpha: 0}, seconds);
    }
  }

  public override function getTitle():String
  {
    return 'Fade In';
  }

  public override function getIconPath():String
  {
    return 'ui/chart-editor/events/FadeIn';
  }

  /**
   * ```
   * {
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
        name: "object",
        title: "Object",
        defaultValue: 0,
        type: SongEventFieldType.ENUM,
        keys: ["Black Screen" => 0, "UI" => 1]
      },
      {
        name: 'seconds',
        title: 'Fade In',
        defaultValue: 0,
        step: 0.1,
        type: SongEventFieldType.FLOAT,
        units: 'seconds'
      }
    ]);
  }
}
