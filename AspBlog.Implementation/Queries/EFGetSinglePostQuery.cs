using AspBlog.Application;
using AspBlog.Application.DataTransfer;
using AspBlog.Application.Exceptions;
using AspBlog.Application.Queries;
using AspBlog.Application.SearchObjects;
using AspBlog.DataAccess;
using AspBlog.Domain.Models;
using AspBlog.Implementation.Extensions;
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.Implementation.Queries
{
    public class EFGetSinglePostQuery : IGetSinglePostQuery
    {
        private readonly BlogContext _context;
        public EFGetSinglePostQuery(BlogContext context)
        {
            _context = context;
           
        }
        public int Id => 5;

        public string Name => "Get Single Post";
        public SingleItems<ReadPostDto> Execute(SingleSearch search)
        {
            var upit = _context.Posts
               .Include(x => x.Images)
               .Include(x => x.Post_Categories)
               .Include(x => x.Post_Tags)
               .AsQueryable();
            var post = _context.Posts.Find(search.PostId);

            if (post == null ||!post.IsActive)
            {
                throw new EntityNotFoundException(search.PostId, typeof(Post));
            }

            var items = new SingleItems<ReadPostDto>
            {
                Items = upit.Where(x => x.Id == search.PostId).Select(x => new ReadPostDto
                {
                    Id = x.Id,
                    Title = x.Title,
                    Content = x.Content,
                    UserId = x.UserId,
                    CategoryName = x.Post_Categories.Select(y => y.Category.Name),
                    TagName = x.Post_Tags.Select(y => y.Tag.Title),
                    PostImages = x.Images.Select(z => new ReadPostImagesDto
                    {
                        ImageId = z.Id,
                        Image_alt = z.Image_alt,
                        Image_url = z.Image_url

                    }),
                    PostComments = x.Comments.Select(y => new ReadCommentsDto
                    {
                        UserName = y.User.FirstName + " " + y.User.LastName,
                        Content = y.Content,
                        Rejting = y.Rejting
                    })

                }).ToList()

            };
            return items;

        }

    }
}
