namespace AjaxChat.Models
{
    using System.Data.Entity;

    public class ChatDbContext : DbContext
    {
        public ChatDbContext()
            : base("AjaxChatDb")
        {
        }

        public IDbSet<Message> Messages { get; set; }
    }
}