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
    public class EFUpdateTagCmd:IUpdateTagCmd
    {
        private readonly BlogContext _context;
       
        public EFUpdateTagCmd(BlogContext context)
        {
            _context = context;
        }
        public int Id => 15;
        public string Name => "Update tag";

        public void Execute(TagNameDto request)
        {
            var comm = _context.Tags.Find(request.TagId);
            if (comm == null)
            {
                throw new EntityNotFoundException(request.TagId, typeof(Tag));
            }
            comm.Title = request.Name;
            _context.SaveChanges();

        }
    }
}
