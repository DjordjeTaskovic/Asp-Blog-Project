using AspBlog.Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AspBlog.Api.Core
{
    public class FakeApiActor : IApplicationActor
    {
        public int Id => 1;
        public string Identity => "ApiActor User";
        public IEnumerable<int> AUseCases => new List<int> { 1, 2, 3, 4, 5 };
       
    }
    public class AdminFakeApiActor : IApplicationActor
    {
        public int Id => 2;
        public string Identity => "Api Admin";
        public IEnumerable<int> AUseCases => Enumerable.Range(1,100);


    }

}
