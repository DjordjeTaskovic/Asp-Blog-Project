using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.Application
{
   public interface IApplicationActor
    {
        int Id { get; }
        string Identity { get; }

        IEnumerable<int> AUseCases { get; }
    }
}
