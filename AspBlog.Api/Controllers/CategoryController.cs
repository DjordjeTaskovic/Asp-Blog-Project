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
    public class CategoryController : ControllerBase
    {
        private readonly IApplicationActor actor;
        private readonly UseCaseExecutor executor;
        public CategoryController(IApplicationActor actor, UseCaseExecutor executor)
        {
            this.actor = actor;
            this.executor = executor;
        }
        // GET: api/<CategoryController>
        [HttpGet]
        public IActionResult Get(
             [FromQuery] CategorySearch search,
           [FromServices] IGetCategoryQuery query)
        {

            return Ok(executor.ExecuteQuery(query,search));
        }

        // POST api/<CategoryController>
        [HttpPost]
        public void Post(
          [FromBody] PostCategoryDto dto,
          [FromServices] ICreateCategoryCmd command)
        {
            executor.ExecuteCommand(command, dto);
        }

        // PUT api/<CategoryController>/5
        [HttpPut]
        public IActionResult Put(
            [FromBody] CategoryDto dto,
            [FromServices] IUpdateCategoryCmd command)
        {
       
            executor.ExecuteCommand(command, dto);
            return NoContent();

        }

        // DELETE api/<CategoryController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id,
           [FromServices] IDelCategoryCmd command)
        {
            executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
