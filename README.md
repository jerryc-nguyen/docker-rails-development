# docker-rails-development

## Create new rails project

New rails app code will be created in same folder with docker-compose.yml
Change `PROJECT_NAME` to your real project name to start development

```
docker compose run --rm creator rails new PROJECT_NAME
```

## To start rails server

Notice that docker-compose.yml used to start, stop multiple rails projects or services like postgres or redis or elasticsearch

So just use `docker compose up SERVICE_NAME` to start defined projects.
For example, this dockerc-compose contains `web1, web2, web3` are 3 rails projects

To develop project `web1`, we can run this command:

```
docker compose up web1
```

## To start rails console used to test, debug our code

Template:

```
docker compose run --rm SERVICE_NAME rails c
```

Change `SERVICE_NAME` to your defined project:
For example:

```
docker compose run --rm web1 rails c
```

##### Notes:

```
Each time you run this command, docker will start new container to run the project.
Use flag `--rm` to remove the container when we exit the rails console session to prevent ghost container.
```
