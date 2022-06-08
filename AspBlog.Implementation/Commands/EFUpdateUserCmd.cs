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
    public class EFUpdateUserCmd : IUpdateUserCmd
    {
        private readonly BlogContext _context;
        private readonly  UserValidator _validator;

        public EFUpdateUserCmd(BlogContext context, UserValidator validator)
        {
            _context = context;
            _validator = validator;
        }
        public int Id => 23;

        public string Name => "User Update";

        public void Execute(UsersDto request)
        {
            _validator.ValidateAndThrow(request);

            var comm = _context.Users.Find(request.Id);

            if (comm == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(User));
            }
         
            comm.FirstName = request.FirstName;
            comm.LastName = request.LastName;
            comm.Phone = request.Phone;
            comm.Email = request.Email;
            comm.Password = request.Password;

            _context.SaveChanges();
        }
    }
}
