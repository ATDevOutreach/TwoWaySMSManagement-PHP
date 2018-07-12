# Two Way SMS Management Using Africa's Talking API's
### INTRO
##### The RESTful API
We use the minimal [Lumen](https://lumen.laravel.com/docs/5.6) as a drop-in replacement for Laravel. We also make use of [HHVM](https://docs.hhvm.com/hhvm/installation/linux#ubuntu-16.04-xenial) instead of PHP 7.X as a matter of experimentation.<br>
##### The ORM for our Database
[Medoo](https://medoo.in/) is  Light PHP Database framework that you can use with various databases for ORM work.
##### Database
MariaDB is a fork of MySQL DB and is useable as a complete drop-in replacement.
#### Docker Env
We use docker to manage our apps environment. And docker-compose to manage our containers as a network.
### APP 
#### Workflow
We are building a 2 way SMS app running on Lumen Framework.
1. A user sends an SMS to a shortcode 20414(replace with your code)
2. The App receives a HTTP POST from Africa's Talkings API and dumps the POST to DB
3. The App responds with an SMS to the Sender
### RESOURCES
#### Composer Commands
- Download the Lumen installer using Composer
````
$ composer global require "laravel/lumen-installer"
````
#### The Docker Commands
- Build
````
$ docker build -t hhvmlaravel:1.0 .
````
- Run
````
$ docker run -d -it --name hhvm -p 8990:80 hhvmlaravel:1.0
$ docker exec -it hhvm bash
````
-Logs
````
$ docker logs --tail hhvm
````
- Ship
````
$ docker login
$ docker push grahamingokho/hhvmlaravel:1.0 .
````
