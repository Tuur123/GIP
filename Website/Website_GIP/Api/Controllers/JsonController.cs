using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Api.Controllers
{
    public class JsonController : ApiController
    {
        readonly Database Db = new Database();

        [Route("api/geoJson/")]
        [HttpGet()]
        public IHttpActionResult GetJson(string id)
        {

            return Ok(Db.GetUserData(id));
        }
    }
}
