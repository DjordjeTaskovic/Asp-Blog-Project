﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.Application.Exceptions
{
    public class UnauthorizedUseCaseException :Exception
    {
        public UnauthorizedUseCaseException(IUseCase useCase, IApplicationActor actor)
            :base($"Actor with an id of {actor.Id} and Identity of {actor.Identity} tried to execute {useCase.Name}")
        {
        }
    }
}
