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
   public class UserValidator : AbstractValidator<UsersDto>
    {
        private readonly BlogContext _context;
        public UserValidator(BlogContext context)
        {
            _context = context;
            RuleFor(x => x.FirstName)
               .NotEmpty()
               .WithMessage("First name is required parameter.");
            RuleFor(x => x.LastName)
            .NotEmpty()
            .WithMessage("Lastname is required parameter.");

            RuleFor(x => x.Email)
           .NotEmpty()
           .WithMessage("Email is required parameter.");
            RuleFor(x => x.Password)
           .NotEmpty()
           .WithMessage("Password is required parameter.");

            RuleFor(x => x.Phone)
          .NotEmpty()
          .WithMessage("Phone is required parameter.");

            RuleFor(x => x.Email)
                .Must(n => !_context.Users.Any(p => p.Email == n))
               .WithMessage("Email with the same credentials alredy exists.");
          
        }
    }
}
