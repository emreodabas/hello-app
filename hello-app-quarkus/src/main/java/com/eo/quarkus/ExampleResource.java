package com.eo.quarkus;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/")
public class ExampleResource {

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/{name}")
    public String hello(@PathParam("name") String name) {
        return "hello " + name;
    }
}