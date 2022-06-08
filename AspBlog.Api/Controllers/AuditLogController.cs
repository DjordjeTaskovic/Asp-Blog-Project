using AspBlog.Application;
using AspBlog.Application.Queries;
using AspBlog.Application.SearchObjects;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace AspBlog.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuditLogController : ControllerBase
    {
        private readonly IApplicationActor actor;
        private readonly UseCaseExecutor executor;
        public AuditLogController(IApplicationActor actor, UseCaseExecutor executor)
        {
            this.actor = actor;
            this.executor = executor;
        }
        // GET: api/<AuditLogController>
        [HttpGet]
        public IActionResult Get(
             [FromQuery] AuditLogSearch search, 
           [FromServices] IGetAuditLogQuery query)
        {

            return Ok(executor.ExecuteQuery(query, search));
        }



    }
}
