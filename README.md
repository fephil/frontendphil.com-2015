# frontendphil.com-2016

[![Build Status](https://travis-ci.org/fephil/frontendphil.com-2016.svg?branch=master)](https://travis-ci.org/fephil/frontendphil.com-2016)

**My website!**

* Author: [Phil Lennon](https://frontendphil.com)
* Source: [github.com/fephil/frontendphil.com-2016](https://github.com/fephil/frontendphil.com-2016)
* Issues and Suggestions: [github.com/fephil/frontendphil.com-2016/issues](https://github.com/fephil/frontendphil.com-2016/issues)
* Twitter: [@frontendphil](https://twitter.com/frontendphil)
* Email: [enquiry@frontendphil.com](mailto:enquiry@frontendphil.com)
* Trello Life List [http://bit.ly/life-list](http://bit.ly/life-list)

***

## About

This is the source code for the website of Phil Lennon.

This website has been made with my frontend workflow [Foley v0.3.2](https://github.com/PJL101/foley), and is automatically built with Travis CI and deployed to Azure.

## Install

* Install Node 4 LTS,
* Run in Terminal: `npm i npm gulp-cli -g`,
* Navigate to the workflow folder in command line Terminal,
* Run: `npm i`.

Please note, there are a large amount of development dependencies to install due to the 'all in one' nature of this workflow. It could possibly take several minutes to install the modules.

## Usage

Run these tasks in your command line Terminal:

`gulp [--production] [--debug]`

`gulp deploy [--production] [--debug]`

`gulp auditcode`

* The `gulp` task builds the website, watches for changes and starts up a sever,
* The `gulp deploy` task builds the website without watching for changes or running the server,
* The `gulp auditcode` task runs various linting on the project source files.
* The `--production` flag builds minified assets with no sourcemaps,
* The `--debug` flag shows the files being created in each task (if the task has a pipe).
