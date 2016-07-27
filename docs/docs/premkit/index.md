+++
date = "2016-07-07T00:00:00Z"
weight = "2001"
title = "PremKit"
+++

The PremKit component is the Load Balancer that all other services register with. This component is designed to 
make service discovery easy because any of your application functions that need access to the PremKit servies only 
need to know where the load balancer is running. Each additional service running behind the load balancer will be 
managed by the PremKit component.

![PremKit Overview](/static/premkit.png)
