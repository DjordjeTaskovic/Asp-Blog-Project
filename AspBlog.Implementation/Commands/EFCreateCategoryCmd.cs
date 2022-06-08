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
    public class EFCreateCategoryCmd : ICreateCategoryCmd
    {
        private readonly BlogContext _context;
        private readonly CategoryCreateValidator _validator;
        public EFCreateCategoryCmd(BlogContext context, CategoryCreateValidator validator)
        {
            _context = context;
            _validator = validator;

        }
        public int Id => 10;
        public string Name => "Create Category";
        public void Execute(PostCategoryDto request)
        {
            _validator.ValidateAndThrow(request);

            var item = new Category
            {
               Name= request.Name
            };
            _context.Categories.Add(item);
            _context.SaveChanges();
        }
    }
}
