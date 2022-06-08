using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.Application.DataTransfer
{
   public class PostCreateDto
    {
        public int? UserId { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
      
        public int CategoryId { get; set; }
        public IEnumerable<int> PostTagIds { get; set; } = new List<int>();
        public IFormFileCollection ImageFiles { get; set; }


    }
    public class PostCreateImagesDto
    {
        public string Image_url { get; set; }
    }

    
    


}
