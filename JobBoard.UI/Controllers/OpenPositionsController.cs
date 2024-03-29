﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using JobBoard.DATA;
using Microsoft.AspNet.Identity;
using PagedList;

namespace JobBoard.UI.Controllers
{
    public class OpenPositionsController : Controller
    {
        private JobBoardEntities db = new JobBoardEntities();

        // GET: OpenPositions
        [Authorize(Roles = "Admin,Manager")]
        public ActionResult Index()
        {
            var userId = User.Identity.GetUserId();
            var userLocation = db.Locations1.FirstOrDefault(u => u.ManagerId == userId);
            var openPositions = db.OpenPositions1.Include(o => o.Location).Include(o => o.Position);

            if (Request.IsAuthenticated && User.IsInRole("Manager"))
            {
                openPositions = db.OpenPositions1.Include(o => o.Location).Include(o => o.Position).Where(o => o.LocationId == userLocation.LocationId);
            }

            return View(openPositions.ToList());
        }

        // GET: OpenPositions/FindJob
        public ActionResult FindJob(string currentFilter, string searchString, int? page)
        {
            int pageSize = 6; // Set 6 entries per page
            int pageNumber = (page ?? 1);

            if (searchString != null)
            {
                page = 1; // If a query is entered, start at page 1 of the new results
            }
            else
            {
                searchString = currentFilter;  // Save the query into a filter to carry forward
            }

            ViewBag.CurrentFilter = searchString;

            // By default, return all open positions
            var openPositions = db.OpenPositions1.Include(o => o.Location).Include(o => o.Position)
                                                 .OrderBy(o => o.Position.Title);

            if (!String.IsNullOrEmpty(searchString))
            {
                // Filter and return open positions containing keyword
                openPositions = openPositions.Where(o => o.Position.Title.Contains(searchString)
                                                      || o.Location.City.Contains(searchString)
                                                      || o.Location.State.Contains(searchString))
                                             .OrderBy(o => o.Position.Title);
            }

            return View(openPositions.ToPagedList(pageNumber, pageSize));
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
        [Authorize(Roles = "Admin,Manager")]
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
        [Authorize(Roles = "Admin,Manager")]
        public ActionResult Create()
        {
            var userId = User.Identity.GetUserId();
            var manager = db.Locations1.FirstOrDefault(u => u.ManagerId == userId);
            ViewBag.LocationId = new SelectList(db.Locations1, "LocationId", "LocationInfo");
            ViewBag.PositionId = new SelectList(db.Positions1, "PositionId", "Title");
            
            if (Request.IsAuthenticated && User.IsInRole("Manager"))
            {
                var managerLocation = db.Locations1.Single(o => o.LocationId == manager.LocationId).LocationId;

                ViewBag.ManagerLocation = managerLocation;
            }

            return View();
        }

        // POST: OpenPositions/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin,Manager")]
        public ActionResult Create([Bind(Include = "OpenPositionId,PositionId,LocationId,IsFeatured")] OpenPositions openPositions)
        {
            var userId = User.Identity.GetUserId();
            var manager = db.Locations1.FirstOrDefault(u => u.ManagerId == userId);
            
            if (ModelState.IsValid)
            {
                db.OpenPositions1.Add(openPositions);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.LocationId = new SelectList(db.Locations1, "LocationId", "LocationInfo", openPositions.LocationId);
            ViewBag.PositionId = new SelectList(db.Positions1, "PositionId", "Title", openPositions.PositionId);

            if (Request.IsAuthenticated && User.IsInRole("Manager"))
            {
                var managerLocation = db.Locations1.Single(o => o.LocationId == manager.LocationId).LocationId;

                ViewBag.ManagerLocation = managerLocation;
            }
            
            return View(openPositions);
        }

        // GET: OpenPositions/Edit/5
        [Authorize(Roles = "Admin,Manager")]
        public ActionResult Edit(int? id)
        {
            var userId = User.Identity.GetUserId();
            var manager = db.Locations1.FirstOrDefault(u => u.ManagerId == userId);
            
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OpenPositions openPositions = db.OpenPositions1.Find(id);
            if (openPositions == null)
            {
                return HttpNotFound();
            }

            ViewBag.LocationId = new SelectList(db.Locations1, "LocationId", "LocationInfo", openPositions.LocationId);
            ViewBag.PositionId = new SelectList(db.Positions1, "PositionId", "Title", openPositions.PositionId);

            if (Request.IsAuthenticated && User.IsInRole("Manager"))
            {
                var managerLocation = db.Locations1.Single(o => o.LocationId == manager.LocationId).LocationId;

                ViewBag.ManagerLocation = managerLocation;
            }

            return View(openPositions);
        }

        // POST: OpenPositions/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin,Manager")]
        public ActionResult Edit([Bind(Include = "OpenPositionId,PositionId,LocationId,IsFeatured")] OpenPositions openPositions)
        {
            var userId = User.Identity.GetUserId();
            var manager = db.Locations1.FirstOrDefault(u => u.ManagerId == userId);
            
            if (ModelState.IsValid)
            {
                db.Entry(openPositions).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.LocationId = new SelectList(db.Locations1, "LocationId", "LocationInfo", openPositions.LocationId);
            ViewBag.PositionId = new SelectList(db.Positions1, "PositionId", "Title", openPositions.PositionId);

            if (Request.IsAuthenticated && User.IsInRole("Manager"))
            {
                var managerLocation = db.Locations1.Single(o => o.LocationId == manager.LocationId).LocationId;

                ViewBag.ManagerLocation = managerLocation;
            }

            return View(openPositions);
        }

        // GET: OpenPositions/Delete/5
        [Authorize(Roles = "Admin,Manager")]
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
        [Authorize(Roles = "Admin,Manager")]
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
