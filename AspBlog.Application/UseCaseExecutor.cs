using AspBlog.Application.Exceptions;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.Application
{
   public class UseCaseExecutor
    {
        private readonly IApplicationActor actor;
        private readonly IUseCaseLogger loggerline;

        public UseCaseExecutor(IApplicationActor actor, IUseCaseLogger loggerline)
        {
            this.actor = actor;
            this.loggerline = loggerline;
        }
        //queries

        public TResult ExecuteQuery<TSearch,TResult>
            (IQuery<TSearch, TResult> query,
            TSearch search)
        {
            //log
            loggerline.Log(query, actor, search);
         
            if (!actor.AUseCases.Contains(query.Id))
            { throw new UnauthorizedUseCaseException(query, actor);
            }
           return query.Execute(search);
        }
        //commands
        public void ExecuteCommand<TRequest>
            (ICommand<TRequest> command,
            TRequest request)
        {
            //log
            loggerline.Log(command, actor, request);

            if (!actor.AUseCases.Contains(command.Id)) 
            {throw new UnauthorizedUseCaseException(command, actor);
            }
            command.Execute(request);
        }
    }
}
