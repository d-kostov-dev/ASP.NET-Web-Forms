using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Models
{
    public class Continent : IEqualityComparer<Continent>, IComparable<Continent>
    {
        private ICollection<Country> countries;

        public Continent()
        {
            this.countries = new HashSet<Country>();
        }

        public int Id { get; set; }

        public string Name { get; set; }

        public int Population { get; set; }

        public virtual ICollection<Country> Countries 
        {
            get
            {
                return this.countries;
            }

            set
            {
                this.countries = value;
            }
        }

        public int CompareTo(Continent other)
        {
            return this.Name.CompareTo(other.Name);
        }

        public bool Equals(Continent x, Continent y)
        {
            if(x.Name == y.Name){
                return true;
            }

            return false;
        }

        public int GetHashCode(Continent obj)
        {
            return obj.GetHashCode();
        }
    }
}
