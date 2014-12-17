dockertraining
==============

A Docker training repository. A custom image is built on top of Ubuntu base image. It uses supervisor as deamon manager and deploys a simple Flask application with ``uwsgi`` and ``nginx`` 

Building Image
---------------

    docker build -t onalu/dockertraining .

Running a Container
-------------------
In order to manage other daemons, supervisord is running as a daemon. Container will expose port 80 for nginx and port 5000 for Flask.

    docker run -d -P  --name training onalu/dockertraining supervisord

Running containers can be seen with following command:

    docker ps

Starting and Stoping A Container
----------------------------

Stoping:

    docker stop training
    
Starting:

    docker start training

After rebuilding image, container must be killed and removed in order to run again:

    docker kill training
    docker rm training

Controlling Daemons
----------------

``docker exec`` command will be used for calling ``supervisorctl`` and controlling the defined daemons.
  
  Checking status:
  
    docker exec supervisorctl status
  
  Starting uwsgi and nginx:
  
      docker exec training supervisorctl start uwsgi
      docker exec training supervisorctl start nginx


  
