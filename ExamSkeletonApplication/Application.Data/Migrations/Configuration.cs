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
            if (!context.Roles.Any(r => r.Name == "Administrator"))
            {
                var store = new RoleStore<IdentityRole>(context);
                var manager = new RoleManager<IdentityRole>(store);
                var role = new IdentityRole { Name = "Administrator" };

                manager.Create(role);
            }

            if (!context.Roles.Any(r => r.Name == "Default"))
            {
                var store = new RoleStore<IdentityRole>(context);
                var manager = new RoleManager<IdentityRole>(store);
                var role = new IdentityRole { Name = "Default" };

                manager.Create(role);
            }

            if (!context.Users.Any(u => u.UserName == "admin@abv.bg"))
            {
                var store = new UserStore<User>(context);
                var manager = new UserManager<User>(store);
                var user = new User { UserName = "admin@abv.bg", Email = "admin@abv.bg" };

                manager.Create(user, "123456");
                manager.AddToRole(user.Id, "Administrator");
            }

            if (!context.Users.Any(u => u.UserName == "user@abv.bg"))
            {
                var store = new UserStore<User>(context);
                var manager = new UserManager<User>(store);
                var user = new User { UserName = "user@abv.bg", Email = "user@abv.bg" };

                manager.Create(user, "123456");
                manager.AddToRole(user.Id, "Default");
            }
        }
    }
}
