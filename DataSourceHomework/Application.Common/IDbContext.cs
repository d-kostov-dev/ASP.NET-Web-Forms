namespace Application.Common
{
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;

    using Application.Models;

    public interface IDbContext
    {
        IDbSet<SitePage> SitePages { get; set; }

        IDbSet<Continent> Continents { get; set; }

        IDbSet<Country> Countries { get; set; }

        IDbSet<Town> Towns { get; set; }

        IDbSet<Category> Categories { get; set; }

        IDbSet<ToDoItem> ToDoItems { get; set; }

        int SaveChanges();

        IDbSet<TEntity> Set<TEntity>() where TEntity : class;

        DbEntityEntry<TEntity> Entry<TEntity>(TEntity entity) where TEntity : class;
    }
}