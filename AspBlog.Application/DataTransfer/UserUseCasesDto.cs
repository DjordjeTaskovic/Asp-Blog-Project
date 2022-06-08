using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.Application.DataTransfer
{
    public class UserUseCasesDto
    {
        public int UserId { get; set; }
        public string Identity { get; set; }
        public IEnumerable<int> AllowedUseCases { get; set; } = new List<int>();
    }
}
