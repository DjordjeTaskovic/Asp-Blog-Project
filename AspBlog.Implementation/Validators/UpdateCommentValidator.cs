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
    public class UpdateCommentValidator : AbstractValidator<CommentDto>
    {
        private readonly BlogContext _context;
        public UpdateCommentValidator(BlogContext context)
        {
            _context = context;

            RuleFor(x => x.Id)
                .NotEmpty()
                .WithMessage("CommentId is required parameter.")
                .Must(n => _context.Comments.Any(p => p.Id == n))
                .WithMessage(p => $"Comment for update must exist.");

        }
    }
}
