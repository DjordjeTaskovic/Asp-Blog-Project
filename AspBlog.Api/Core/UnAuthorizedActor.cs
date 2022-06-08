using AspBlog.Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AspBlog.Api.Core
{
  
        public class UnAuthorizedActor : IApplicationActor
        {
            public int Id => 0;
            public string Identity => "UnAuthorized Actor";
            public IEnumerable<int> AUseCases => new List<int> { 19 };
        }
    
}
