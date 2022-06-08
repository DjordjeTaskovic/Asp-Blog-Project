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
    public class EFGetCategoryQuery : IGetCategoryQuery
    {
        private readonly BlogContext _context;
        public EFGetCategoryQuery(BlogContext context)
        {
            _context = context;

        }
        public int Id => 9;

        public string Name => "Geting Categories";

        public PaggedItems<CategoryDto> Execute(CategorySearch search)
        {
            var cat = _context.Categories.AsQueryable();
            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                cat = cat.Where(w => w.Name.ToLower().Contains(search.Name.ToLower()));
            }
            cat = cat.Where(d => d.IsActive == true);
            return cat.Pagged(search, x => new CategoryDto
            {
                Id = x.Id,
               Name = x.Name
            });


        }

    }
}
