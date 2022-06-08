using AspBlog.Application.Commands;
using AspBlog.Application.DataTransfer;
using AspBlog.DataAccess;
using AspBlog.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AspBlog.Implementation.Validators;
using FluentValidation;
using AutoMapper;
using System.IO;

namespace AspBlog.Implementation.Commands
{
    public class EFCreatePostCommand: ICreatePostCommand
    {
        private readonly BlogContext _context;
        private readonly PostCreateValidator _validator;


        public EFCreatePostCommand(BlogContext context, PostCreateValidator validator)
        {
            _context = context;
            _validator = validator;
        }
        public int Id => 1;
        public string Name => "Creating New Post";

        public void Execute(PostCreateDto request)
        {
            _validator.ValidateAndThrow(request);

            var post = new Post
            {
               UserId = request.UserId,
               Title = request.Title,
               Content = request.Content,
               PostDate = DateTime.Now
            };
            _context.Posts.Add(post);
            _context.SaveChanges();
            var PostId = post.Id;

            if (request.ImageFiles.Count > 0)
            {
                foreach (var formFile in request.ImageFiles)
                {
                    if (formFile.Length > 0) {
                        //validacija za naziv slike
                        var slika = formFile.FileName;
                        var image = new Image
                        {
                            PostId = PostId,
                            Image_url = formFile.FileName,
                            Image_alt = "slika." + DateTime.Now
                        };
                         _context.Images.Add(image);
                    }

                    string path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/images");

                    string fileNameWithPath = Path.Combine(path, formFile.FileName);

                    using (var stream = new FileStream(fileNameWithPath, FileMode.Create))
                    {
                        formFile.CopyTo(stream);
                    }
                }
             }
            
                var post_category = new Post_Category { 
                CategoryId = request.CategoryId,
                PostId = PostId
            };
            _context.Post_Categories.Add(post_category);
          //
         
            foreach (var tag in request.PostTagIds)
            {
                var ob = new Post_Tag
                {
                    PostId = PostId,
                    TagId = tag
                };
                _context.Post_Tags.Add(ob);
            }

            _context.SaveChanges();
           
        }
    }
}
