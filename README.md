## E2E Tests with Robot Framework
App to Test: Service Taker - [Vaccine Haven](https://vaccine-haven.herokuapp.com/)

## File 
| Files                        | Desciprtion                                                                                                                                                                                                         |
|------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| register.robot               | Create a test citizen who is registered on the Service Taker site using Robot Framework. However, this is a one time usage for each citizen if you want to test it simply just change the registration information. |
| test_service_taker_app.robot | Contains tests for service taker app of 3AM.                                                                                                                                                                        |

### Test cases
| Test cases                      | Desciprtion                                                                                                                        |
|---------------------------------|------------------------------------------------------------------------------------------------------------------------------------|
| Test verify 2 item on Home page | Visit the home page and verify 2 items on the home page                                                                            |
| Test Make Reservation           | Visit the home page, then click on (make a reservation button), and create a reservation. Verify that the registration was created |
| Test Cancellation               | Cancel the reservation in the previous test and verify that cancellation was successful.                                           |


### Requirements Installation
```
pip install -r requirements.txt
```

### How to run the tests
```
robot vaccine-tests.robot
```

### Which do you think is a better framework for E2E testing of web applications or web services: Robot Framework or Cucumber with Selenium/HTTP library and JUnit?
When it comes to E2E testing of web applications, I think Robot Framework is a better tools. It visualizes how well the web services are performing and provides result files, test logs and the reports of the results for us. However, it's harder to read comparing to Cucumber because of its complex structure.


### What tutorial or online resource(s) did you find most helpful for learning Robot Framework?

[Robot Framework Tutorial by Edureka](https://www.edureka.co/blog/robot-framework-tutorial/)    
[Selenium Library](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)    
[Robot Framework Basics by Robocorp](https://robocorp.com/docs/languages-and-frameworks/robot-framework/basics)