#Docker for local Tests

## First step: install the Docker Desktop 

### Guidelines:
- Create a path ``C:\work``    
 - create image on the path: ``docker-compose up``
 
 - Command:

   ``docker run -v C:\work:/robot -v C:\work\results:/results  tests/robotframework --outputdir /results /robot/SimpleSeleniumUI.robot``
 
 - Command:  ``docker stop image : docker stop jdkfjdkljfldj``
    
#### List images: docker container ps -a
#### remove all containers : docker container prune
