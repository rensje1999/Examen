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
    public class ConsumptieGroepController : Controller
    {
        private entities2 db = new entities2();

        // GET: ConsumptieGroep
        public ActionResult Index()
        {
            var consumptieGroep = db.ConsumptieGroep.Include(c => c.Consumptie);
            return View(consumptieGroep.ToList());
        }

        // GET: ConsumptieGroep/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ConsumptieGroep consumptieGroep = db.ConsumptieGroep.Find(id);
            if (consumptieGroep == null)
            {
                return HttpNotFound();
            }
            return View(consumptieGroep);
        }

        // GET: ConsumptieGroep/Create
        public ActionResult Create()
        {
            ViewBag.consumptieCode = new SelectList(db.Consumptie, "consumptieCode", "consumptieNaam");
            return View();
        }

        // POST: ConsumptieGroep/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "consumptieGroepCode,consumptieCode,consumptieGroepNaam")] ConsumptieGroep consumptieGroep)
        {
            if (ModelState.IsValid)
            {
                db.ConsumptieGroep.Add(consumptieGroep);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.consumptieCode = new SelectList(db.Consumptie, "consumptieCode", "consumptieNaam", consumptieGroep.consumptieCode);
            return View(consumptieGroep);
        }

        // GET: ConsumptieGroep/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ConsumptieGroep consumptieGroep = db.ConsumptieGroep.Find(id);
            if (consumptieGroep == null)
            {
                return HttpNotFound();
            }
            ViewBag.consumptieCode = new SelectList(db.Consumptie, "consumptieCode", "consumptieNaam", consumptieGroep.consumptieCode);
            return View(consumptieGroep);
        }

        // POST: ConsumptieGroep/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "consumptieGroepCode,consumptieCode,consumptieGroepNaam")] ConsumptieGroep consumptieGroep)
        {
            if (ModelState.IsValid)
            {
                db.Entry(consumptieGroep).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.consumptieCode = new SelectList(db.Consumptie, "consumptieCode", "consumptieNaam", consumptieGroep.consumptieCode);
            return View(consumptieGroep);
        }

        // GET: ConsumptieGroep/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ConsumptieGroep consumptieGroep = db.ConsumptieGroep.Find(id);
            if (consumptieGroep == null)
            {
                return HttpNotFound();
            }
            return View(consumptieGroep);
        }

        // POST: ConsumptieGroep/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            ConsumptieGroep consumptieGroep = db.ConsumptieGroep.Find(id);
            db.ConsumptieGroep.Remove(consumptieGroep);
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
