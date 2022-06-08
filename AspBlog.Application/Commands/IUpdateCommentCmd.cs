using AspBlog.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.Application.Commands
{
    public interface IUpdateCommentCmd:ICommand<CommentDto>
    {
    }
}
