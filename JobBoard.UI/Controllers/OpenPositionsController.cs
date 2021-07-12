using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using JobBoard.DATA;

namespace JobBoard.UI.Controllers
{
    public class OpenPositionsController : Controller
    {
        private JobBoardEntities db = new JobBoardEntities();

        // GET: OpenPositions
        public ActionResult Index()
        {
            var openPositions = db.OpenPositions1.Include(o => o.Location).Include(o => o.Position);
            return View(openPositions.ToList());
        }

        // GET: OpenPositions/FindJob
        public ActionResult FindJob(string searchString)
        {
            var openPositions = db.OpenPositions1.Include(o => o.Location).Include(o => o.Position);

            if (!String.IsNullOrEmpty(searchString))
            {
                openPositions = openPositions.Where(o => o.Position.Title.Contains(searchString)
                                       || o.Location.City.Contains(searchString)
                                       || o.Location.State.Contains(searchString));
            }

            return View(openPositions.ToList());
        }

        // GET: OpenPositions/JobDetails/5
        public ActionResult JobDetails(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OpenPositions openPositions = db.OpenPositions1.Find(id);
            if (openPositions == null)
            {
                return HttpNotFound();
            }
            return View(openPositions);
        }

        // GET: OpenPositions/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OpenPositions openPositions = db.OpenPositions1.Find(id);
            if (openPositions == null)
            {
                return HttpNotFound();
            }
            return View(openPositions);
        }

        // GET: OpenPositions/Create
        public ActionResult Create()
        {
            ViewBag.LocationId = new SelectList(db.Locations1, "LocationId", "StoreNumber");
            ViewBag.PositionId = new SelectList(db.Positions1, "PositionId", "Title");
            return View();
        }

        // POST: OpenPositions/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "OpenPositionId,PositionId,LocationId,IsFeatured")] OpenPositions openPositions)
        {
            if (ModelState.IsValid)
            {
                db.OpenPositions1.Add(openPositions);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.LocationId = new SelectList(db.Locations1, "LocationId", "StoreNumber", openPositions.LocationId);
            ViewBag.PositionId = new SelectList(db.Positions1, "PositionId", "Title", openPositions.PositionId);
            return View(openPositions);
        }

        // GET: OpenPositions/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OpenPositions openPositions = db.OpenPositions1.Find(id);
            if (openPositions == null)
            {
                return HttpNotFound();
            }
            ViewBag.LocationId = new SelectList(db.Locations1, "LocationId", "StoreNumber", openPositions.LocationId);
            ViewBag.PositionId = new SelectList(db.Positions1, "PositionId", "Title", openPositions.PositionId);
            return View(openPositions);
        }

        // POST: OpenPositions/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "OpenPositionId,PositionId,LocationId,IsFeatured")] OpenPositions openPositions)
        {
            if (ModelState.IsValid)
            {
                db.Entry(openPositions).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.LocationId = new SelectList(db.Locations1, "LocationId", "StoreNumber", openPositions.LocationId);
            ViewBag.PositionId = new SelectList(db.Positions1, "PositionId", "Title", openPositions.PositionId);
            return View(openPositions);
        }

        // GET: OpenPositions/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OpenPositions openPositions = db.OpenPositions1.Find(id);
            if (openPositions == null)
            {
                return HttpNotFound();
            }
            return View(openPositions);
        }

        // POST: OpenPositions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            OpenPositions openPositions = db.OpenPositions1.Find(id);
            db.OpenPositions1.Remove(openPositions);
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
