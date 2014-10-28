React    = require 'react'
$        = require 'jquery'
ReactVTT = require './ReactVTT'
Karaoke     = React.createFactory ReactVTT.Karaoke
AudioTrack  = React.createFactory ReactVTT.AudioTrack
IsolatedCue = React.createFactory ReactVTT.IsolatedCue

video  = $ \video .get!0
audio  = $ \audio .get!0
# the resolution of e.timeStamp in FireFox is 100x than other
# browsers and the event fires more frequently, so we should use
# video.currentTime instead of e.timeStamp
React
  ..render do
    Karaoke do
      target: 'track#chocolate-rain'
      current-time: -> video.current-time
    $ \#video-vtt .get!0
  ..render do
    AudioTrack do
      target: 'track#shared-culture'
      current-time: -> audio.current-time
    $ \#audio-vtt .get!0
$ '#video-vtt2 .cue' .each (i) ->
  #node = if @childNodes?lengtn then @childNodes.0 else this
  try
    React.render do
      IsolatedCue do
        target: './assets/chocolate_rain.vtt'
        index: i
        match: $(this)text!
        current-time: -> video.current-time
      this
  catch e
    console.log e, this

