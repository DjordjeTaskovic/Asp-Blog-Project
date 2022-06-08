using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.Application.Queries
{
   public class PaggedItems<T> where T:class
    {
        public int TotalItemCount { get; set; }
        public int PerPage { get; set; }
        public int CurrentPage { get; set; }

        public IEnumerable<T> Items { get; set; }
        public int PageCount => (int)Math.Ceiling((float)TotalItemCount / PerPage);

    }
}
