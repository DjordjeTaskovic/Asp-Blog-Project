using AspBlog.Application.Commands;
using AspBlog.Application.DataTransfer;
using AspBlog.Application.Email;
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
  public  class EFRegisterUserCmd: IRegisterUserCmd
    {
        private readonly BlogContext _context;
        private readonly RegisterUserValidator _validator;
        private readonly IEmailSender _sender;
        public EFRegisterUserCmd(BlogContext context, RegisterUserValidator validator, IEmailSender sender)
        {
            _context = context;
            _validator = validator;
            _sender = sender;
            
        }
        public int Id => 19;
        public string Name => "User Registration";
        public void Execute(RegisterUserDto request)
        {
            _validator.ValidateAndThrow(request);

           var user = new User
            {
                FirstName = request.FirstName,
                LastName = request.LastName,
                Password = request.Password,
                Email = request.Email,
                Phone = request.Phone

            };
            _context.Users.Add(user);
            _context.SaveChanges();
            var newUserId = user.Id;

            var useCases = _context.UserUserCases.Any(x => x.UserId == newUserId);
            if (useCases)
            {
               var casesToDel =  _context.UserUserCases.Where(x => x.UserId == newUserId);
                _context.UserUserCases.RemoveRange(casesToDel);
            }

            IEnumerable<int> AUseCases = new List<int>(new int[] { 1, 2, 3, 4, 5, 6, 7, 8, 9, 13, 21, 23, 25 });
            _context.UserUserCases.AddRange(AUseCases.Select(usecase => new UserUserCase
            {
                UserId = newUserId,
                UseCaseId = usecase
            }));


            //_sender.Send(new SendEmailDto
            //{
            //    Content = "<h1>Registration was succesfull.</h1>",
            //    SendTo = request.Email,
            //    Subject = "User Registration"
            //});
            _context.SaveChanges();
        }
    }
}
