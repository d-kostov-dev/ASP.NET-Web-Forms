using Application.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;

namespace Application.Site.ViewModels
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
                    Flag = x.Flag,
                    TownsCount = x.Towns.Count,
                };
            }
        }

        public int Id { get; set; }

        public string Name { get; set; }

        public string Flag { get; set; }

        public int TownsCount { get; set; }
    }
}