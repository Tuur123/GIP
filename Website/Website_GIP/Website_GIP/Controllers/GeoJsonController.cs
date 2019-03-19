using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Website_GIP.Controllers
{
    public class GeoJsonController : ApiController
    {
        Database Db = new Database();

        [HttpGet]
        public IHttpActionResult GetJson(string id)
        {
            return Ok(Db.GetUserData(id));
        }
    }
}
