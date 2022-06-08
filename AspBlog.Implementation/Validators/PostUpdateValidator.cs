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
    public class PostUpdateValidator : AbstractValidator<PostUpdateDto>
    {
        private readonly BlogContext _context;
        public PostUpdateValidator(BlogContext context)
        {
            _context = context;
            RuleFor(x => x.Id)
           .Must(i => _context.Posts.Any(p => p.Id == i))
          .WithMessage("Post must exist in database.");

            RuleFor(x => x.UserId)
             .Must(id => _context.Users.Any(p => p.Id == id))
            .WithMessage("User must exist in database.");

            RuleFor(x => x.Title)
                .NotEmpty()
                .WithMessage("Title is required parameter.")
                .Must(title => !_context.Posts.Any(p => p.Title == title))
                .WithMessage(p => $"Post with the name of {p.Title} already exists.");

            RuleFor(x => x.Content)
                .NotEmpty()
                .WithMessage("Post description must be written.");

            RuleFor(x => x.CategoryId)
                .Must(catid => _context.Categories.Any(p => p.Id == catid))
               .WithMessage("Category must exist in database.");

            RuleFor(x => x.PostTags)
               .NotEmpty()
               .WithMessage("There must be at least one defined tag.")
               .Must(i => i.Select(x => x.TagId).Distinct().Count() == i.Count())
               .WithMessage("Duplicate tags are not allowed.")
                .Must(t => !t.Any(p => p.TagId == 0))
               .WithMessage("Tagid must exist in database.");

      
        }
    }

}
