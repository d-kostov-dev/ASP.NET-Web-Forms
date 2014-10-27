namespace Application.Data.Migrations
{
    using System.Data.Entity.Migrations;
    using System.Linq;

    using Application.Models;

    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;
    using System;

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

            if (!context.Roles.Any(r => r.Name == "Moderator"))
            {
                var store = new RoleStore<IdentityRole>(context);
                var manager = new RoleManager<IdentityRole>(store);
                var role = new IdentityRole { Name = "Moderator" };

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
                var user = new User { UserName = "admin@abv.bg", Email = "admin@abv.bg", FirstName = "Admincho", LastName = "The Boss" };

                manager.Create(user, "123456");
                manager.AddToRole(user.Id, "Administrator");
            }

            if (!context.Users.Any(u => u.UserName == "moderator@abv.bg"))
            {
                var store = new UserStore<User>(context);
                var manager = new UserManager<User>(store);
                var user = new User { UserName = "moderator@abv.bg", Email = "moderator@abv.bg", FirstName = "Moderatcho", LastName = "Moderatov" };

                manager.Create(user, "123456");
                manager.AddToRole(user.Id, "Moderator");
            }

            if (!context.Users.Any(u => u.UserName == "user@abv.bg"))
            {
                var store = new UserStore<User>(context);
                var manager = new UserManager<User>(store);
                var user = new User { UserName = "user@abv.bg", Email = "user@abv.bg", FirstName = "Pesho", LastName = "Goshov" };

                manager.Create(user, "123456");
                manager.AddToRole(user.Id, "Default");
            }

            var aboutUsPage = new SitePage();
            aboutUsPage.Id = 1;
            aboutUsPage.Title = "About Us";
            aboutUsPage.Content = @"<span><p>Pesho Dev International is the world's largest aerospace company and the leading manufacturer of commercial jetliners and military aircraft combined. Additionally, Pesho Dev International designs and manufactures rotorcraft, electronic and defense systems, missiles, satellites, launch vehicles and advanced information and communication systems. As a major service provider to NASA, Pesho Dev International is the prime contractor for the International Space Station. The company also provides numerous military and commercial airline support services. Pesho Dev International provides products and support services to customers in 150 countries and is one of the largest U.S. exporters in terms of sales.</p> <p>Pesho Dev International has a long tradition of aerospace leadership and innovation. We continue to expand our product line and services to meet emerging customer needs. Our broad range of capabilities includes creating new, more efficient members of our commercial airplane family; integrating military platforms, defense systems and the warfighter through network-centric operations; creating advanced technology solutions that reach across business units; e-enabling airplanes and providing connectivity on moving platforms; and arranging financing solutions for our customers.</p> <p>Headquartered in Chicago, Pesho Dev International employs more than 169,000 people across the United States and in more than 65 countries. This represents one of the most diverse, talented and innovative workforces anywhere. Our enterprise also leverages the talents of hundreds of thousands more skilled people working for Pesho Dev International suppliers worldwide.</p>";
            aboutUsPage.IsVisible = true;

            context.SitePages.AddOrUpdate(aboutUsPage);

            var faqPage = new SitePage();
            faqPage.Id = 2;
            faqPage.Title = "FAQ";
            faqPage.Content = @"<div class='list-group'>
		                                <a class='list-group-item'>
			                                <h4 class='list-group-item-heading'>How to log in as Admin?</h4>
			                                <p class='list-group-item-text'>User username <strong>admin@abv.bg</strong> and password <strong>123456</strong></p>
		                                </a>
                                        <a class='list-group-item'>
			                                <h4 class='list-group-item-heading'>How to log in as moderator user?</h4>
			                                <p class='list-group-item-text'>You can register a new user or use <strong>moderator@abv.bg</strong> with password <strong>123456</strong></p>
		                                </a>
		                                <a class='list-group-item'>
			                                <h4 class='list-group-item-heading'>How to log in as regular user?</h4>
			                                <p class='list-group-item-text'>You can register a new user or use <strong>user@abv.bg</strong> with password <strong>123456</strong></p>
		                                </a>
	                                </div>";
            faqPage.IsVisible = true;

            context.SitePages.AddOrUpdate(faqPage);

            var contactUsPage = new SitePage();
            contactUsPage.Id = 3;
            contactUsPage.Title = "Contact Us";
            contactUsPage.Content = @"Whether you’re looking for answers, would like to solve a problem, or just want to let us know how we did, you’ll find many ways to contact us right here. We’ll help you resolve your issues quickly and easily, getting you back to more important things, like relaxing on your new sofa.";
            contactUsPage.IsVisible = true;

            context.SitePages.AddOrUpdate(contactUsPage);

            context.SaveChanges();
        }
    }
}
