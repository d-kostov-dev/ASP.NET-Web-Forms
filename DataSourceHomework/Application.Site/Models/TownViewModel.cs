using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Application.Models;
using System.Linq.Expressions;

namespace Application.Site.Models
{
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
                    Population = x.Population,
                    CountryName = x.Country.Name
                };
            }
        }

        public int Id { get; set; }

        public string Name { get; set; }

        public int Population { get; set; }

        public string CountryName { get; set; }
    }
}