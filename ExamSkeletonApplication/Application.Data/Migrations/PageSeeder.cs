namespace Application.Data.Migrations
{
    using System.Data.Entity.Migrations;

    using Application.Common;
    using Application.Models;
    
    public class PageSeeder
    {
        public static void Seed(IDbContext databaseContext)
        {
            var aboutUsPage = new SitePage();
            aboutUsPage.Id = 1;
            aboutUsPage.Title = "About Us";
            aboutUsPage.Content = @"<span><p>Pesho Dev International is the world's largest aerospace company and the leading manufacturer of commercial jetliners and military aircraft combined. Additionally, Pesho Dev International designs and manufactures rotorcraft, electronic and defense systems, missiles, satellites, launch vehicles and advanced information and communication systems. As a major service provider to NASA, Pesho Dev International is the prime contractor for the International Space Station. The company also provides numerous military and commercial airline support services. Pesho Dev International provides products and support services to customers in 150 countries and is one of the largest U.S. exporters in terms of sales.</p> <p>Pesho Dev International has a long tradition of aerospace leadership and innovation. We continue to expand our product line and services to meet emerging customer needs. Our broad range of capabilities includes creating new, more efficient members of our commercial airplane family; integrating military platforms, defense systems and the warfighter through network-centric operations; creating advanced technology solutions that reach across business units; e-enabling airplanes and providing connectivity on moving platforms; and arranging financing solutions for our customers.</p> <p>Headquartered in Chicago, Pesho Dev International employs more than 169,000 people across the United States and in more than 65 countries. This represents one of the most diverse, talented and innovative workforces anywhere. Our enterprise also leverages the talents of hundreds of thousands more skilled people working for Pesho Dev International suppliers worldwide.</p>";
            aboutUsPage.IsVisible = true;

            var faqPage = new SitePage();
            faqPage.Id = 2;
            faqPage.Title = "FAQ";
            faqPage.Content = @"    <p>Please keep in mind that this page is created prior the exam and some of the infrmation or the statistics may be different.<p>
                                    <div class='list-group'>
		                                <a class='list-group-item'>
			                                <h4 class='list-group-item-heading'>How to log in as Admin?</h4>
			                                <p class='list-group-item-text'>User username <strong>admin@abv.bg</strong> and password <strong>123456</strong></p>
		                                </a>
		                                <a class='list-group-item'>
			                                <h4 class='list-group-item-heading'>How to log in as regular user?</h4>
			                                <p class='list-group-item-text'>You can register a new user or use <strong>user@abv.bg</strong> with password <strong>123456</strong></p>
		                                </a>
                                        <a class='list-group-item'>
			                                <h4 class='list-group-item-heading'>Tell me more about the architecture of the application.</h4>
			                                <p class='list-group-item-text'>I have separated the application to 3 major libraries. Models, Data, Common and Site.</p>
                                            <p>The models library contains all the classes that define how the database will look. And yes the user is there too...and it's working as it shoud.</p><p>The data library is where the database context is created. I'm using <strong>Repository</strong> and <strong>Unit of Work</strong> design patterns.</p><p>In the common folder you will find all the interfaces needed for the data library (and the design patterns).</p>
		                                </a>
                                        <a class='list-group-item'>
			                                <h4 class='list-group-item-heading'>How you deal with HTML input?</h4>
			                                <p class='list-group-item-text'>All HTML tags are escaped. You can check the configuration in <strong>Web.config</strong> file.</p>
		                                </a>
                                        <a class='list-group-item'>
			                                <h4 class='list-group-item-heading'>How are the errors handled?</h4>
			                                <p class='list-group-item-text'>I tried to manage all errors with global error handler control. Check <strong>Controls</strong> folder.</p>
		                                </a>
                                        <a class='list-group-item'>
			                                <h4 class='list-group-item-heading'>Is there any data seeding?</h4>
			                                <p class='list-group-item-text'>Yes I'm seeding Roles, Users and Pages in the Migration.Configuration file.</p>
		                                </a>
                                        <a class='list-group-item'>
			                                <h4 class='list-group-item-heading'>What are the Site Pages?</h4>
			                                <p class='list-group-item-text'>Informational pages. Like the one you are looking at now. You can manage those from the <strong>Admin Panel</strong></p>
		                                </a>
                                        <a class='list-group-item'>
			                                <h4 class='list-group-item-heading'>Can anyone look in the admin panel?</h4>
			                                <p class='list-group-item-text'>No! Only users with administraton role can manage the admin panel. All other users are redirected (configured in Web.config file).</p>
		                                </a>
                                        <a class='list-group-item'>
			                                <h4 class='list-group-item-heading'>How many StyleCop errors?</h4>
			                                <p class='list-group-item-text'>At the time of writing there are no errors in the Models, Data and Common libraries. The situation in the 'Site' is different. We'll see! :)</p>
		                                </a>
	                                </div>";
            faqPage.IsVisible = true;

            var contactUsPage = new SitePage();
            contactUsPage.Id = 3;
            contactUsPage.Title = "Contact Us";
            contactUsPage.Content = @"Whether you’re looking for answers, would like to solve a problem, or just want to let us know how we did, you’ll find many ways to contact us right here. We’ll help you resolve your issues quickly and easily, getting you back to more important things, like relaxing on your new sofa.";
            contactUsPage.IsVisible = true;

            databaseContext.SitePages.AddOrUpdate(aboutUsPage);
            databaseContext.SitePages.AddOrUpdate(faqPage);
            databaseContext.SitePages.AddOrUpdate(contactUsPage);

            databaseContext.SaveChanges();
        }
    }
}
