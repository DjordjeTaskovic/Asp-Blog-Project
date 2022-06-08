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
    public class EFDelCommentCmd : IDelCommentCommand
    {
        private readonly BlogContext _context;

        public EFDelCommentCmd(BlogContext context)
        {
            this._context = context;
        }
        public int Id => 7;
        public string Name => "Delete Comment";
        public void Execute(int id)
        {
            var comm = _context.Comments.Find(id);
            if (comm == null )
            {
                throw new EntityNotFoundException(id, typeof(Comment));
            }

            comm.IsDeleted = true;
            comm.DeletedAt = DateTime.Now;
            comm.IsActive = false;
            _context.SaveChanges();
        }
    }
}
