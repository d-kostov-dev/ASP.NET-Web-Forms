namespace Application.Data.Migrations
{
    using System.Data.Entity.Migrations;

    using Application.Common;
    using Application.Models;

    public class GeoSeeder
    {
        public static void Seed(IDbContext databaseContext)
        {
            var bulgaria = new Country()
            {
                Id = 1,
                Name = "Bulgaria"
            };

            var germany = new Country()
            {
                Id = 2,
                Name = "Germany"
            };

            var spain = new Country()
            {
                Id = 3,
                Name = "Spain"
            };

            var sofia = new Town()
            {
                Id = 1,
                Name = "Sofia",
                Country = bulgaria
            };

            databaseContext.Towns.AddOrUpdate(sofia);

            var pernik = new Town()
            {
                Id = 2,
                Name = "Pernik",
                Country = bulgaria
            };

            databaseContext.Towns.AddOrUpdate(pernik);


            var berlin = new Town()
            {
                Id = 3,
                Name = "Berlin",
                Country = germany
            };

            databaseContext.Towns.AddOrUpdate(berlin);

            var barcelona = new Town()
            {
                Id = 4,
                Name = "Barcelona",
                Country = spain
            };

            databaseContext.Towns.AddOrUpdate(barcelona);

            databaseContext.SaveChanges();
        }
    }
}
