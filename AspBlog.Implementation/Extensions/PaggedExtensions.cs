using AspBlog.Application.Queries;
using AspBlog.Application.SearchObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.Implementation.Extensions
{

    public static class PaggedExtensions
    {
        public static PaggedItems<TDto> Pagged<TDto, TEntity>(
            this IQueryable<TEntity> query,
            PaggedSearch search,
            Func<TEntity, TDto> transform
           // ,IMapper mapper
                )
            where TDto : class
        {
            var skipCount = search.PerPage * (search.Page - 1);

            var skipped = query.Skip(skipCount).Take(search.PerPage);

            var response = new PaggedItems<TDto>
            {
                CurrentPage = search.Page,
                PerPage = search.PerPage,
                TotalItemCount = query.Count(),
                Items = query.Skip(skipCount).Take(search.PerPage).Select(x => transform(x)).ToList()
            };

            return response;
        }
    }
}
