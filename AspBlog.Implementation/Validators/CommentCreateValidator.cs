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
    public class CommentCreateValidator:AbstractValidator<PostCommentDto>
    {
        private readonly BlogContext _context;
        public CommentCreateValidator(BlogContext context)
        {
            _context = context;

            RuleFor(x => x.Content)
             .NotEmpty()
             .WithMessage("Description must be written.");
            
            RuleFor(x => x.UserId)
                .Must(uid => _context.Users.Any(p => p.Id == uid))
               .WithMessage("User must be logged in / exist in database.");

            RuleFor(x => x.PostId)
               .Must(pid => _context.Posts.Any(p => p.Id == pid))
              .WithMessage("Post must exist in database.");
        }

    }
}
