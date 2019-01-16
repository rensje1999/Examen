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
    public class KlantController : Controller
    {
        private entities2 db = new entities2();

        // GET: Klant
        public ActionResult Index(string filter = "")
        {
            if (filter == "")
            {
                return View(db.Klant.ToList());
            }
            else
            {
                return View(db.Klant.Where(k => k.klantNaam.Contains(filter)).ToList());
            }
        }

        // GET: Klant/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Klant klant = db.Klant.Find(id);
            if (klant == null)
            {
                return HttpNotFound();
            }
            return View(klant);
        }

        // GET: Klant/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Klant/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "klantId,klantNaam,telefoon,status")] Klant klant)
        {
            if (ModelState.IsValid)
            {
                db.Klant.Add(klant);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(klant);
        }

        // GET: Klant/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Klant klant = db.Klant.Find(id);
            if (klant == null)
            {
                return HttpNotFound();
            }
            return View(klant);
        }

        // POST: Klant/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "klantId,klantNaam,telefoon,status")] Klant klant)
        {
            // New customers always get a status of 1 = reliable
            klant.status = 1;
            if (ModelState.IsValid)
            {
                db.Entry(klant).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(klant);
        }

        // GET: Klant/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Klant klant = db.Klant.Find(id);
            if (klant == null)
            {
                return HttpNotFound();
            }
            return View(klant);
        }

        // POST: Klant/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Klant klant = db.Klant.Find(id);
            db.Klant.Remove(klant);
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
