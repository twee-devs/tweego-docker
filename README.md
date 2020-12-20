# tweego-docker

A docker implementation for [Tweego](https://github.com/tmedwards/tweego), the command line compiler for Twine/Twee story formats, written in Go.

## Getting Started

These instructions will cover usage information and for the docker container 

### Prerequisities

In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

### Usage

#### Docker Compose

Use docker compose if you can, there are some known issues with commandline run not attaching the volumes properly.

```yaml
version: "3.9"
services:
  tweego:
    image: tweedevs/tweego-docker
    environment: 
      - TWEEGO_OUTFILE=name_of_the_output.html
      #- TWEEGO_WATCH=will_trigger_if_set_to_anything
    volumes: 
      - {path_to_your_storyformats}:/storyformats
      - {path_to_your_project_src}:/input
      - {path_to_where_you_want_the_file}:/output
```

#### Container Parameters

List the different parameters available to your container

```shell
docker run tweedevs/tweego-docker:v1.0.0 parameters
```

One example per permutation 

```shell
docker run tweedevs/tweego-docker:v1.0.0 \
    -e TWEEGO_OUTFILE=your_file_name.html \
    -v <your_path_to_story_formats>:/storyformats \
    -v <your_path_to_the_twee_files>:/input \
    -v <your_path_to_the_where_you_want_the_result>:/output
```

Show how to get a shell started in your container too

```shell
docker run tweedevs/tweego-docker:v1.0.0 sh
```

#### Environment Variables

* `TWEEGO_OUTFILE` - The you want applied to tweegos output file. Default is `index.html`
* `TWEEGO_WATCH` - A way to turn on tweego watch functionality. Default is not set, when set to anything it will trigger.

#### Volumes

* `/storyformats` - Story format location, to learn more [the wiki](https://twinery.org/wiki/story_format?s[]=story&s[]=formats) or [Twine Lab](https://twinelab.net/twine-resources/#/?id=story-formats), [format-catalog](https://github.com/tweecode/format-catalog) is a project that works on cataloguing them all.

#### Useful File Locations

* `/root/tweego` - tweego executable location.
  
## Built With

TODO: Honestly don't know what needs to go here.

## Find Us

* [GitHub](https://github.com/twee-devs/tweego-docker)

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