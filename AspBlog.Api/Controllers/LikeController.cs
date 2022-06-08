using AspBlog.Application;
using AspBlog.Application.Commands;
using AspBlog.Application.DataTransfer;
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
    public class LikeController : ControllerBase
    {

        private readonly IApplicationActor actor;
        private readonly UseCaseExecutor executor;
        public LikeController(IApplicationActor actor, UseCaseExecutor executor)
        {

            this.actor = actor;
            this.executor = executor;
        }
        //id posta za dodavanje ili brisanje lajkova
        // PUT api/<PostController>/5
        [HttpPut]
        public IActionResult Put(
            [FromBody] LikeDto dto,
            [FromServices] ILikeCmd command)
        {
          
            executor.ExecuteCommand(command, dto);
            return NoContent();

        }

    }
}
