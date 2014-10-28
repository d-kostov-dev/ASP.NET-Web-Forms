namespace Application.Site.ViewModels
{
    using System;
    using System.Linq.Expressions;

    using Application.Models;
    
    public class TownViewModel
    {
        public static Expression<Func<Town, TownViewModel>> ViewModel
        {
            get
            {
                return x => new TownViewModel()
                {
                    Id = x.Id,
                    Name = x.Name,
                    CountryName = x.Country.Name,
                };
            }
        }

        public int Id { get; set; }

        public string Name { get; set; }

        public string CountryName { get; set; }
    }
}