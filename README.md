# tweedevs/tweego

[Tweego](https://github.com/tmedwards/tweego), is a command line compiler for Twine/Twee story formats, written in Go.

## Supported Architectures

Our images support multiple architectures such as x86-64, arm64 and armhf. We utilise the docker manifest for multi-platform awareness. More information is available from docker here and our announcement here.

## Prerequisities

In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

## docker-compose

Compatible with [docker-compose](https://docs.docker.com/compose/gettingstarted/) v2 schemas.

```yaml
version: "2.1"
services:
  tweego:
    image: tweedevs/tweego
    container_name: tweego
    environment: 
      # Optional: Default is index.html
      - TWEEGO_OUTFILE=index.html
      # Optional: You can add any additional option https://www.motoslave.net/tweego/docs/#usage-options
      - TWEEGO_OPTIONS=-l --log-files
    volumes: 
      # All volumes are required. There are NO story formats included.
      - path_to_your_project_src:/input
      - path_to_where_you_want_the_file:/output
      - path_to_your_storyformats:/storyformats
```

## docker run

```shell
#Linux
docker run -it -rm \
  -e TWEEGO_FILE=your_file_name.html \
  -v your_path_to_story_formats:/storyformats \
  -v your_path_to_the_twee_files:/input \
  -v your_path_to_the_where_you_want_the_result:/output \
  tweedevs/tweego # You can include options here to pass to tweego
```
```powershell
# Windows Powershell
docker run -it -rm `
  -e TWEEGO_OUTFILE=your_file_name.html `
  -v your_path_to_story_formats:/storyformats `
  -v your_path_to_the_twee_files:/input `
  -v your_path_to_the_where_you_want_the_result:/output `
  tweedevs/tweego
```

### Getting into the shell

Get a shell started in the container:

```shell
docker run -it -rm --entrypoint /bin/sh tweedevs/tweego
```

### Environment Variables

* `TWEEGO_FILE` - The you want applied to tweegos output file. Default is `index.html`
* `TWEEGO_OPTIONS` - Enables passing options to tweego. Deafult is blank.

### Volumes

* `/storyformats` - Story format location, to learn more [the wiki](https://twinery.org/wiki/story_format?s[]=story&s[]=formats) or [Twine Lab](https://twinelab.net/twine-resources/#/?id=story-formats), [format-catalog](https://github.com/tweecode/format-catalog) is a project that works on cataloguing them all.
* `/input` - where you have the source .twee/.tw files you want to compile.
* `/output` - where you want the file to saved to.

You may want to create volumes if you're devoloping locally to shorten the command:

```shell
#Linux
docker volume create --driver local \
  --opt type=none \
  --opt device=your_path_to_story_formats \
  --opt o=bind \
  storyformats
docker volume create --driver local \
  --opt type=none \
  --opt device=your_path_to_the_twee_files \
  --opt o=bind \
  input
docker volume create --driver local \
  --opt type=none \
  --opt device=your_path_to_the_where_you_want_the_result \
  --opt o=bind \
  output
```
```powershell
# Windows Powershell
docker volume create --driver local `
  --opt type=none `
  --opt device=your_path_to_story_formats `
  --opt o=bind `
  storyformats
docker volume create --driver local `
  --opt type=none `
  --opt device=your_path_to_the_twee_files `
  --opt o=bind `
  input
docker volume create --driver local `
  --opt type=none `
  --opt device=your_path_to_the_where_you_want_the_result `
  --opt o=bind `
  output
```

### Useful File Locations

* `/bin/tweego` - tweego executable location, if you are in shell you can call it as a command `tweego`

## Find Us

* [GitHub](https://github.com/twee-devs/)

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the 
[tags on this repository](https://github.com/twee-devs/tweego-docker/tags). 

## Authors

* **BDSMGeek** - *Initial work* - [BDSMGeek](https://github.com/bdsmgeek)

See also the list of [contributors](https://github.com/twee-devs/tweego-docker/contributors) who 
participated in this project.

## License

This project is licensed under the Unlicense - see the [LICENSE.md](LICENSE.md) file for details.

## Acknowledgments

* [Thomas M. Edwards](https://github.com/tmedwards) - Creater of Tweego and the story format Sugarcube.
* [Chapel](https://github.com/ChapelR) - Twine ethusiast with a knack for creating useful things for authors.
* [Twine Games Discord](https://discord.gg/n5dJvPp) - great place for all things Twine related.