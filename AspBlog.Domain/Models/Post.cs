using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.Domain.Models
{
   public class Post:Entity
    {
       
        public int? UserId { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public DateTime PostDate { get; set; }

        public virtual User User { get; set; }
        public virtual ICollection<Comment> Comments { get; set; }
        public virtual ICollection<Post_Category> Post_Categories { get; set; }
        public virtual ICollection<Like> Likes { get; set; }
        public virtual ICollection<Image> Images { get; set; }
        public virtual ICollection<Post_Tag> Post_Tags { get; set; }




    }
}
