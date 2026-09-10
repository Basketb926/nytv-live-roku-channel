' ********** Copyright 2016 Roku Corp.  All Rights Reserved. **********

' 1st function that runs for the scene component on channel startup
sub init()
  'To see print statements/debug info, telnet on port 8089
  m.Image       = m.top.findNode("Image")
  m.ButtonGroup = m.top.findNode("ButtonGroup")
  m.Details     = m.top.findNode("Details")
  m.Title       = m.top.findNode("Title")
  m.Video       = m.top.findNode("Video")
  m.Warning     = m.top.findNode("WarningDialog")
  m.Exiter      = m.top.findNode("Exiter")
  setContent()
  m.ButtonGroup.setFocus(true)
  m.ButtonGroup.observeField("buttonSelected","onButtonSelected")
end sub

sub onButtonSelected()
  'Ok'
  if m.ButtonGroup.buttonSelected = 0
    m.Video.visible = "true"
    m.Video.control = "play"
    m.Video.setFocus(true)
  'Exit button pressed'
  else
    m.Exiter.control = "RUN"
  end if
end sub

'Set your information here
sub setContent()

  m.Image.uri="pkg:/images/NYTV.jpg"
  ContentNode = CreateObject("roSGNode", "ContentNode")
  ContentNode.streamFormat = "hls"
  ContentNode.url = "https://nyc-prod-catalyst-0.lp-playback.studio/hls/video+f169s02ihzgzncku/22_0/index.m3u8"
  ContentNode.ShortDescriptionLine1 = "Live Streaming from New York"
  ContentNode.Description = "Watch live news, events, and programming from New York. Stream directly to your Roku device."
  ContentNode.StarRating = 80
  ContentNode.Length = 0
  ContentNode.Title = "NYTV.live Live Stream"

  m.Video.content = ContentNode

  'Change the buttons
  Buttons = ["Play","Exit"]
  m.ButtonGroup.buttons = Buttons
  m.Title.text = "NYTV.live"
  m.Details.text =  "NYTV.live"

end sub

' Called when a key on the remote is pressed
function onKeyEvent(key as String, press as Boolean) as Boolean
  print "in SimpleVideoScene.xml onKeyEvent ";key;" "; press
  if press then
    if key = "back"
      print "------ [back pressed] ------"
      if m.Warning.visible
        m.Warning.visible = false
        m.ButtonGroup.setFocus(true)
        return true
      else if m.Video.visible
        m.Video.control = "stop"
        m.Video.visible = false
        m.ButtonGroup.setFocus(true)
        return true
      else
        return false
      end if
    else if key = "OK"
      print "------- [ok pressed] -------"
      if m.Warning.visible
        m.Warning.visible = false
        m.ButtonGroup.setFocus(true)
        return true
      end if
    else
      return false
    end if
  end if
  return false
end function
