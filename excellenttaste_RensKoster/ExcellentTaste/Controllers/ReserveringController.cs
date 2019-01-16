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
    /// <summary>
    /// Controller for reservations
    /// </summary>
    /// <seealso cref="System.Web.Mvc.Controller" />
    public class ReserveringController : Controller
    {
        /// <summary>
        /// The database
        /// </summary>
        private entities2 db = new entities2();

        // GET: Reservering
        /// <summary>
        /// Get a list of all reservations
        /// </summary>
        /// <returns></returns>
        public ActionResult Index(int klantId = 0)
        {
            List<Reservering> reservering;
            if (klantId > 0)
            {
                reservering = db.Reservering.Where(r=>r.klantId == klantId).Include(r => r.Klant).ToList();
            }
            else
            {
                reservering = db.Reservering.Include(r => r.Klant).ToList();
            }
            return View(reservering.OrderByDescending(r=>r.datum).ToList());
        }

        // GET: Reservering
        /// <summary>
        /// Get a list of todays reservations
        /// </summary>
        /// <returns></returns>
        public ActionResult Today()
        {
            var reservering = db.GET_TODAYS_RESERVATIONS();
            return View(reservering.ToList());
        }

        // GET: Reservering/Details/5
        /// <summary>
        /// Gets the details of a reservation
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns></returns>
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reservering reservering = db.Reservering.Find(id);
            if (reservering == null)
            {
                return HttpNotFound();
            }
            return View(reservering);
        }

        // GET: Reservering/Create
        /// <summary>
        /// Creates a new reservation.
        /// </summary>
        /// <returns></returns>
        public ActionResult Create(int klantId = 0)
        {
            //ViewBag.klantId = new SelectList(db.Klant, "klantId", "klantNaam");
            VMReservering reservering = new VMReservering();
            if (klantId != 0)
                reservering.klantId = klantId;
            return View(reservering);
        }

        // POST: Reservering/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        /// <summary>
        /// Creates the specified reservation.
        /// </summary>
        /// <param name="reservering">The reservation.</param>
        /// <returns></returns>
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "klantId,datum,tijd,tafel,aantalPersonen")] VMReservering reservering)
        {
            if (ModelState.IsValid)
            {
                Reservering res = new Reservering();
                res.tafel = reservering.tafel;
                res.aantalPersonen = reservering.aantalPersonen;
                res.datum = reservering.datum;
                res.tijd = reservering.tijd;
                res.klantId = reservering.klantId;
                res.status = 1;
                res.datumToegevoegd = DateTime.Now;
                db.Reservering.Add(res);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.klantId = new SelectList(db.Klant, "klantId", "klantNaam", reservering.klantId);
            return View(reservering);
        }

        // GET: Reservering/Edit/5
        /// <summary>
        /// Edits the specified reservation.
        /// </summary>
        /// <param name="id">The id of the reservation.</param>
        /// <returns></returns>
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reservering reservering = db.Reservering.Find(id);
            if (reservering == null)
            {
                return HttpNotFound();
            }
            ViewBag.klantId = new SelectList(db.Klant, "klantId", "klantNaam", reservering.klantId);
            return View(reservering);
        }

        // POST: Reservering/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        /// <summary>
        /// Edits the specified reservation.
        /// </summary>
        /// <param name="reservering">The Get a list of all reservations.</param>
        /// <returns></returns>
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "reserveringId,klantId,datum,tijd,tafel,aantalPersonen,status,datumToegevoegd,bonDatum,betalingswijze")] Reservering reservering)
        {
            if (ModelState.IsValid)
            {
                db.Entry(reservering).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.klantId = new SelectList(db.Klant, "klantId", "klantNaam", reservering.klantId);
            return View(reservering);
        }

        // GET: Reservering/Delete/5
        /// <summary>
        /// Deletes the specified reservation.
        /// </summary>
        /// <param name="id">The identifier of the reservation.</param>
        /// <returns></returns>
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reservering reservering = db.Reservering.Find(id);
            if (reservering == null)
            {
                return HttpNotFound();
            }
            return View(reservering);
        }

        // POST: Reservering/Delete/5
        /// <summary>
        /// Deletes the confirmed reservation.
        /// </summary>
        /// <param name="id">The id of the reservation.</param>
        /// <returns></returns>
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Reservering reservering = db.Reservering.Find(id);
            db.Reservering.Remove(reservering);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        /// <summary>
        /// Create a receipt for the reservation.
        /// </summary>
        /// <param name="id">The identifier of the reservation.</param>
        /// <returns></returns>
        public ActionResult Bon(int id)
        {
            var reservering = db.Reservering.Find(id);
            reservering.status = 0;
            reservering.betalingswijze = "pi";
            db.SaveChanges();
            List<Bestelling> bestelling = db.Bestelling.Where(res => res.reserveringId == id &&
            res.dateTimeBereidingConsumptie != null).ToList();
            return View(bestelling);
        }

        /// <summary>
        /// Creates a partial view for a customer.
        /// </summary>
        /// <param name="klantid">The id of the customer.</param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult GetCustomer(string klantid)
        {
            int nr = int.Parse(klantid);
            return PartialView("_Customer", db.Klant.First(k => k.klantId == nr));
        }

        /// <summary>
        /// Releases unmanaged resources and optionally releases managed resources.
        /// </summary>
        /// <param name="disposing">true to release both managed and unmanaged resources; false to release only unmanaged resources.</param>
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
