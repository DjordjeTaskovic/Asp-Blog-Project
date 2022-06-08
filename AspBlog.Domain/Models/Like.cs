using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.Domain.Models
{
   public class Like
    {
        public int? UserId { get; set; }
        public int? PostId { get; set; }
        public virtual Post Post { get; set; }
        public virtual User User { get; set; }
    }
}
