
# Guidelines:
#Create a path C:\work    
# create image on the path: docker-compose up
#copy files to run 
# docker run -v C:\work:/robot -v C:\work\results:/results  tests/robotframework --outputdir /results /robot/SimpleSeleniumUI.robot
# docker stop image : docker stop jdkfjdkljfldj 
# dele image: docker container ps -a
#remove all containers : docker container prune

#Base image
FROM python:3 as Test

#update the image
RUN apt-get update

#install robotframework and seleniumlibrary
RUN pip3 install robotframework
RUN pip3 install robotframework-seleniumlibrary

#The followig are needed for Chrome and Chromedriver installation
RUN apt-get install -y xvfb 
RUN apt-get install -y zip 
RUN apt-get install -y wget 
RUN apt-get install ca-certificates 


 # Chrome instalation 
# install google chrome
RUN apt-get install -yqq unzip
RUN wget -O /tmp/chrome-linux64.zip https://storage.googleapis.com/chrome-for-testing-public/125.0.6422.141/linux64/chrome-linux64.zip
RUN unzip /tmp/chrome-linux64.zip -d /opt/ 

# install chromedriver
RUN wget -N https://storage.googleapis.com/chrome-for-testing-public/125.0.6422.141/linux64/chromedriver-linux64.zip
RUN unzip chromedriver-linux64.zip  -d /opt/ 
RUN rm chromedriver-linux64.zip

#Robot Specific
RUN mkdir /robot
RUN mkdir /results
ENTRYPOINT ["robot"]