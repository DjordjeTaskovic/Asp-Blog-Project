using AspBlog.Application.Commands;
using AspBlog.Application.DataTransfer;
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
    public class EFLikeCmd : ILikeCmd
    {
        private readonly BlogContext _context;
        private readonly LikeValidator _validator;
        public EFLikeCmd(BlogContext context, LikeValidator validator)
        {
            _context = context;
            _validator = validator;
        }
        public int Id => 21;

        public string Name => "Like Operation";

        public void Execute(LikeDto request)
        {
            _validator.ValidateAndThrow(request);

            var userHasLikeTheSameLike = _context.Likes.Any(p => p.UserId == request.UserId && p.PostId == request.PostId);
            if (userHasLikeTheSameLike)
            {
                var userToDel = _context.Likes.Where(x => x.UserId == request.UserId && x.PostId == request.PostId);
                _context.Likes.RemoveRange(userToDel);
                _context.SaveChanges();
            }
            else
            {
                //ako user nema like, dodajemo
                var userlike = new Like
                {
                    UserId = request.UserId,
                    PostId = request.PostId
                };
                _context.Likes.Add(userlike);
                _context.SaveChanges();

            }
        }
    }
}
