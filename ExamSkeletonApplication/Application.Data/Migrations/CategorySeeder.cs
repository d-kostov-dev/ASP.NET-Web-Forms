namespace Application.Data.Migrations
{
    using System.Data.Entity.Migrations;

    using Application.Common;
    using Application.Models;

    public class CategorySeeder
    {
        public static void Seed(IDbContext databaseContext)
        {
            var categoryOne = new Category()
            {
                Id = 1,
                Name = "Category One",
            };

            databaseContext.Categories.AddOrUpdate(categoryOne);

            var categoryTwo = new Category()
            {
                Id = 2,
                Name = "Category Two",
            };

            databaseContext.Categories.AddOrUpdate(categoryTwo);

            var categoryThree = new Category()
            {
                Id = 3,
                Name = "Category Three",
            };

            databaseContext.Categories.AddOrUpdate(categoryThree);

            databaseContext.SaveChanges();
        }
    }
}
