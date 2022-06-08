using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.Domain.Models
{
    public class Post_Category
    {
     
        public int? PostId { get; set; }
        public int? CategoryId { get; set; }

        public virtual Post Post { get; set; }
        public virtual Category Category { get; set; }

    }
}
