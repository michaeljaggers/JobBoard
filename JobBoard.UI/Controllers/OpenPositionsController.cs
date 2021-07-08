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
            var openPositions1 = db.OpenPositions1.Include(o => o.Location).Include(o => o.Position);
            return View(openPositions1.ToList());
        }

        // GET: OpenPositions/FindJob
        public ActionResult FindJob()
        {
            var openPositions1 = db.OpenPositions1.Include(o => o.Location).Include(o => o.Position);
            return View(openPositions1.ToList());
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
        public ActionResult Create([Bind(Include = "OpenPositionId,PositionId,LocationId")] OpenPositions openPositions)
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
        public ActionResult Edit([Bind(Include = "OpenPositionId,PositionId,LocationId")] OpenPositions openPositions)
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
