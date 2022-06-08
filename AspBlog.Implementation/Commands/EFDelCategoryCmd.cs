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
   public class EFDelCategoryCmd: IDelCategoryCmd
    {
        private readonly BlogContext _context;

        public EFDelCategoryCmd(BlogContext context)
        {
            this._context = context;
        }
        public int Id => 12;
        public string Name => "Delete category";
        public void Execute(int id)
        {
            var comm = _context.Categories.Find(id);
            if (comm == null)
            {
                throw new EntityNotFoundException(id, typeof(Category));
            }

            comm.IsDeleted = true;
            comm.DeletedAt = DateTime.Now;
            comm.IsActive = false;
            _context.SaveChanges();
        }
    }
}
