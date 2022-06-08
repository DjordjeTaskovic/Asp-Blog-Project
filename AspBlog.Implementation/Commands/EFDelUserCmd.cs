using AspBlog.Application.Commands;
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
    public class EFDelUserCmd : IDelUserCmd
    {
        private readonly BlogContext _context;

        public EFDelUserCmd(BlogContext context)
        {
            this._context = context;
        }
        public int Id => 24;

        public string Name => "Remove user";

        public void Execute(int request)
        {
            var comm = _context.Users.Find(request);
            if (comm == null)
            {
                throw new EntityNotFoundException(request, typeof(User));
            }

            comm.IsDeleted = true;
            comm.DeletedAt = DateTime.Now;
            comm.IsActive = false;
            _context.SaveChanges();
        }
    }
}
