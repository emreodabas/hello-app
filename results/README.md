## Load Test

 I prepare several bash scripts for standardization of tests. 

### load.sh
 
 With below parameters, tests run and generate related output folder and files. In first time, [hey][https://github.com/rakyll/hey] tool measure slowest/fastest request and throughputs. 2nd time, hey tool generate raw results file for creating [hey-hdr][https://github.com/asoorm/hey-hdr] reports.  
 
 This script work with below parameters; 
 - Number of concurrent request --> ex. 1024 
 - Duration of test --> ex. 1m 
 - Node Port of Service --> 32205
 - Test case name --> golang-lowest

 I used binary numbers for concurrent requests. As I know that, this is a best practice for selecting concurrency. 
 
 Default duration time is 1m 

./start-time.sh emreodabas/hello-app-spring-boot:base-zulu11 base-zulu11


### loader-x.sh

loader script automatize warming up and running all cases for related machine type.

 This script work with below parameters; 
 - Number of concurrent request --> ex. 1024 
 - Node Port of Service --> 32205
 - Test case name --> golang

### start-time.sh

This script run docker image and try to get success response from docker image. 
After success response, stop docker image.  start time and end 


https://docs.google.com/spreadsheets/d/1RLA29r-LeKdPUi9GRI2ikJRYeW1IdcQmFPkirJJqwR8/edit?usp=sharing