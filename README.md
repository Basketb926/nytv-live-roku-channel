# NYTV.LIVE Roku Channel
NYTV.LIVE Channel for the Roku Platform.

More about NYTV.LIVE: https://nytv.live/info

Based on https://github.com/rokudev/simple-videoplayer-channel

## Directory Structure
- **Components:** The Scene Graph components
  - **Task.xml** A task node that is used to exit the channel on buttonpress.
  - **SimpleVideoScene.brs/xml:** The main scene.
- **Images:** Contains image assets used in the channel
- **Source:** Contains the main brightscript file that runs right when the channel starts

## Build bundle command
```zip -r out/bundle.zip . -x "*.git*" "*.DS_Store" "README.md" "LICENSE"```