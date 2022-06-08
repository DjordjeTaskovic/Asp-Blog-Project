using AspBlog.DataAccess.Configurations;
using AspBlog.Domain;
using AspBlog.Domain.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AspBlog.DataAccess
{
   public class BlogContext:DbContext
    {
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            ///seeders
            //////faker data input
            modelBuilder.ApplyConfiguration(new CategoryConfiguration());
            modelBuilder.ApplyConfiguration(new PostConfiguration());
            modelBuilder.ApplyConfiguration(new UserConfiguration());
            modelBuilder.Entity<Post_Category>().HasKey(x => new { x.PostId, x.CategoryId });
            modelBuilder.Entity<Post_Tag>().HasKey(x =>new {x.PostId , x.TagId });
            modelBuilder.Entity<Like>().HasKey(x => new { x.PostId, x.UserId });

        }
        public override int SaveChanges()
        {
            foreach (var entry in ChangeTracker.Entries())
            {
                if (entry.Entity is Entity e)
                {
                    switch (entry.State)
                    {
                        case EntityState.Added:
                            e.IsActive = true;
                            e.CreatedAt = DateTime.Now;
                            e.IsDeleted = false;
                            e.ModifiedAt = null;
                            e.DeletedAt = null;
                            break;
                        case EntityState.Modified:
                            e.ModifiedAt = DateTime.Now;
                            break;
                       
                    }
                }
            }

            return base.SaveChanges();
        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data Source=DESKTOP-NSJVLJ4\SQLEXPRESS;Initial Catalog=Blog2;Integrated Security=True");
            base.OnConfiguring(optionsBuilder);
        }

        public DbSet<Category> Categories { get; set; }
        public DbSet<Comment> Comments { get; set; }
        public DbSet<Image> Images { get; set; }
        public DbSet<Tag> Tags { get; set; }
        public DbSet<Post> Posts { get; set; }
        public DbSet<Post_Category> Post_Categories { get; set; }
        public DbSet<Post_Tag> Post_Tags { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<UserUserCase> UserUserCases { get; set; }
        public DbSet<UseCaseLog> UseCaseLogs { get; set; }
        public DbSet<Like> Likes { get; set; }





    }
}
