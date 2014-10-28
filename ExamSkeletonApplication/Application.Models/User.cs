namespace Application.Models
{
    using System;
    using System.Security.Claims;
    using System.Threading.Tasks;

    using Application.Models.Enumerations;

    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;
    
    public class User : IdentityUser
    {
        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Photo { get; set; }

        public RelationshipStatus RelationshipStatus { get; set; }

        public virtual Town Town { get; set; }

        public string Address { get; set; }

        public string Phone { get; set; }

        public Task<ClaimsIdentity> GenerateUserIdentityAsync(UserManager<User> manager)
        {
            return Task.FromResult(this.GenerateUserIdentity(manager));
        }

        public ClaimsIdentity GenerateUserIdentity(UserManager<User> manager)
        {
            var userIdentity = manager.CreateIdentity(this, DefaultAuthenticationTypes.ApplicationCookie);

            return userIdentity;
        }
    }
}
