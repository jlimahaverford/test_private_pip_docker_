FROM python:3.6.1
COPY my_script.py ./
ARG GIT_TOKEN
RUN pip install git+https://$GIT_TOKEN:x-oauth-basic@github.com/jlimahaverford/test_private_pip_docker.git
CMD python my_script.py
