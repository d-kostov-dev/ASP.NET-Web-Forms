using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Models
{
    public class Country
    {
        private ICollection<Town> towns;

        public Country()
        {
            this.towns = new HashSet<Town>();
        }

        public int Id { get; set; }

        public string Name { get; set; }

        // TODO: Make it a model
        public string Language { get; set; }

        // TODO: Use byte[]
        public string Flag { get; set; }

        public int Population { get; set; }

        public virtual Continent Continent { get; set; }

        public virtual ICollection<Town> Towns 
        {
            get
            {
                return this.towns;
            }

            set
            {
                this.towns = value;
            }
        }
    }
}
