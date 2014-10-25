namespace Application.Common
{
    using Application.Models;

    public interface IDataProvider
    {
        IRepository<User> Users { get; }

        IRepository<SitePage> SitePages { get; }

        IRepository<Continent> Continents { get; }

        IRepository<Country> Countries { get; }

        IRepository<Town> Towns { get; }

        IRepository<Category> Categories { get; }

        IRepository<ToDoItem> ToDoItems { get; }

        int SaveChanges();
    }
}