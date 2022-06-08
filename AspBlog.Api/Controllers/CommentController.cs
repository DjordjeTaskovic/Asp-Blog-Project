using AspBlog.Application;
using AspBlog.Application.Commands;
using AspBlog.Application.DataTransfer;
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
    public class CommentController : ControllerBase
    {
        private readonly IApplicationActor actor;
        private readonly UseCaseExecutor executor;
        public CommentController(IApplicationActor actor, UseCaseExecutor executor)
        {
            this.actor = actor;
            this.executor = executor;
        }

        [HttpGet]
        public IActionResult Get(
           [FromQuery] CommentSearch search,
         [FromServices] IGetCommentQuery query)
        {
            return Ok(executor.ExecuteQuery(query, search));
        }

        // POST api/<CommentController>
        [HttpPost]
        public void Post(
           [FromBody] PostCommentDto dto,
           [FromServices] ICreateCommentCommand command)
        {
            executor.ExecuteCommand(command, dto);
        }

        // PUT api/<CommentController>/5
        [HttpPut]
        public IActionResult Put(
           [FromBody] CommentDto dto,
           [FromServices] IUpdateCommentCmd command)
        {
            executor.ExecuteCommand(command,dto);
            return NoContent();

        }

        // DELETE api/<CommentController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id,
            [FromServices] IDelCommentCommand command)
        {
            executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
