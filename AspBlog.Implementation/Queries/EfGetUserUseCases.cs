using AspBlog.Application.DataTransfer;
using AspBlog.Application.Exceptions;
using AspBlog.Application.Queries;
using AspBlog.Application.SearchObjects;
using AspBlog.DataAccess;
using AspBlog.Domain.Models;
using AspBlog.Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.Implementation.Queries
{
   public class EfGetUserUseCases:IGetUserUseCases
    {
        private readonly BlogContext _context;
        public EfGetUserUseCases(BlogContext context)
        {
            _context = context;
        }
        public int Id => 17;
        public string Name => "Search User Use Cases";
        public IEnumerable<UserUseCasesDto> Execute(UserUseCasesSearch search)
        {
            var users = _context.Users.AsQueryable();

            var userList = users.ToList();
            var userUseCasesDb = _context.UserUserCases.Where(x => userList.Select(y => y.Id).Contains(x.UserId));

            var items = new List<UserUseCasesDto>();

            foreach (var user in userList)
            {
                var Ids = userUseCasesDb.Where(x => x.UserId == user.Id).Select(x => x.UseCaseId).ToList();

                items.Add(new UserUseCasesDto
                {
                    AllowedUseCases = Ids,
                    Identity = user.Email,
                    UserId = user.Id
                });
            }

            return items;
        }
    }
}
