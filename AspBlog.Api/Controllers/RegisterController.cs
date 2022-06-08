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
    public class RegisterController : ControllerBase
    {
        private readonly IApplicationActor actor;
        private readonly UseCaseExecutor executor;
        public RegisterController(IApplicationActor actor, UseCaseExecutor executor)
        {
            this.actor = actor;
            this.executor = executor;

        }
        // POST api/<RegisterController>
     
        [HttpPost]
        public void Post(
            [FromBody] RegisterUserDto dto,
            [FromServices] IRegisterUserCmd command)
        {
          
            executor.ExecuteCommand(command, dto);

        }


    }
}
