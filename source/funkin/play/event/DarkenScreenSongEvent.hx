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
 *   'e': 'DarkenScreen',
 *   'v': {
 *    'alpha': 0.0,
 *   }
 * }
 * ```
 *
 * Example: Reset to default values.
 * ```
 * {
 *   'e': 'DarkenScreen',
 * 	 'v': {}
 * }
 * ```
 */
class DarkenScreenSongEvent extends SongEvent
{
  public function new()
  {
    super('DarkenScreen');
  }

  public override function handleEvent(data:SongEventData):Void
  {
    // Does nothing if there is no PlayState camera or stage.
    if (PlayState.instance == null) return;

    var alpha:Null<Float> = data.getFloat('alpha');
    if (alpha == null) alpha = 0;

    PlayState.instance.coverscreen.alpha = Constants.DEFAULT_COVERSCREEN_ALPHA + alpha;
  }

  public override function getTitle():String
  {
    return 'Darken Screen';
  }

  public override function getIconPath():String
  {
    return 'ui/chart-editor/events/DarkenScreen';
  }

  /**
   * ```
   * {
   *   'alpha': FLOAT, // Darkness
   * }
   * ```
   * @return SongEventSchema
   */
  public override function getEventSchema():SongEventSchema
  {
    return new SongEventSchema([
      {
        name: 'alpha',
        title: 'Darkness',
        defaultValue: 0,
        step: 0.1,
        type: SongEventFieldType.FLOAT,
        units: ''
      }
    ]);
  }
}
