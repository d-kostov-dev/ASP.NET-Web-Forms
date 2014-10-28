namespace Application.Site.Utilities
{
    using System;
    using System.Web.UI.WebControls;
   
    public static class BindUtil
    {
        public static void EnumToList<T>(DropDownList list)
        {
            var names = Enum.GetNames(typeof(T));
            var values = Enum.GetValues(typeof(T));

            for (int i = 0; i <= names.Length - 1; i++)
            {
                list.Items.Add(new ListItem(names[i], Convert.ToInt32(values.GetValue(i)).ToString()));
            }
        }
    }
}