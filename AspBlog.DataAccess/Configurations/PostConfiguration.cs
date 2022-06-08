using AspBlog.Domain.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.DataAccess.Configurations
{
    public class PostConfiguration : IEntityTypeConfiguration<Post>
    {
        public void Configure(EntityTypeBuilder<Post> builder)
        {
            builder.HasMany(u => u.Comments)
                 .WithOne(o => o.Post)
                 .HasForeignKey(o => o.PostId);

            builder.HasMany(u => u.Post_Categories)
                .WithOne(o => o.Post)
                .HasForeignKey(o => o.PostId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasMany(u => u.Images)
                           .WithOne(o => o.Posts)
                           .HasForeignKey(o => o.PostId)
                           .OnDelete(DeleteBehavior.Restrict);

            builder.HasMany(u => u.Post_Tags)
                  .WithOne(o => o.Post)
                  .HasForeignKey(o => o.PostId)
                  .OnDelete(DeleteBehavior.Restrict);

        }
    }
}
