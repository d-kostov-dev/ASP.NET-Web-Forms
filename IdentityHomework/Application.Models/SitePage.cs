namespace Application.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;

    public class SitePage
    {
        public int Id { get; set; }

        [MaxLength(200)]
        public string Title { get; set; }

        [MinLength(100)]
        public string Content { get; set; }

        public bool IsVisible { get; set; }
    }
}
