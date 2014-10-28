namespace Application.Data.Migrations
{
    using System.Data.Entity.Migrations;
    using System.Linq;

    using Application.Models;

    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;

    internal sealed class Configuration : DbMigrationsConfiguration<ApplicationDbContext>
    {
        public Configuration()
        {
            this.AutomaticMigrationsEnabled = true;
            this.AutomaticMigrationDataLossAllowed = true;
        }

        protected override void Seed(ApplicationDbContext context)
        {
            IdentitySeeder.Seed(context);
            PageSeeder.Seed(context);
            GeoSeeder.Seed(context);
            CategorySeeder.Seed(context);

            // Just in case i forget
            context.SaveChanges();
        }
    }
}
