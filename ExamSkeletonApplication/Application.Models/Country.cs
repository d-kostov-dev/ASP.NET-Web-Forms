namespace Application.Models
{
    using System.Collections.Generic;

    public class Country
    {
        private ICollection<Town> towns;

        public Country()
        {
            this.towns = new HashSet<Town>();
        }

        public int Id { get; set; }

        public string Name { get; set; }

        public string Flag { get; set; }

        public virtual ICollection<Town> Towns { get; set; }
    }
}
