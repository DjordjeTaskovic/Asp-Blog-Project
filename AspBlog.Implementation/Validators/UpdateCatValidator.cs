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
    public class UpdateCatValidator : AbstractValidator<CategoryDto>
    {
        private readonly BlogContext _context;
        public UpdateCatValidator(BlogContext context)
        {
            _context = context;

            RuleFor(x => x.Id)
                .NotEmpty()
                .WithMessage("CategoryId is required parameter.")
                .Must(n => _context.Categories.Any(p => p.Id == n))
                .WithMessage(p => $"Category for update must exist.");

        }
    }
}
