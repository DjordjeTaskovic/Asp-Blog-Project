using Microsoft.EntityFrameworkCore.Migrations;

namespace AspBlog.DataAccess.Migrations
{
    public partial class allowuserswithsamefirstname : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_Users_FirstName",
                table: "Users");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateIndex(
                name: "IX_Users_FirstName",
                table: "Users",
                column: "FirstName",
                unique: true);
        }
    }
}
