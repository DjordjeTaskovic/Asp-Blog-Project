using AspBlog.Application;
using AspBlog.Application.Commands;
using AspBlog.Application.DataTransfer;
using AspBlog.Application.Queries;
using AspBlog.Application.SearchObjects;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace AspBlog.Api.Controllers
{
  //  [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class TagController : ControllerBase
    {
        private readonly IApplicationActor actor;
        private readonly UseCaseExecutor executor;
        public TagController(IApplicationActor actor, UseCaseExecutor executor)
        {
            this.actor = actor;
            this.executor = executor;
        }
        // GET: api/<TagController>
        [HttpGet]
        public IActionResult Get(
                   [FromQuery] TagSearch search,
                 [FromServices] IGetTagQuery query)
        {

            return Ok(executor.ExecuteQuery(query, search));
        }

        // POST api/<TagController>
        [HttpPost]
        public void Post(
         [FromBody] TagCNameDto dto,
         [FromServices] ICreateTagCmd command)
        {
            executor.ExecuteCommand(command, dto);
        }

        // PUT api/<TagController>/5
        [HttpPut]
        public IActionResult Put(
            [FromBody] TagNameDto dto,
            [FromServices] IUpdateTagCmd command)
        {
           
            executor.ExecuteCommand(command, dto);
            return NoContent();

        }

        // DELETE api/<TagController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id,
           [FromServices] IDelTagCmd command)
        {
            executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
