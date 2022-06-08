using AspBlog.Application;
using AspBlog.Application.Commands;
using AspBlog.Application.DataTransfer;
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
    public class UseCaseController : ControllerBase
    {
        private readonly IApplicationActor actor;
        private readonly UseCaseExecutor executor;
        public UseCaseController(IApplicationActor actor, UseCaseExecutor executor)
        {
            this.actor = actor;
            this.executor = executor;

        }
        // GET: api/<UseCaseController>
        [HttpGet]
        public IActionResult Get([FromQuery] UserUseCasesSearch search,
            [FromServices] IGetUserUseCases query)
        {
            return Ok(executor.ExecuteQuery(query, search));
        }

        [HttpPut]
        public IActionResult Put([FromBody] UserUseCasesDto request,
            [FromServices] ISetUserUseCases command)
        {
            executor.ExecuteCommand(command, request);
            return NoContent();
        }
       
       

    }
}
