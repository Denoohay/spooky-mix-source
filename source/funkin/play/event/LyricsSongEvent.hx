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
import flixel.util.FlxColor;

/**
 *
 *
 * 
 * ```
 * {
 *   'e': 'Lyrics',
 *   'v': {
 *    'layering': 0,
 *    'lyric': "",
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
  //Subtitle text lol

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
    
    var layering:Null<Int> = data.getInt('layering');
    if (layering == null) layering = 0;

    if (layering == 1)
    {
        PlayState.instance.subtitleTextOVER.text = Constants.DEFAULT_LYRIC + lyric;
        PlayState.instance.subtitleText.text = "";
    }
    else
    {
        PlayState.instance.subtitleText.text = Constants.DEFAULT_LYRIC + lyric;
        PlayState.instance.subtitleTextOVER.text = "";
    }

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
   *   'layering': ENUM, // Layering
   *   'lyric': STRING, // Lyric
   * }
   * ```
   * @return SongEventSchema
   */
  public override function getEventSchema():SongEventSchema
  {
    return new SongEventSchema([
      {
        name: "layering",
        title: "Layering",
        defaultValue: 0,
        type: SongEventFieldType.ENUM,
        keys: ["Under UI (Default)" => 0, "Above Everything" => 1]
      },
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
