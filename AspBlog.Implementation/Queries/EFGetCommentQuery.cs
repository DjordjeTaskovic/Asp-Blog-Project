using AspBlog.Application.Commands;
using AspBlog.Application.DataTransfer;
using AspBlog.Application.Exceptions;
using AspBlog.Application.Queries;
using AspBlog.Application.SearchObjects;
using AspBlog.DataAccess;
using AspBlog.Domain.Models;
using AspBlog.Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.Implementation.Queries
{
    public class EFGetCommentQuery : IGetCommentQuery
    {
        private readonly BlogContext _context;

        public EFGetCommentQuery(BlogContext context)
        {
            _context = context;
        }
        public int Id => 25;
        public string Name => "Get comments";
        public PaggedItems<CommentDto> Execute(CommentSearch search)
        {
            var upit = _context.Comments.AsQueryable();

            upit = upit.Where(x => x.IsActive == true);
            return upit.Pagged(search, x => new CommentDto
            {
                Id = x.Id,
               Content = x.Content,
               Rejting = x.Rejting,
               UserId = x.UserId,
               PostId = x.PostId

            });


        }
    }
}
