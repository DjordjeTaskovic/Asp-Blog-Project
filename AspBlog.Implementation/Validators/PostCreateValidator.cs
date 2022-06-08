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
    public class PostCreateValidator : AbstractValidator<PostCreateDto>
    {
        private readonly BlogContext _context;
        public PostCreateValidator(BlogContext context)
        {
            _context = context;
            RuleFor(x => x.UserId)
             .Must(id => _context.Users.Any(p => p.Id == id))
            .WithMessage("User must exist in database.");

            RuleFor(x => x.Title)
                .NotEmpty()
                .WithMessage("Title is required parameter.")
                .Must(title => !_context.Posts.Any(p => p.Title == title))
                .WithMessage(p => $"Product with the name of {p.Title} already exists in database.");

            RuleFor(x => x.Content)
                .NotEmpty()
                .WithMessage("Post description must be written.");

            RuleFor(x => x.CategoryId)
                .Must(catid => _context.Categories.Any(p => p.Id == catid))
               .WithMessage("Category must exist in database.");

            RuleFor(x => x.PostTagIds)
               .NotEmpty()
               .WithMessage("There must be at least one defined tag.")
               .Must(i => i.Distinct().Count() == i.Count())
               .WithMessage("Duplicate tags are not allowed.");
             

        }

    }
}
