using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.Domain.Models
{
    public class Tag : Entity
    {
        public string Title { get; set; }
        public virtual ICollection<Post_Tag> Post_Tags { get; set; }

    }
}
