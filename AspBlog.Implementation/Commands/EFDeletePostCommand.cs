using AspBlog.Application.Commands;
using AspBlog.Application.Exceptions;
using AspBlog.DataAccess;
using AspBlog.Domain;
using AspBlog.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.Implementation.Commands
{
    public class EFDeletePostCommand :IDeletePostCommand
    {
        private readonly BlogContext _context;

        public EFDeletePostCommand(BlogContext context)
        {

            this._context = context;
        } 
        public int Id => 2;
        public string Name => "Deleting Post";
        public void Execute(int id)
        {
            var post = _context.Posts.Find(id);
            var images = _context.Images.Where(y => y.PostId == id).ToList();
            var comments = _context.Comments.Where(y => y.PostId == id).ToList();
          
            if (post == null|| images == null)
            {
                throw new EntityNotFoundException(id, typeof(Post));
            }
            else
            {
                post.IsDeleted = true;
                post.DeletedAt = DateTime.Now;
                post.IsActive = false;
                if (images != null)
                {
                    foreach (var del in images)
                    {
                        del.IsDeleted =true;
                        del.DeletedAt = DateTime.Now;
                        del.IsActive = false;
                    }
                }
                if (comments != null)
                {
                    foreach (var cd in comments)
                    {
                        cd.IsDeleted = true;
                        cd.DeletedAt = DateTime.Now;
                        cd.IsActive = false;
                    }
                }
            _context.SaveChanges();
            }

        }
    }
}
