using AspBlog.Application.Commands;
using AspBlog.Application.DataTransfer;
using AspBlog.Application.Exceptions;
using AspBlog.DataAccess;
using AspBlog.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.Implementation.Commands
{
   public class EfSetUserUseCases : ISetUserUseCases
    {
        private readonly BlogContext _context;
        public EfSetUserUseCases(BlogContext context)
        {
            _context = context;
        }
        public int Id => 18;

        public string Name => "Update User Use Cases";

        public void Execute(UserUseCasesDto request)
        {
            if (!_context.Users.Any(x => x.Id == request.UserId))
            {
                throw new EntityNotFoundException(request.UserId, typeof(User));
            }

            var useCases = _context.UserUserCases.Where(x => x.UserId == request.UserId);
            _context.UserUserCases.RemoveRange(useCases);

            _context.UserUserCases.AddRange(request.AllowedUseCases.Select(usecase => new UserUserCase
            {
                UserId = request.UserId,
                UseCaseId = usecase
            }));

            _context.SaveChanges();
        }
    }
}
