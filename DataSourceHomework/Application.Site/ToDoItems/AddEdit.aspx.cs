namespace Application.Site.ToDoItems
{
    using System;
    using System.Web.UI;
    using System.Linq;

    using Application.Data;
    using Application.Models;

    using ErrorHandlerControl;
    using System.IO;

    public partial class AddEdit : Page
    {
        private bool isNewItem = false;
        private int itemId;
        private DataProvider data;

        protected void Page_Init(object sender, EventArgs e)
        {
            data = new DataProvider();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.itemId = Convert.ToInt32(Request.Params["itemId"]);
            isNewItem = (this.itemId == 0);

            if (!Page.IsPostBack)
            {
                this.Category.DataSource = data.Categories.All().ToList();
                this.Category.SelectedIndex = 0;
            }
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                ToDoItem item;

                if (isNewItem)
                {
                    item = new ToDoItem();
                    data.ToDoItems.Add(item);
                }
                else
                {
                    item = data.ToDoItems.Find(this.itemId);
                }

                item.Title = this.ItemTitle.Text;
                item.Content = this.Content.Text;
                item.Category = data.Categories.Find(int.Parse(this.Category.SelectedValue));
                item.LastEditDate = DateTime.Now;

                data.SaveChanges();

                Response.Redirect("List.aspx", false);

            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            this.DataBind();

            if (!isNewItem)
            {
                ToDoItem item = data.ToDoItems.Find(itemId);

                this.ItemTitle.Text = item.Title;
                this.Content.Text = item.Content;
                this.Category.SelectedValue = item.Category.Id.ToString();
            }
        }
    }
}