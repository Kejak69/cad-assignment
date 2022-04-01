Close approach data test assignment

First step is to build container by using command 'docker build -f ./Dockerfile -t close_approach_robot .'
When contained has been build it can be operated with 'docker-compose up' and 'docker-compose down' commands.
Giving command 'docker-compose up' should run test cases in the test suite. Output directory needs to be 
created before first run, see folder structure at the end of the file. Operating system needs to be Windows  

Used docker container uses local drive as a file storage and only executes test cases. 
When cases has been executed results will be written to the local drive.
Reason to this approach with the container is that it is simplest solution which fullfill
requiremets related to the test execution environment.

In container test cases are executed by Robot Framework. Robot Framework has been extended with a small 
Python library containing two methods, one for get requests and one for comparing expected and actual result. 
Expected results has been stored in separated variable file to keep code clean.

It's possible to do assignment test cases by using only Robot Famework, but I don't Robot Frameworks 
way to  handle dictionaries (json data) and therefor I used Python extension.
 

Assignmets folder sturcture and cotent:
\output
  # result files goes here
\resources
  CloseApproachDataAPI.py     # Python library for Robot Framework
  CloseApproachVariables.py   # Variable file containing refrence responces
\scripts
  run_cad_tests.sh            # Bash script to execute test suite  
\suites
  close_approach_suite.robot  # Test suite containing test cases
docker-compose.yml
Dockerfile
