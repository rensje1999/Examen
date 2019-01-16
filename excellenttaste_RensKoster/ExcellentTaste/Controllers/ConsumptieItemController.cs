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
    public class ConsumptieItemController : Controller
    {
        private entities2 db = new entities2();

        // GET: ConsumptieItem
        public ActionResult Index()
        {
            var consumptieItem = db.ConsumptieItem.Include(c => c.ConsumptieGroep);
            return View(consumptieItem.ToList());
        }

        // GET: ConsumptieItem/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ConsumptieItem consumptieItem = db.ConsumptieItem.Find(id);
            if (consumptieItem == null)
            {
                return HttpNotFound();
            }
            return View(consumptieItem);
        }

        // GET: ConsumptieItem/Create
        public ActionResult Create()
        {
            ViewBag.consumptieGroepCode = new SelectList(db.ConsumptieGroep, "consumptieGroepCode", "consumptieGroepNaam");
            return View();
        }

        // POST: ConsumptieItem/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "consumptieItemCode,consumptieGroepCode,consumptieItemNaam,prijs")] ConsumptieItem consumptieItem)
        {
            if (ModelState.IsValid)
            {
                db.ConsumptieItem.Add(consumptieItem);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.consumptieGroepCode = new SelectList(db.ConsumptieGroep, "consumptieGroepCode", "consumptieGroepNaam");
            return View(consumptieItem);
        }

        // GET: ConsumptieItem/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ConsumptieItem consumptieItem = db.ConsumptieItem.Find(id);
            if (consumptieItem == null)
            {
                return HttpNotFound();
            }
            ViewBag.consumptieGroepCode = new SelectList(db.ConsumptieGroep, "consumptieGroepCode", "consumptieGroepNaam");
            return View(consumptieItem);
        }

        // POST: ConsumptieItem/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "consumptieItemCode,consumptieGroepCode,consumptieItemNaam,prijs")] ConsumptieItem consumptieItem)
        {
            if (ModelState.IsValid)
            {
                db.Entry(consumptieItem).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.consumptieGroepCode = new SelectList(db.ConsumptieGroep, "consumptieGroepCode", "consumptieGroepNaam");
            return View(consumptieItem);
        }

        // GET: ConsumptieItem/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ConsumptieItem consumptieItem = db.ConsumptieItem.Find(id);
            if (consumptieItem == null)
            {
                return HttpNotFound();
            }
            return View(consumptieItem);
        }

        // POST: ConsumptieItem/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            ConsumptieItem consumptieItem = db.ConsumptieItem.Find(id);
            db.ConsumptieItem.Remove(consumptieItem);
            db.SaveChanges();
            return RedirectToAction("Index");
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
