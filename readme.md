# Schedulr: Lucee cfschedule UI

## About

It is often necessary to schedule http requests. ColdFusion makes it easy to create or modify a scheduled task with `cfschedule`, Schedulr makes them easy to manage.

## Installation

With commandbox installed on your machine
* clone the repo
* cd into the directory
* `box install` to install dependencies
* `box server start` to start the server
* profit
## Other Stuff

Cron, control-m, nifi, etc are great, but sometimes its nice to have a server running scheduled tasks in the background. The VueJS UI covers many of the cfschedule attributes, but not all (more to be added later). There is only basic validation on the form, but you will be notified if there is an error saving your task.

Using ColdBox 6, it is easy to drop in a new cfc in `/handlers` for more complex tasks.

If you save the output to file it can be found in the `/logs` directory in the root of the project and will set the publish flag accordingly.

![Screenshot](/screenshot.png)