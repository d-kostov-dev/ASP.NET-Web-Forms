﻿namespace Application.Data
{
    using System.Data.Entity;

    using Application.Common;
    using Application.Data.Migrations;
    using Application.Models;

    using Microsoft.AspNet.Identity.EntityFramework;
   
    public class ApplicationDbContext : IdentityDbContext<User>, IDbContext
    {
        public ApplicationDbContext()
            : base("DefaultConnection", throwIfV1Schema: false)
        {
            Database.SetInitializer(new MigrateDatabaseToLatestVersion<ApplicationDbContext, Configuration>());
        }

        public virtual IDbSet<SitePage> SitePages { get; set; }

        public virtual IDbSet<Continent> Continents { get; set; }

        public virtual IDbSet<Country> Countries { get; set; }

        public virtual IDbSet<Town> Towns { get; set; }

        public virtual IDbSet<Category> Categories { get; set; }

        public virtual IDbSet<ToDoItem> ToDoItems { get; set; }

        public static ApplicationDbContext Create()
        {
            return new ApplicationDbContext();
        }

        public new IDbSet<TEntity> Set<TEntity>() where TEntity : class
        {
            return base.Set<TEntity>();
        }

    }
}
