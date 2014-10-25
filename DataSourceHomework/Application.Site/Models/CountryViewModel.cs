using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Application.Models;
using System.Linq.Expressions;

namespace Application.Site.Models
{
    public class CountryViewModel
    {
        public static Expression<Func<Country, CountryViewModel>> ViewModel
        {
            get
            {
                return x => new CountryViewModel()
                {
                    Id = x.Id,
                    Name = x.Name,
                    Population = x.Population,
                    ContinentName = x.Continent.Name,
                    Flag = x.Flag,
                };
            }
        }

        public int Id { get; set; }

        public string Name { get; set; }

        public int Population { get; set; }

        public string ContinentName { get; set; }

        public string Flag { get; set; }
    }
}