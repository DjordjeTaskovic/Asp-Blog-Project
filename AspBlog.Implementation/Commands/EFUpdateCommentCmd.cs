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
    public class EFUpdateCommentCmd : IUpdateCommentCmd
    {
        private readonly BlogContext _context;
        private readonly UpdateCommentValidator _validator;

        public EFUpdateCommentCmd(BlogContext context, UpdateCommentValidator validator)
        {
            _context = context;
            _validator = validator;
        }
        public int Id => 8;

        public string Name => "Update Comment";

        public void Execute(CommentDto request)
        {
            _validator.ValidateAndThrow(request);

            var comm = _context.Comments.Find(request.Id);

            comm.Content = request.Content;
            comm.Rejting = request.Rejting;
            _context.SaveChanges();

        }
    }
}
