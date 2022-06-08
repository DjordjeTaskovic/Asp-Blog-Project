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
    public class UsersController : ControllerBase
    {
        private readonly IApplicationActor actor;
        private readonly UseCaseExecutor executor;
        public UsersController(IApplicationActor actor, UseCaseExecutor executor)
        {

            this.actor = actor;
            this.executor = executor;
        }
        // GET: 
        [HttpGet]
        public IActionResult Get(
            [FromQuery] UserSearch search,
            [FromServices] IGetUsersQuery query)
        {
            return Ok(executor.ExecuteQuery(query, search));
        }

        // PUT api/<TagController>/5
        [HttpPut]
        public IActionResult Put(
            [FromBody] UsersDto dto,
            [FromServices] IUpdateUserCmd command)
        {
           
            executor.ExecuteCommand(command, dto);
            return NoContent();

        }

        // DELETE 
        [HttpDelete("{id}")]
        public IActionResult Delete(int id,
            [FromServices] IDelUserCmd command)
        {
            executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
