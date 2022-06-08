using AspBlog.Application.DataTransfer;
using AspBlog.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.Implementation.Validators
{
   public class LikeValidator:AbstractValidator<LikeDto>
    {
        private readonly BlogContext _context;

        public LikeValidator(BlogContext context)
        {
            _context = context;

            RuleFor(x => x.UserId)
                .NotEmpty()
                .WithMessage("User Id is required parameter.")
                .Must(id => _context.Users.Any(p => p.Id == id))
                .WithMessage(p=>$"User with id: {p.UserId} must be registered to vote.");
            RuleFor(x => x.PostId)
               .NotEmpty()
               .WithMessage("PostId is required parameter.")
               .Must(id => _context.Posts.Any(p => p.Id == id))
               .WithMessage(p => $"Post must be exist in database.");
        }
    }
}
