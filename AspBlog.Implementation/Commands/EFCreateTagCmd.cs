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
   public  class EFCreateTagCmd:ICreateTagCmd
    {
        private readonly BlogContext _context;
        private readonly CreateTagValidator _validator;
        public EFCreateTagCmd(BlogContext context, CreateTagValidator validator)
        {
            _context = context;
            _validator = validator;

        }
        public int Id => 14;
        public string Name => "Create tag";
        public void Execute(TagCNameDto request)
        {
            _validator.ValidateAndThrow(request);

            var item = new Tag
            {
                Title = request.Name
            };
            _context.Tags.Add(item);
            _context.SaveChanges();
        }
    }
}
