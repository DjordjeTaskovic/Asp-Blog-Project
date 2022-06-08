using AspBlog.Application.DataTransfer;
using AspBlog.Application.SearchObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.Application.Queries
{
    public interface IGetUserUseCases : IQuery<UserUseCasesSearch, IEnumerable<UserUseCasesDto>>
    {
    }
}
