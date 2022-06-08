using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.Application.DataTransfer
{
   public class LikeDto
    {
        public int PostId { get; set; }
        public int UserId { get; set; }
    }
}
