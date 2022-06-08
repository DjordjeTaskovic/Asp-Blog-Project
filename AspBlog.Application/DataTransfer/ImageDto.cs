using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.Application.DataTransfer
{
    public class ImageDto
    {
        public int PostId { get; set; }
        public string Image_url { get; set; }
        public string Image_alt { get; set; }

    }
}
