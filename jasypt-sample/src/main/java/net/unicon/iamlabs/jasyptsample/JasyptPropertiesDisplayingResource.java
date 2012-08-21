package net.unicon.iamlabs.jasyptsample;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.core.Response;

import java.io.IOException;


/**
 * An HTTP resource to simply access and display a property value encrypted by Jasypt core library and decrypted, injected by
 * Jasypt Spring <code>PropertyPlaceholderConfigurer</code> extension.
 *
 * @author Dmitriy Kopylenko
 * @author Unicon, inc.
 */

@Component
@Path("/")
public class JasyptPropertiesDisplayingResource {

	@Value("${value.encrypted.by.jasypt}")
	private String propertyValue;

	@GET
	public Response generateLtpaToken() throws IOException {
		return Response.ok(this.propertyValue).build();
	}
}

