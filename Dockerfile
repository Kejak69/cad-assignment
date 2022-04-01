###
# Image can be started manually:
# docker run --rm -ti --network=host -v "./output:/output" -v "./suites:/suites" -v "./scripts:/scripts" -v "./resources:/resources" close_approach_robot bash
#
# Or by using using docer-compose (see commands below):
# docker-compose up
# docker-compose down
###

FROM python:latest

LABEL maintainer="kejak"

LABEL name="Docker file for close approach test assignment"

RUN python3 -m pip install robotframework
RUN python3 -m pip install requests

CMD ["/scripts/run_cad_tests.sh"]