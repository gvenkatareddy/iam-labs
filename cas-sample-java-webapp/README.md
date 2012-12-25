Example CASified Java Web Application
=====================================

This is sample java web application that exercises the CAS protocol features via the Java CAS Client.

Configure
---------

- Adjust the url endpoints of the CAS server and the application server in the `web.xml` file.
- If you wish to exercise proxy authentication, switch your CAS client filters to be `AuthenticationFilter` and `Cas20ProxyReceivingTicketValidationFilter`.

##Build
-------

###Ant Build

- Adjust the `build.xml` file to note the location of the application server and the way environment variables are configured. (i.e. `catalina.home`, `M2_HOME`, etc)
- From the root of the project directory run `ant deploy`. 
- The resulting WAR file will be available inside the container's `webapps` directory as `cas-sample-java-webapp.war`

###Maven Build

- If you prefer a Maven build, From the root of the project directory run `mvn clean package`. 
- The resulting WAR file will be available inside the prohject's `target` directory as `cas-sample-java-webapp.war`. Copy the file over to your container's environment. 

##Run
Pull up the URL `https://[server-address]/cas-sample-java-webapp` in your browser. You'll immediately be redirected to the CAS server login page, and back to the application with authentication details and attributes displayed in the `index.jsp` file.


