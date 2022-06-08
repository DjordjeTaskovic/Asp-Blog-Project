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
    public class CreateTagValidator:AbstractValidator<TagCNameDto>
    {
        private readonly BlogContext _context;
        public CreateTagValidator(BlogContext context)
        {
            _context = context;

            RuleFor(x => x.Name)
                .NotEmpty()
                .WithMessage("Tag name is required parameter.")
                .Must(name => !_context.Tags.Any(p => p.Title == name))
                .WithMessage(p => $"Tag with the name of {p.Name} already exists in database.");

        }
    }
}
