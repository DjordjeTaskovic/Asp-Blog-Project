using AspBlog.Application;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.Implementation.Logging
{
    public class ConsoleLogger : IUseCaseLogger
    {
        public void Log(IUseCase useCase, IApplicationActor actor,  object data)
        {
            Console.WriteLine($"{DateTime.Now}: {actor.Identity} is executing {useCase.Name} using data:" +
            $"{JsonConvert.SerializeObject(data)}");
        }
    }
}
