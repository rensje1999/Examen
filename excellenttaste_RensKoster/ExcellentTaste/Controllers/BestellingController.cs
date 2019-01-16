using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ExcellentTaste.Models;

namespace ExcellentTaste.Controllers
{
    [Authorize]
    public class BestellingController : Controller
    {
        private entities2 db = new entities2();

        // GET: Bestelling
        public ActionResult Index()
        {
            var bestelling = db.Bestelling.Include(b => b.ConsumptieItem).Include(b => b.Reservering);
            return View(bestelling.ToList());
        }

        public ActionResult Bar()
        {
            var overzichtDranken =
                db.Bestelling.Where(b => b.ConsumptieItem.ConsumptieGroep.Consumptie.consumptieCode.ToLower() == "drk"
                && b.Reservering.datum == DateTime.Today && b.dateTimeBereidingConsumptie == null).OrderBy(b => b.Reservering.tafel);
            return View(overzichtDranken);
        }

        public ActionResult Keuken()
        {
            var overzichtDranken =
                db.Bestelling.Where(b => b.ConsumptieItem.ConsumptieGroep.Consumptie.consumptieCode.ToLower() != "drk"
                && b.Reservering.datum == DateTime.Today && b.dateTimeBereidingConsumptie == null).OrderBy(b => b.Reservering.tafel);
            return View(overzichtDranken);
        }

        public ActionResult ToReceipt(int id, char from)
        {
            Bestelling bestelling = db.Bestelling.First(b => b.bestellingId == id);
            bestelling.dateTimeBereidingConsumptie = DateTime.Now;
            if (ModelState.IsValid)
            {
                db.Entry(bestelling).State = EntityState.Modified;
                db.SaveChanges();
                if (from == 'B')
                    return RedirectToAction("Bar");
                else
                    return RedirectToAction("Keuken");
            }
            ViewBag.consumptieItemCode = new SelectList(db.ConsumptieItem, "consumptieItemCode", "consumptieGroepCode", bestelling.consumptieItemCode);
            ViewBag.reserveringId = new SelectList(db.Reservering, "reserveringId", "betalingswijze", bestelling.reserveringId);
            return View(bestelling);
        }

        // GET: Bestelling/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Bestelling bestelling = db.Bestelling.Find(id);
            if (bestelling == null)
            {
                return HttpNotFound();
            }
            return View(bestelling);
        }

        // GET: Bestelling/Create
        public ActionResult Create(int reserveringid = 0)
        {

            //Create the select list item you want to add
            SelectListItem selListItem = new SelectListItem() { Value = "null", Text = "Select One" };

            //Create a list of select list items - this will be returned as your select list
            List<SelectListItem> newList = new List<SelectListItem>();
            newList.Add(selListItem);
            foreach (var item in db.ConsumptieItem.OrderBy(ci => ci.consumptieItemNaam))
            {
                newList.Add(new SelectListItem() { Value = item.consumptieItemCode, Text = item.consumptieItemNaam });
            }
            //ViewBag.consumptieItemCode = new SelectList(db.ConsumptieItem.OrderBy(ci => ci.consumptieItemNaam), "consumptieItemCode", "consumptieItemNaam");
            ViewBag.consumptieItemCode = newList;
            DateTime today = DateTime.Today;
            TimeSpan now = DateTime.Now.TimeOfDay;
            List<SelectListItem> reserveringen = new List<SelectListItem>();
            foreach (var item in db.Reservering.Where(r => r.datum == today && r.tijd <= now && r.status == 1))
            {
                var selectListItem = new SelectListItem();
                selectListItem.Value = item.reserveringId.ToString();
                selectListItem.Text = item.tafel.ToString();
                selectListItem.Selected = item.reserveringId == reserveringid;
                reserveringen.Add(selectListItem);
            }
            ViewBag.reserveringId = reserveringen;

            // Status 1 is een bestelling die geplaatst wordt vanuit een reservering
            // Status 0 is een bestelling die wordt geplaatst vanuit het hoofdmenu
            ViewBag.status = reserveringid == 0 ? 0 : 1;
            return View();
        }

        // POST: Bestelling/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "bestellingId,reserveringId,consumptieItemCode,aantal")] Bestelling bestelling)
        {
           
            if (bestelling.consumptieItemCode == "null")
            {
                //ViewBag.error = "Kies eerst een consumptie of gerecht";
                //Create the select list item you want to add
                SelectListItem selListItem = new SelectListItem() { Value = "null", Text = "Select One" };

                //Create a list of select list items - this will be returned as your select list
                List<SelectListItem> newList = new List<SelectListItem>();
                newList.Add(selListItem);
                foreach (var item in db.ConsumptieItem.OrderBy(ci => ci.consumptieItemNaam))
                {
                    newList.Add(new SelectListItem() { Value = item.consumptieItemCode, Text = item.consumptieItemNaam });
                }
                //ViewBag.consumptieItemCode = new SelectList(db.ConsumptieItem.OrderBy(ci => ci.consumptieItemNaam), "consumptieItemCode", "consumptieItemNaam");
                ViewBag.consumptieItemCode = newList;
                DateTime today = DateTime.Today;
                TimeSpan now = DateTime.Now.TimeOfDay;
                SelectList list = new SelectList(db.Reservering.Where(r => r.datum == today && r.tijd <= now && r.status == 1), "reserveringId", "tafel");

                ViewBag.reserveringId = list;
                TempData["error"] = "Kies eerst een consumptie of gerecht";
                return RedirectToAction("Create", new { reserveringid = bestelling.reserveringId });
            }
            if (ModelState.IsValid)
            {
                // Get the current price for the consumption item
                bestelling.prijs = db.ConsumptieItem.FirstOrDefault(ci => ci.consumptieItemCode == bestelling.consumptieItemCode).prijs;
                db.Bestelling.Add(bestelling);
                db.SaveChanges();
                return RedirectToAction("Create",new { reserveringid = bestelling.reserveringId});
            }

            ViewBag.consumptieItemCode = new SelectList(db.ConsumptieItem.OrderBy(ci => ci.consumptieItemNaam), "consumptieItemCode", "consumptieGroepCode", bestelling.consumptieItemCode);
            ViewBag.reserveringId = new SelectList(db.Reservering, "reserveringId", "betalingswijze", bestelling.reserveringId);
            return View("Create");
        }

        // GET: Bestelling/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Bestelling bestelling = db.Bestelling.Find(id);
            if (bestelling == null)
            {
                return HttpNotFound();
            }
            ViewBag.consumptieItemCode = new SelectList(db.ConsumptieItem.OrderBy(ci => ci.consumptieItemNaam), "consumptieItemCode", "consumptieGroepCode", bestelling.consumptieItemCode);
            ViewBag.reserveringId = new SelectList(db.Reservering, "reserveringId", "betalingswijze", bestelling.reserveringId);
            return View(bestelling);
        }

        // POST: Bestelling/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "bestellingId,reserveringId,consumptieItemCode,aantal,dateTimeBereidingConsumptie")] Bestelling bestelling)
        {
            if (ModelState.IsValid)
            {
                db.Entry(bestelling).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.consumptieItemCode = new SelectList(db.ConsumptieItem.OrderBy(ci => ci.consumptieItemNaam), "consumptieItemCode", "consumptieGroepCode", bestelling.consumptieItemCode);
            ViewBag.reserveringId = new SelectList(db.Reservering, "reserveringId", "betalingswijze", bestelling.reserveringId);
            return View(bestelling);
        }

        // GET: Bestelling/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Bestelling bestelling = db.Bestelling.Find(id);
            if (bestelling == null)
            {
                return HttpNotFound();
            }
            return View(bestelling);
        }

        // POST: Bestelling/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Bestelling bestelling = db.Bestelling.Find(id);
            db.Bestelling.Remove(bestelling);
            db.SaveChanges();
            return RedirectToAction("Create");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
