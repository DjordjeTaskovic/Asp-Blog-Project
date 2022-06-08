using AspBlog.Application.DataTransfer;
using AspBlog.Application.Queries;
using AspBlog.Application.SearchObjects;
using AspBlog.DataAccess;
using AspBlog.Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.Implementation.Queries
{
    public class EFGetUsersQuery : IGetUsersQuery
    {
        private readonly BlogContext _context;
       
        public EFGetUsersQuery(BlogContext context)
        {
            _context = context;
        }
        public int Id => 22;
        public string Name => "Show Users";

        public PaggedItems<UsersDto> Execute(UserSearch search)
        {
            var cat = _context.Users.AsQueryable();
            if (!string.IsNullOrEmpty(search.FirstName) || !string.IsNullOrWhiteSpace(search.FirstName))
            {
                cat = cat.Where(w => w.FirstName.ToLower().Contains(search.FirstName.ToLower()));
            }
            cat = cat.Where(d => d.IsActive == true);

            return cat.Pagged(search, x => new UsersDto
            {
                Id = x.Id,
                FirstName =x.FirstName,
                LastName =x.LastName,
                Email =x.Email,
                Phone =x.Phone,
                Password =x.Password
            });
        }
    }
}
