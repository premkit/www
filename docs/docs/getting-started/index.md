+++
date = "2016-07-07T00:00:00Z"
weight = "3"
title = "Getting Started"
+++

PremKit is written to be platform-agnositic. It doesn't matter if you are planning to ship a virtual machine, a collection 
of Docker containers, or plain old fashioned binaries - the PremKit services can help.

PremKit is delivered through a [Load Balancer](/docs/premkit) component, and any number of services that self register with 
the load balancer.  When a service registers, it reserves a [namespace](/docs/premkit/namespaces) and the load balancer will 
route traffic on a round-robin distribution to the services registered with that namespace.