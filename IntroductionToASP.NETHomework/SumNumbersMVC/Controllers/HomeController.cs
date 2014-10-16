namespace SumNumbersMVC.Controllers
{
    using SumNumbersMVC.Models;
using System.Web.Mvc;

    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult SumNumbers(SumNumbersModel numbers)
        {
            int result = numbers.NumberOne + numbers.NumberTwo;
            ViewBag.Result = result;

            return View("Index");
        }
    }
}