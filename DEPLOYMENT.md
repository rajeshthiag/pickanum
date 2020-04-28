

PickANum is currently deployed on a free-tier heroku dyno. (Does not have persistent room storage)...



### Heroku deployment

* Build Docker image with ```$ npm run build```

* login to heroku's docker registry ```$ docker login --username=rajeshinf --password=$(heroku auth:token) registry.heroku.com``` 

* push tagged image to heroku registry ```$ docker push registry.heroku.com/pickanum/web```

* release new image ```$ heroku container:release web -a pickanum``` (this will finally replace the currently running version on https://pickanum.herokuapp.com)


 
