using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using Microsoft.AspNet.Identity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using JobBoard.DATA;

namespace JobBoard.UI.Controllers
{
    public class ApplicationsController : Controller
    {
        private JobBoardEntities db = new JobBoardEntities();

        // GET: Applications/Index
        [Authorize(Roles = "Admin,Manager")]
        public ActionResult Index()
        {
            var userId = User.Identity.GetUserId();
            var userLocation = db.Locations1.FirstOrDefault(u => u.ManagerId == userId);
            var applications1 = db.Applications1.Include(a => a.ApplicationStatu).Include(a => a.OpenPosition).Include(a => a.UserDetail);

            if (Request.IsAuthenticated && User.IsInRole("Manager"))
            {
                applications1 = db.Applications1.Include(a => a.ApplicationStatu).Include(a => a.OpenPosition).Include(a => a.UserDetail).Where(a => a.OpenPosition.LocationId == userLocation.LocationId);
            }

            return View(applications1.ToList());
        }

        // GET: Applications/MyApplications
        [Authorize(Roles = "Employee")]
        public ActionResult MyApplications()
        {
            var userId = User.Identity.GetUserId();
            var myApplications = db.Applications1.Where(a => a.UserId == userId);
            return View(myApplications.ToList());
        }

        // GET: Applications/Details/5
        [Authorize(Roles = "Admin,Manager")]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Applications applications = db.Applications1.Find(id);
            if (applications == null)
            {
                return HttpNotFound();
            }
            return View(applications);
        }

        // GET: Applications/Create
        //public ActionResult Create()
        //{
        //    return View();
        //}

        // POST: Applications/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Employee")]
        public ActionResult Create(int openPositionId)
        {
            Applications applications = new Applications();

            var userId = User.Identity.GetUserId();
            var userDeets = db.UserDetails1.FirstOrDefault(u => u.UserId == userId);
            string userResume = null;

            if (userDeets != null)
            {
                userResume = userDeets.ResumeFilename;
            }

            if (userResume != null)
            {
                applications.OpenPositionId = openPositionId;
                applications.UserId = User.Identity.GetUserId();
                applications.ApplicationDate = DateTime.Now;
                applications.ApplicationStatus = 3;
                applications.ResumeFilename = userResume;

                if (ModelState.IsValid)
                {
                    db.Applications1.Add(applications);
                    db.SaveChanges();
                    return RedirectToAction("MyApplications");
                }
                
            }
            else
            {
                Session["message"] = "A resume is necessary to apply for positions.";
                return RedirectToAction("UploadResume", "Manage");
            }
            
            

            ViewBag.ApplicationStatus = new SelectList(db.ApplicationStatus1, "ApplicationStatusId", "StatusName", applications.ApplicationStatus);
            ViewBag.OpenPositionId = new SelectList(db.OpenPositions1, "OpenPositionId", "PositionId", applications.OpenPositionId);
            ViewBag.UserId = new SelectList(db.UserDetails1, "UserId", "FullName", applications.UserId);
            return View(applications);
        }

        // GET: Applications/Edit/5
        [Authorize(Roles = "Manager")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Applications applications = db.Applications1.Find(id);
            if (applications == null)
            {
                return HttpNotFound();
            }
            ViewBag.ApplicationStatus = new SelectList(db.ApplicationStatus1, "ApplicationStatusId", "StatusName", applications.ApplicationStatus);
            ViewBag.OpenPositionId = new SelectList(db.OpenPositions1, "OpenPositionId", "OpenPositionId", applications.OpenPositionId);
            ViewBag.UserId = new SelectList(db.UserDetails1, "UserId", "FirstName", applications.UserId);
            return View(applications);
        }

        // POST: Applications/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Manager")]
        public ActionResult Edit([Bind(Include = "ApplicationId,OpenPositionId,UserId,ApplicationDate,ManagerNotes,ApplicationStatus,ResumeFilename")] Applications applications)
        {
            if (ModelState.IsValid)
            {
                db.Entry(applications).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ApplicationStatus = new SelectList(db.ApplicationStatus1, "ApplicationStatusId", "StatusName", applications.ApplicationStatus);
            ViewBag.OpenPositionId = new SelectList(db.OpenPositions1, "OpenPositionId", "OpenPositionId", applications.OpenPositionId);
            ViewBag.UserId = new SelectList(db.UserDetails1, "UserId", "FirstName", applications.UserId);
            return View(applications);
        }

        // GET: Applications/Delete/5
        [Authorize(Roles = "Manager")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Applications applications = db.Applications1.Find(id);
            if (applications == null)
            {
                return HttpNotFound();
            }
            return View(applications);
        }

        // POST: Applications/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Manager")]
        public ActionResult DeleteConfirmed(int id)
        {
            Applications applications = db.Applications1.Find(id);
            db.Applications1.Remove(applications);
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
