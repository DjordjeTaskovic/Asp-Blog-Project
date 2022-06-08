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
   public class EFGetTagQuery: IGetTagQuery
    {
        private readonly BlogContext _context;
        public EFGetTagQuery(BlogContext context)
        {

            _context = context;

        }
        public int Id => 13;
        public string Name => "Geting Tags";

        public PaggedItems<TagNameDto> Execute(TagSearch search)
        {
            var upit = _context.Tags.AsQueryable();
            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                upit = upit.Where(w => w.Title.ToLower().Contains(search.Name.ToLower()));
            }
            upit = upit.Where(d => d.IsActive == true);
            return upit.Pagged(search, x => new TagNameDto
            {
                TagId = x.Id,
                  Name = x.Title
            });


        }
    }
}
