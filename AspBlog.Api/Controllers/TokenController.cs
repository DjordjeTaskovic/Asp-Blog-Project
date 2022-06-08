using AspBlog.Api.Core;
using AspBlog.Application.DataTransfer;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AspBlog.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TokenController : ControllerBase
    {
        private readonly JwtHandler _handler;
        public TokenController(JwtHandler handler)
        {
            _handler = handler;
        }
        // POST api/<TokenController>
        [HttpPost]
        public IActionResult Post(
            [FromBody] LoginRequest request)
        {
            var token = _handler.MakeToken(request.Email, request.Password);

            if (token == null)
            {
                return Unauthorized();
            }

            return Ok(new { token });
        }
    }
}
