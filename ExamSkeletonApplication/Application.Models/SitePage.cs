namespace Application.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;

    public class SitePage
    {
        [Key]
        public int Id { get; set; }

        [MinLength(2)]
        [MaxLength(200)]
        public string Title { get; set; }

        [MinLength(50)]
        public string Content { get; set; }

        public bool IsVisible { get; set; }
    }
}
