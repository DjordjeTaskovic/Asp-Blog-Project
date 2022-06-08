using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.Domain.Models
{
    public class Image: Entity
    {
        public int PostId { get; set; }
        public string Image_url { get; set; }
        public string Image_alt { get; set; }

        public virtual Post Posts { get; set; }


    }
}
