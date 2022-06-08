using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.Domain.Models
{
   public class Category:Entity
    {
        public string Name { get; set; }
        public virtual ICollection<Post_Category> Post_Categories { get; set; }


    }
}
