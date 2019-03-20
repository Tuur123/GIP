﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace WebSiteApi
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Web API configuration and services

            // Web API routes
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
            name: "ControllersApi",
            routeTemplate: "api/{controller}/{action}/{id}",
            defaults: new { controller = "GeoJsonController" ,id = RouteParameter.Optional }
            );
        }
    }
}