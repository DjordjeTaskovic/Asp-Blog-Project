using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.Application.Queries
{
    public class SingleItems<T> where T : class
    {
        public IEnumerable<T> Items { get; set; }
     
    }
}
