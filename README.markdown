# HandBrake [![macOS Build](https://github.com/HandBrake/HandBrake/workflows/macOS%20build/badge.svg)](https://github.com/HandBrake/HandBrake/actions?query=workflow%3A%22macOS+build%22) [![Windows Build](https://github.com/HandBrake/HandBrake/workflows/Windows%20Build/badge.svg)](https://github.com/HandBrake/HandBrake/actions?query=workflow%3A%22Windows+Build%22) [![Linux Build](https://github.com/HandBrake/HandBrake/workflows/Linux%20Build/badge.svg)](https://github.com/HandBrake/HandBrake/actions?query=workflow%3A%22Linux+Build%22)

## Docker Images  
**Note: arm images does not contain NVENC or H.265 encoding**  
There are 4 types of images right now:  
* bionic - Based off Ubuntu 18.04 Bionic, supports full multi-arch images
* focal - Based off Ubuntu 20.04 Focal, currently only supports x86. ARM support coming soon
* alpine - Based off Alpine Linux, current only supports x86. ARM support coming soon
* batch - Based off the bionic images but adds in batch support (see below)  

### Docker Batch support
Basic usage for batch support is through here. /path/to/in is where you place your ingress videos and /path/to/out is where you get the converted videos  
```bash
docker run -v /path/to/in:/in -v /path/to/out:/out itachi1706/handbrake-multiarch:batch-bionic-rpi-armv7l
```

should you wish to actually define your own preset, you can do so by naming the preset "preset.json" in /path/to/settings, then run this bash command instead
```bash
docker run -v /path/to/in:/in -v /path/to/out:/out -v /path/to/settings:/settings itachi1706/handbrake-multiarch:batch-bionic-rpi-armv7l
```

## Software Information

HandBrake is an open-source video transcoder available for Linux, Mac, and Windows, licensed under the [GNU General Public License (GPL) Version 2](LICENSE).

HandBrake takes videos you already have and makes new ones that work on your mobile phone, tablet, TV media player, game console, computer, or web browser—nearly anything that supports modern video formats.

HandBrake works with most common video files and formats, including ones created by consumer and professional video cameras, mobile devices such as phones and tablets, game and computer screen recordings, and DVD and Blu-ray discs. HandBrake leverages tools such as FFmpeg, x264, and x265 to create new MP4 or MKV video files from these *Sources*.

For information on downloading, building/installing, and using HandBrake, see the official [HandBrake Documentation](https://handbrake.fr/docs).


## Community Support

Visit the [HandBrake Community Forums](https://forum.handbrake.fr/).

Chat on [#handbrake on Freenode IRC](https://webchat.freenode.net/?channels=handbrake) (irc://irc.freenode.net/#handbrake).

For information on HandBrake's community support channels, please see [Community Support](https://handbrake.fr/docs/en/latest/help/community-support.html).

Our [community rules](https://forum.handbrake.fr/app.php/rules) and [code of conduct](https://github.com/HandBrake/HandBrake/blob/master/CODE_OF_CONDUCT.md) apply to both our site and GitHub.


## Contributing

We welcome most contributions. While it is our goal to allow everyone to contribute, contributions not meeting the project's goals or  standards may be rejected.

Please read our [guide to contributing](https://handbrake.fr/docs/en/latest/contributing/contribute.html). This will provide you with all the information you need to start contributing to the project. 

## Translations

We are now accepting translations via  [Transifex](https://www.transifex.com/HandBrakeProject/public) 

Please read our [Translations Guide](https://github.com/HandBrake/HandBrake/blob/master/CODE_OF_CONDUCT.md) and follow the instructions if you are interested in joining the translation effort.


## Additional Information

[Authors](AUTHORS.markdown)  
[License](LICENSE)  
[News](NEWS.markdown)  
[Thanks](THANKS.markdown)
