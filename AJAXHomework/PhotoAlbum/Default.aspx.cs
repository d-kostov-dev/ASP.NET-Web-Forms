namespace PhotoAlbum
{
    using System;
    using System.Linq;
    using System.Web.UI.WebControls;

    public partial class Default : System.Web.UI.Page
    {
        [System.Web.Services.WebMethod]
        public static AjaxControlToolkit.Slide[] GetSlides()
        {
            AjaxControlToolkit.Slide[] imgSlide = new AjaxControlToolkit.Slide[5];

            imgSlide[0] = new AjaxControlToolkit.Slide("/content/images/1.jpg", "Image One", "Image One Caption");
            imgSlide[1] = new AjaxControlToolkit.Slide("/content/images/2.jpg", "Image Two", "Image Two Caption");
            imgSlide[2] = new AjaxControlToolkit.Slide("/content/images/3.jpg", "Image Three", "Image Three Caption");
            imgSlide[3] = new AjaxControlToolkit.Slide("/content/images/4.jpg", "Image Four", "Image Four Caption");
            imgSlide[4] = new AjaxControlToolkit.Slide("/content/images/5.jpg", "Image Five", "Image Five Caption");

            return (imgSlide);
        }   
    }
}