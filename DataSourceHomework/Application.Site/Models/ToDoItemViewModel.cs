using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Application.Models;
using System.Linq.Expressions;

namespace Application.Site.Models
{
    public class ToDoItemViewModel
    {
        public static Expression<Func<ToDoItem, ToDoItemViewModel>> ViewModel
        {
            get
            {
                return x => new ToDoItemViewModel()
                {
                    Id = x.Id,
                    Title = x.Title,
                    Content = x.Content,
                    Category = x.Category.Name,
                    LastEditDate = x.LastEditDate,
                };
            }
        }

        public int Id { get; set; }

        public string Title { get; set; }

        public string Content { get; set; }

        public string Category { get; set; }

        public DateTime LastEditDate { get; set; }
    }
}