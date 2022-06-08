using Microsoft.EntityFrameworkCore.Migrations;

namespace AspBlog.DataAccess.Migrations
{
    public partial class midtablesnowwithids : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Post_Tags_Tags_TagId",
                table: "Post_Tags");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Post_Tags",
                table: "Post_Tags");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Post_Categories",
                table: "Post_Categories");

            migrationBuilder.AlterColumn<int>(
                name: "PostId",
                table: "Post_Tags",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "TagId",
                table: "Post_Tags",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddColumn<int>(
                name: "Id",
                table: "Post_Tags",
                type: "int",
                nullable: false,
                defaultValue: 0)
                .Annotation("SqlServer:Identity", "1, 1");

            migrationBuilder.AlterColumn<int>(
                name: "PostId",
                table: "Post_Categories",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "CategoryId",
                table: "Post_Categories",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddColumn<int>(
                name: "Id",
                table: "Post_Categories",
                type: "int",
                nullable: false,
                defaultValue: 0)
                .Annotation("SqlServer:Identity", "1, 1");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Post_Tags",
                table: "Post_Tags",
                column: "Id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Post_Categories",
                table: "Post_Categories",
                column: "Id");

            migrationBuilder.CreateIndex(
                name: "IX_Post_Tags_TagId",
                table: "Post_Tags",
                column: "TagId");

            migrationBuilder.CreateIndex(
                name: "IX_Post_Categories_CategoryId",
                table: "Post_Categories",
                column: "CategoryId");

            migrationBuilder.AddForeignKey(
                name: "FK_Post_Tags_Tags_TagId",
                table: "Post_Tags",
                column: "TagId",
                principalTable: "Tags",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Post_Tags_Tags_TagId",
                table: "Post_Tags");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Post_Tags",
                table: "Post_Tags");

            migrationBuilder.DropIndex(
                name: "IX_Post_Tags_TagId",
                table: "Post_Tags");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Post_Categories",
                table: "Post_Categories");

            migrationBuilder.DropIndex(
                name: "IX_Post_Categories_CategoryId",
                table: "Post_Categories");

            migrationBuilder.DropColumn(
                name: "Id",
                table: "Post_Tags");

            migrationBuilder.DropColumn(
                name: "Id",
                table: "Post_Categories");

            migrationBuilder.AlterColumn<int>(
                name: "TagId",
                table: "Post_Tags",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "PostId",
                table: "Post_Tags",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "PostId",
                table: "Post_Categories",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "CategoryId",
                table: "Post_Categories",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddPrimaryKey(
                name: "PK_Post_Tags",
                table: "Post_Tags",
                columns: new[] { "TagId", "PostId" });

            migrationBuilder.AddPrimaryKey(
                name: "PK_Post_Categories",
                table: "Post_Categories",
                columns: new[] { "CategoryId", "PostId" });

            migrationBuilder.AddForeignKey(
                name: "FK_Post_Tags_Tags_TagId",
                table: "Post_Tags",
                column: "TagId",
                principalTable: "Tags",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
