# llnode-setup

Easy one-step setup for [llnode](https://github.com/nodejs/llnode) 
and all necessary dependencies. 

## Usage

```sh
$ npm i -g llnode-setup
$ llnode-setup
```

This will attempt to install all the necessary dependencies 
(from build-essentials to `lldb`).

## Supported Platforms

* macOS / OS X (tested on Sierra, should on other recent and future releases)
* Ubuntu

## Adding Supported

Pull requests for other systems are very welcome, simply add an sh file
and then detect the platform and run the sh from `cmd.js`. 

## Acknowledgements

Sponsored by [nearForm](http://nearform.com)

## License

MIT

