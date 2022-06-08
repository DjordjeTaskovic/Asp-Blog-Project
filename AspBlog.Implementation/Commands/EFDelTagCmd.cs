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
   public class EFDelTagCmd:IDelTagCmd
    {
        private readonly BlogContext _context;

        public EFDelTagCmd(BlogContext context)
        {
            this._context = context;
        }
        public int Id => 16;
        public string Name => "Delete tag";
        public void Execute(int id)
        {
            var comm = _context.Tags.Find(id);
            if (comm == null)
            {
                throw new EntityNotFoundException(id, typeof(Tag));
            }

            comm.IsDeleted = true;
            comm.DeletedAt = DateTime.Now;
            comm.IsActive = false;
            _context.SaveChanges();
        }
    }
}
