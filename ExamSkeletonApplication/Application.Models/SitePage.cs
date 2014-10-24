namespace Application.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;

    public class SitePage
    {
        public int Id { get; set; }

        [MaxLength(100)]
        public string Title { get; set; }

        public string Content { get; set; }

        public DateTime DateCreated { get; set; }

        public bool IsVisible { get; set; }
    }
}
