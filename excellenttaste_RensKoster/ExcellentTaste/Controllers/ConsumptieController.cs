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
    public class ConsumptieController : Controller
    {
        private entities2 db = new entities2();

        // GET: Consumptie
        public ActionResult Index()
        {
            return View(db.Consumptie.ToList());
        }

        // GET: Consumptie/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Consumptie consumptie = db.Consumptie.Find(id);
            if (consumptie == null)
            {
                return HttpNotFound();
            }
            return View(consumptie);
        }

        // GET: Consumptie/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Consumptie/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "consumptieCode,consumptieNaam")] Consumptie consumptie)
        {
            if (ModelState.IsValid)
            {
                db.Consumptie.Add(consumptie);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(consumptie);
        }

        // GET: Consumptie/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Consumptie consumptie = db.Consumptie.Find(id);
            if (consumptie == null)
            {
                return HttpNotFound();
            }
            return View(consumptie);
        }

        // POST: Consumptie/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "consumptieCode,consumptieNaam")] Consumptie consumptie)
        {
            if (ModelState.IsValid)
            {
                db.Entry(consumptie).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(consumptie);
        }

        // GET: Consumptie/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Consumptie consumptie = db.Consumptie.Find(id);
            if (consumptie == null)
            {
                return HttpNotFound();
            }
            return View(consumptie);
        }

        // POST: Consumptie/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Consumptie consumptie = db.Consumptie.Find(id);
            db.Consumptie.Remove(consumptie);
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
