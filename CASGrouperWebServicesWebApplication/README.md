CAS & Grouper WS Web Application
========

This is a sample ASP .NET web application with a custom implementation of a `RoleProvider` that uses Grouper Web Services to determine roles and permissions.

The key components are the following:

* `GrouperWebServicesClient`: The client that talks to Grouper WS, acts as the enrty point to the grouper WS. Uses an instance `GrouperWebServicesCredentials` to establish a connection
to Grouper WS.

* `GrouperDotNetWebServices\Roles\GrouperWebServicesRoleProvider`: Grouper implementation of the .NET `RoleProvider` class that uses the `GrouperWebServicesClient` to translate grouper roles and permissions to .NET.

* `CASGrouperWebServicesWebApplication\Web.config`: Main configuration of the .NET web application that declares the `<rolemanager>` based on the `GrouperWebServicesRoleProvider`

* `CASGrouperWebServicesWebApplication\AdminRestricted\Web.config`: Declares access permissions through the `authorization` element, allowing only specific roles to enter. 