# test_private_pip_docker_
This project will be used to test solutions to the task of installing python packages, from a private github repo, into a docker container, using pip.  This repo contains the python script and Dockerfile that will USE the privately hosted repository.

### successful docker pip installation

- Edits:
  - Indentation added for emphasis
  - ```<personal-access-token>``` removed for security

```
Jonathans-MacBook-Pro:test_private_pip_docker_ jonathanlima$ docker build --no-cache --build-arg GIT_TOKEN=<personal-access-token> -t test_private_pip_docker .

    Sending build context to Docker daemon  69.12kB
    Step 1/5 : FROM python:3.6.1
     ---> 955d0c3b1bb2
    Step 2/5 : COPY my_script.py ./
     ---> b7342a392d9d
    Removing intermediate container 413d60a5c575
    Step 3/5 : ARG GIT_TOKEN
     ---> Running in 718a16363132
     ---> b36a38f682c4
    Removing intermediate container 718a16363132
    Step 4/5 : RUN pip install git+https://$GIT_TOKEN:x-oauth-basic@github.com/jlimahaverford/test_private_pip_docker.git
     ---> Running in d0c881a92811
    Collecting git+https://<personal-access-token>:x-oauth-basic@github.com/jlimahaverford/test_private_pip_docker.git
      Cloning https://<personal-access-token>:x-oauth-basic@github.com/jlimahaverford/test_private_pip_docker.git to /tmp/pip-tys257go-build
    Collecting requests (from test-private-pip-docker==0.0)
      Downloading requests-2.18.4-py2.py3-none-any.whl (88kB)
    Collecting chardet<3.1.0,>=3.0.2 (from requests->test-private-pip-docker==0.0)
      Downloading chardet-3.0.4-py2.py3-none-any.whl (133kB)
    Collecting idna<2.7,>=2.5 (from requests->test-private-pip-docker==0.0)
      Downloading idna-2.6-py2.py3-none-any.whl (56kB)
    Collecting certifi>=2017.4.17 (from requests->test-private-pip-docker==0.0)
      Downloading certifi-2017.7.27.1-py2.py3-none-any.whl (349kB)
    Collecting urllib3<1.23,>=1.21.1 (from requests->test-private-pip-docker==0.0)
      Downloading urllib3-1.22-py2.py3-none-any.whl (132kB)
    Installing collected packages: chardet, idna, certifi, urllib3, requests, test-private-pip-docker
      Running setup.py install for test-private-pip-docker: started
        Running setup.py install for test-private-pip-docker: finished with status 'done'
    Successfully installed certifi-2017.7.27.1 chardet-3.0.4 idna-2.6 requests-2.18.4 test-private-pip-docker-0.0 urllib3-1.22
     ---> 868e4c519c2b
    Removing intermediate container d0c881a92811
    Step 5/5 : CMD python my_script.py
     ---> Running in 4799778ac33e
     ---> b8d89e012e81
    Removing intermediate container 4799778ac33e
    Successfully built b8d89e012e81
    Successfully tagged test_private_pip_docker:latest

Jonathans-MacBook-Pro:test_private_pip_docker_ jonathanlima$ docker run -t test_private_pip_docker

    The pumpkin is in the play house!  Also, the current requests version is 2.18.4.

Jonathans-MacBook-Pro:test_private_pip_docker_ jonathanlima$

```
