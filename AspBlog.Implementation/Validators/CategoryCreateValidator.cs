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
    public class CategoryCreateValidator:AbstractValidator<PostCategoryDto>
    {
        private readonly BlogContext _context;
        public CategoryCreateValidator(BlogContext context)
        {
            _context = context;
            
            RuleFor(x => x.Name)
                .NotEmpty()
                .WithMessage("Category name is required parameter.")
                .Must(name => !_context.Categories.Any(p => p.Name == name))
                .WithMessage(p => $"Category with the name of {p.Name} already exists in database.");

        }
    }
}
