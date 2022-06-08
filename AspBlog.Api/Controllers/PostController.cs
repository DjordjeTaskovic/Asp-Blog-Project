
using AspBlog.Application;
using AspBlog.Application.Commands;
using AspBlog.Application.DataTransfer;
using AspBlog.Application.Exceptions;
using AspBlog.Application.Queries;
using AspBlog.Application.SearchObjects;
using AspBlog.DataAccess;
using AspBlog.Domain.Models;
using AspBlog.Implementation.Validators;
using Bogus;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace AspBlog.Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class PostController : ControllerBase
    {

        private readonly IApplicationActor actor;
        private readonly UseCaseExecutor executor;
        public PostController(IApplicationActor actor, UseCaseExecutor executor)
        {
            this.actor = actor;
            this.executor = executor;
        }

        //api/Post
        // GET: api/<PostController>
        [HttpGet]
        public IActionResult Get(
            [FromQuery] PostSearch search,
            [FromServices] IGetPostsQuery query)
        {

            return Ok(executor.ExecuteQuery(query,search));
        }

        // GET api/<PostController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id,
            [FromQuery] SingleSearch search,
             [FromServices] IGetSinglePostQuery query)
        {
            search.PostId = id;
              return Ok(executor.ExecuteQuery(query, search));
            
        }

        // POST api/<PostController>
        [HttpPost]
        public void Post(
            [FromForm] PostCreateDto dto,
            [FromServices] ICreatePostCommand command)
        {
            
            executor.ExecuteCommand(command, dto);
        }
       

        // PUT api/<PostController>/5
        [HttpPut]
        public IActionResult Put(
            [FromBody] PostUpdateDto dto,
            [FromServices] IUpdatePostCommand command)
        {
           
            executor.ExecuteCommand(command, dto);
            return NoContent();

        }

        // DELETE api/<PostController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id,
            [FromServices] IDeletePostCommand command)
        {
            executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
