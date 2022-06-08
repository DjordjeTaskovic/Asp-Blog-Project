using AspBlog.Application.Commands;
using AspBlog.Application.DataTransfer;
using AspBlog.Application.Exceptions;
using AspBlog.DataAccess;
using AspBlog.Domain.Models;
using AspBlog.Implementation.Validators;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.Implementation.Commands
{
    public class EFUpdatePostCommand : IUpdatePostCommand
    {
        private readonly BlogContext _context;
        private readonly PostUpdateValidator _validator;

        public EFUpdatePostCommand(BlogContext context, PostUpdateValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 4;

        public string Name => "Update Post Command";

        public void Execute(PostUpdateDto request)
        {
            _validator.ValidateAndThrow(request);

            var post = _context.Posts.Find(request.Id);
            var conectedcats = _context.Post_Categories.Where(z=>z.PostId == request.Id).FirstOrDefault();
            var conectedtags = _context.Post_Tags.Where(z => z.PostId == request.Id).ToList();

         
            post.Title = request.Title;
            post.Content = request.Content;
            post.PostDate = DateTime.Now;
            if (conectedcats != null)
            {
                _context.Remove(conectedcats);
            }
            if(conectedtags != null)
            {
                foreach (var del in conectedtags)
                {
                      _context.Remove(del);
                }
            }
            _context.SaveChanges();
            //
            var post_category = new Post_Category
            {
                CategoryId = request.CategoryId,
                PostId = request.Id
            };
            _context.Post_Categories.Add(post_category);
            //
            foreach (var tag in request.PostTags)
            {
                var ob = new Post_Tag
                {
                    PostId = request.Id,
                    TagId = tag.TagId
                };
                _context.Post_Tags.Add(ob);
            }
            _context.SaveChanges();
        }
     
      
    }
}
