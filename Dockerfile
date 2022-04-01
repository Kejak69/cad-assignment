###
# Create image using command docker build -f ./Dockerfile -t close_approach_robot .
# When creted docker compose commands can be used 
# docker-compose up
# docker-compose down
###

FROM python:latest

LABEL maintainer="kejak"

LABEL name="Docker file for close approach test assignment"

RUN python3 -m pip install robotframework
RUN python3 -m pip install requests

CMD ["/scripts/run_cad_tests.sh"]
