using AspBlog.Application;
using AspBlog.Application.Commands;
using AspBlog.Application.Queries;
using AspBlog.DataAccess;
using AspBlog.Implementation.Commands;
using AspBlog.Implementation.Queries;
using AspBlog.Implementation.Validators;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.Api.Core
{
    public static class ContainerExtensions
    {
        public static void AddCommands(this IServiceCollection services)
        {
            services.AddTransient<ICreatePostCommand, EFCreatePostCommand>();
            services.AddTransient<IDeletePostCommand, EFDeletePostCommand>();
            services.AddTransient<IUpdatePostCommand, EFUpdatePostCommand>();
            services.AddTransient<ICreateCommentCommand, EFCreateCommentCommand>();
            services.AddTransient<IDelCommentCommand, EFDelCommentCmd>();
            services.AddTransient<IUpdateCommentCmd, EFUpdateCommentCmd>();
            services.AddTransient<ICreateCategoryCmd, EFCreateCategoryCmd>();
            services.AddTransient<IUpdateCategoryCmd, EFUpdateCategoryCmd>();
            services.AddTransient<IDelCategoryCmd, EFDelCategoryCmd>();
            services.AddTransient<ICreateTagCmd, EFCreateTagCmd>();
            services.AddTransient<IUpdateTagCmd, EFUpdateTagCmd>();
            services.AddTransient<IDelTagCmd, EFDelTagCmd>();
            services.AddTransient<IRegisterUserCmd, EFRegisterUserCmd>();
            services.AddTransient<ISetUserUseCases, EfSetUserUseCases>();
            services.AddTransient<ILikeCmd, EFLikeCmd>();
            services.AddTransient<IUpdateUserCmd, EFUpdateUserCmd>();
            services.AddTransient<IDelUserCmd, EFDelUserCmd>();




        }
        public static void AddQueries(this IServiceCollection services)
        {
            services.AddTransient<IGetPostsQuery, EFGetPostQuery>();
            services.AddTransient<IGetSinglePostQuery, EFGetSinglePostQuery>();
            services.AddTransient<IGetCategoryQuery, EFGetCategoryQuery>();
            services.AddTransient<IGetTagQuery, EFGetTagQuery>();
            services.AddTransient<IGetUserUseCases, EfGetUserUseCases>();
            services.AddTransient<IGetAuditLogQuery, EFGetAuditLogQuery>();
            services.AddTransient<IGetUsersQuery, EFGetUsersQuery>();
            services.AddTransient<IGetCommentQuery, EFGetCommentQuery>();



        }

        public static void AddValidators(this IServiceCollection services)
        {
            services.AddTransient<PostCreateValidator>();
            services.AddTransient<PostUpdateValidator>();
            services.AddTransient<CommentCreateValidator>();
            services.AddTransient<CategoryCreateValidator>();
            services.AddTransient<CreateTagValidator>();
            services.AddTransient<RegisterUserValidator>();
            services.AddTransient<LikeValidator>();
            services.AddTransient<UserValidator>();
            services.AddTransient<UpdateCatValidator>();
            services.AddTransient<UpdateCommentValidator>();
            services.AddTransient<PostCreateValidator>();




        }

        public static void AddApplicationActor(this IServiceCollection services)
        {

            services.AddTransient<IApplicationActor>(x =>
            {
                var accessor = x.GetService<IHttpContextAccessor>();

                var user = accessor.HttpContext.User;

                if (user.FindFirst("ActorData") == null)
                {
                    //throw new InvalidOperationException("Actor data doesnt exist in token.");
                    return new UnAuthorizedActor();
                }

                var actorString = user.FindFirst("ActorData").Value;

                var actor = JsonConvert.DeserializeObject<JwtActor>(actorString);
                return actor;

            });
        }

        public static void AddJwt(this IServiceCollection services)
        {
            services.AddTransient<JwtHandler>();
            services.AddAuthentication(options =>
            {
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultSignInScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(cfg =>
            {
                cfg.RequireHttpsMetadata = false;
                cfg.SaveToken = true;
                cfg.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidIssuer = "asp_api",
                    ValidateIssuer = true,
                    ValidAudience = "Any",
                    ValidateAudience = true,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("ThisIsMyVerySecretKey")),
                    ValidateIssuerSigningKey = true,
                    ValidateLifetime = true,
                    ClockSkew = TimeSpan.Zero
                };
            });
        }
    }
}
