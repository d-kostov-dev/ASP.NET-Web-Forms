using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Models
{
    public class ChatMessage
    {
        public int Id { get; set; }

        public string Message { get; set; }

        public virtual User Author { get; set; }
    }
}
