using AspBlog.Application.DataTransfer;
using AspBlog.Application.Queries;
using AspBlog.Application.SearchObjects;
using AspBlog.DataAccess;
using AspBlog.Implementation.Extensions;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.Implementation.Queries
{
    public class EFGetAuditLogQuery : IGetAuditLogQuery
    {
        private readonly BlogContext _context;

        public EFGetAuditLogQuery(BlogContext context)
        {
            _context = context;
        }
        public int Id => 20;
        public string Name => "Read AuditLogs";
        public PaggedItems<AuditLogDto> Execute(AuditLogSearch search)
        {
            var upit = _context.UseCaseLogs.AsQueryable();

            if (!string.IsNullOrEmpty(search.UseCaseName) || !string.IsNullOrWhiteSpace(search.UseCaseName))
            {
                upit = upit.Where(w => w.UseCaseName.ToLower().Contains(search.UseCaseName.ToLower()));
            }

            return upit.Pagged(search, x => new AuditLogDto
            {
                Id = x.Id,
                Date = x.Date,
                UseCaseName = x.UseCaseName,
                Actor = x.Actor,
                Data = x.Data
            });


        }
    }
}
