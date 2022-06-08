using AspBlog.Application.DataTransfer;
using AspBlog.Domain.Models;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AspBlog.Api.Core
{
    public class PostProfile : Profile
    {
        public PostProfile()
        {
            CreateMap<Post,PostUpdateDto>();

            CreateMap<PostUpdateDto, Post>();
           
        }
    }
}
