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
    public class EFCreateCommentCommand : ICreateCommentCommand
    {
        private readonly BlogContext _context;
        private readonly CommentCreateValidator _validator;


        public EFCreateCommentCommand(BlogContext context, CommentCreateValidator validator)
        {
            _context = context;
            _validator = validator;

        }
        public int Id => 6;

        public string Name => "Create Comment";

        public void Execute(PostCommentDto request)
        {
            _validator.ValidateAndThrow(request);

            var item = new Comment
            {
                PostId =request.PostId,
                UserId = request.UserId,
                Content = request.Content,
                Rejting = request.Rejting
            };
            _context.Comments.Add(item);
            _context.SaveChanges();
        }
    }
}
