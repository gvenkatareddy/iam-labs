# Jasypt sample

This is a sample web resource app (using Jersey and Spring) to demonstrate using encrypted password from properties file produced and consumed by [Jasypt library](http://www.jasypt.org/)

Configure
---------
The sample has an encrypted property produced by [Jasypt CLI](http://www.jasypt.org/cli.html) in `src/main/resources/encrypted.properties` file with input `secret` and encryption password `jasypt`. Spring config uses a level of indirection to read encryption password from environment variable named `ENC_PASSWORD`. Make sure to set it in order for this example to work e.g. `export ENC_PASSWORD=jasypt`.

Build
-----
From the root of the project directory run `gradlew` or `gradlew.bat` depending on the target platform. The resulting artifacts will be created in the `build` directory: `build/libs/jasypt-sample.war` archive and `build/jasypt-sample` exploded war directory (if you prefer to deploy it that way).

Run
---
After deploying the war artifact into a Servlet container of choice, simple `GET http(s)://[hostname]/jasypt-sample` and you should see the decrypted property returned.
