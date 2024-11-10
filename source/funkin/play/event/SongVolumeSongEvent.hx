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
 *   'e': 'songVolume',
 *   'v': {
 *    'track': 0,
 *    'volume': 0,
 *   }
 * }
 * ```
 *
 * Example: Reset to default values.
 * ```
 * {
 *   'e': 'songVolume',
 * 	 'v': {}
 * }
 * ```
 */
class SongVolumeSongEvent extends SongEvent
{
  public function new()
  {
    super('songVolume');
  }

  public override function handleEvent(data:SongEventData):Void
  {
    // Does nothing if there is no PlayState camera or stage.
    if (PlayState.instance == null) return;
    
    var track:Null<Int> = data.getInt('track');
    if (track == null) track = 0;
    
    var volume:Null<Float> = data.getFloat('volume');
    if (volume == null) volume = 1;

    if (track == 0 || track == 3)
    {
        PlayState.instance.vocals.playerVolume = volume;
    }

    if (track == 1 || track == 3)
    {
        PlayState.instance.vocals.opponentVolume = volume;
    }

    if (track == 2 || track == 3)
    {
        FlxG.sound.music.volume = volume;
    }
  }

  public override function getTitle():String
  {
    return 'Set Song Volume';
  }

  public override function getIconPath():String
  {
    return 'ui/chart-editor/events/songVolume';
  }

  /**
   * ```
   * {
   *   'track': ENUM, // Track
   *   'volume': FLOAT, // Volume
   * }
   * ```
   * @return SongEventSchema
   */
  public override function getEventSchema():SongEventSchema
  {
    return new SongEventSchema([
      {
        name: "track",
        title: "Track",
        defaultValue: 0,
        type: SongEventFieldType.ENUM,
        keys: ["Player Voice" => 0, "Opponent Voice" => 1, "Instrumental" => 2, "All Tracks" => 3]
      },
      {
        name: 'volume',
        title: 'Volume',
        defaultValue: 1,
        step: 0.1,
        type: SongEventFieldType.FLOAT,
        units: ''
      }
    ]);
  }
}
