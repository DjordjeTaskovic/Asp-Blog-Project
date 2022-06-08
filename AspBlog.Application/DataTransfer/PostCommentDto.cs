using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.Application.DataTransfer
{
    public class PostCommentDto
    {
      
        public int PostId { get; set; }
        public int UserId { get; set; }
        public string Content { get; set; }
        public int Rejting { get; set; }
    }
}
