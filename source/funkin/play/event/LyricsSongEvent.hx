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
 *   'e': 'Lyrics',
 *   'v': {
 *    'lyric': 0.0,
 *   }
 * }
 * ```
 *
 * Example: Reset to default values.
 * ```
 * {
 *   'e': 'Lyrics',
 * 	 'v': {}
 * }
 * ```
 */
class LyricsSongEvent extends SongEvent
{
  public function new()
  {
    super('Lyrics');
  }

  public override function handleEvent(data:SongEventData):Void
  {
    // Does nothing if there is no PlayState camera or stage.
    if (PlayState.instance == null) return;

    var lyric:Null<String> = data.getString('lyric');
    if (lyric == null) lyric = "";

    PlayState.instance.subtitleText.text = Constants.DEFAULT_LYRIC + lyric;
  }

  public override function getTitle():String
  {
    return 'Lyrics';
  }

  public override function getIconPath():String
  {
    return 'ui/chart-editor/events/Lyrics';
  }

  /**
   * ```
   * {
   *   'lyric': STRING, // Lyric
   * }
   * ```
   * @return SongEventSchema
   */
  public override function getEventSchema():SongEventSchema
  {
    return new SongEventSchema([
      {
        name: 'lyric',
        title: 'Lyric',
        defaultValue: "",
        step: 0.1,
        type: SongEventFieldType.STRING,
        units: ''
      }
    ]);
  }
}
