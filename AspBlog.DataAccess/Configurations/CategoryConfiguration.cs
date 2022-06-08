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
    public class CategoryConfiguration : IEntityTypeConfiguration<Category>
    {
        public void Configure(EntityTypeBuilder<Category> builder)
        {
            builder.HasMany(u => u.Post_Categories)
                 .WithOne(o => o.Category)
                 .HasForeignKey(o => o.CategoryId)
                 .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
