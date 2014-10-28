using Application.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;

namespace Application.Site.ViewModels
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
                    CountryName = x.Country.Name,
                };
            }
        }

        public int Id { get; set; }

        public string Name { get; set; }

        public string CountryName { get; set; }
    }
}