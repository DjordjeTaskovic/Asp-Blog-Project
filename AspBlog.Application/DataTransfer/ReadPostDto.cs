using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.Application.DataTransfer
{
    public class ReadPostDto
    {
        public int Id { get; set; }
        public int? UserId { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public DateTime PostDate { get; set; }
        public IEnumerable<ReadPostImagesDto> PostImages { get; set; } = new List<ReadPostImagesDto>();
        public IEnumerable<ReadCommentsDto> PostComments { get; set; } = new List<ReadCommentsDto>();

        public IEnumerable<string> CategoryName { get; set; }
        public IEnumerable<string> TagName { get; set; }

        public int LikeCount { get; set; }

    }
    public class ReadPostImagesDto
    {
        public int ImageId { get; set; }
        public string Image_url { get; set; }
        public string Image_alt { get; set; }

    }
    public class ReadCommentsDto
    {
        public string UserName { get; set; }
        public string Content { get; set; }
        public int Rejting { get; set; }

    }
}
