namespace Application.Common
{
    using Application.Models;

    public interface IDataProvider
    {
        IRepository<User> Users { get; }

        IRepository<SitePage> SitePages { get; }

        IRepository<Country> Countries { get; }

        IRepository<Town> Towns { get; }

        int SaveChanges();
    }
}