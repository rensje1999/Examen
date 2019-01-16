using ExcellentTaste.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ExcellentTaste.Controllers
{
    public class MenukaartController : Controller
    {
        private entities2 db = new entities2();
        // GET: Menu
        public ActionResult Index()
        {
            var consumpties = db.Consumptie;
            return View(consumpties);
        }
    }
}