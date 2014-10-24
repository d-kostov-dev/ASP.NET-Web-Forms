namespace Application.Common
{
    using Application.Models;

    public interface IDataProvider
    {
        IRepository<User> Users { get; }

        IRepository<SitePage> SitePages { get; }

        int SaveChanges();
    }
}