using AspBlog.Application.DataTransfer;
using AspBlog.Application.Queries;
using AspBlog.Application.SearchObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.Application.Commands
{
    public interface IGetCommentQuery:IQuery<CommentSearch, PaggedItems<CommentDto>>
    {
    }
}
