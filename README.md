# Two Way SMS on AT
#### Complete with /dlr and /responsesms endpoints
We use the minimal [Lumen](https://lumen.laravel.com/docs/5.6) as a drop-in replacement for Laravel.

#### Composer Commands


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
