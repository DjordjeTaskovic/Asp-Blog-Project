using AspBlog.Application.DataTransfer;
using AspBlog.Application.Queries;
using AspBlog.Application.SearchObjects;
using AspBlog.DataAccess;
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AspBlog.Implementation.Extensions;

namespace AspBlog.Implementation.Queries
{
    public class EFGetPostQuery : IGetPostsQuery
    {
        private readonly BlogContext _context;

        public EFGetPostQuery(BlogContext context)
        {
            _context = context;
           
        }
        public int Id => 3;

        public string Name => "Post-Get-Search";

        public PaggedItems<ReadPostDto> Execute(PostSearch search)
        {
            var upit = _context.Posts
                .Include(x => x.Images)
                .Include(x=>x.Post_Categories)
                .Include(x=>x.Post_Tags)
                .Include(x => x.Likes)
                .AsQueryable();
            if (!string.IsNullOrEmpty(search.Title) || !string.IsNullOrWhiteSpace(search.Title))
            {
                upit = upit.Where(x => x.Title.ToLower().Contains(search.Title.ToLower()));
            }
            upit = upit.Where(d => d.IsActive == true);

            var offset = search.PerPage * (search.Page - 1);
            var items = new PaggedItems<ReadPostDto>
            {
                CurrentPage = search.Page,
                PerPage = search.PerPage,
                TotalItemCount = upit.Count(),
                Items = upit.Skip(offset).Take(search.PerPage).Select(x => new ReadPostDto
                {
                    Id = x.Id,
                    Title = x.Title,
                    Content = x.Content,
                    UserId = x.UserId,
                    LikeCount = x.Likes.Where(y => y.PostId == x.Id).Count(),
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
