using AspBlog.Application.Commands;
using AspBlog.Application.DataTransfer;
using AspBlog.Application.Exceptions;
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
    public class EFUpdateCategoryCmd : IUpdateCategoryCmd
    {
        private readonly BlogContext _context;
        private readonly UpdateCatValidator _validator;

        public EFUpdateCategoryCmd(BlogContext context, UpdateCatValidator validator)
        {
            _context = context;
            _validator = validator;
        }
        public int Id => 11;

        public string Name => "Update category";

        public void Execute(CategoryDto request)
        {
            _validator.ValidateAndThrow(request);

            var comm = _context.Categories.Find(request.Id);
           
            comm.Name = request.Name;
            _context.SaveChanges();

        }
    }
}
