using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.Domain.Models
{
     public class Comment:Entity
    {
        public int PostId { get; set; }
        public int UserId { get; set; }
        public string Content { get; set; }
        public int Rejting { get; set; }

        public virtual Post Post { get; set; }
        public virtual User User { get; set; }




    }
}
