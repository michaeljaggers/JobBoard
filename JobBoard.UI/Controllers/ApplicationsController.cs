﻿using System;
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
    public class ApplicationsController : Controller
    {
        private JobBoardEntities db = new JobBoardEntities();

        // GET: Applications
        public ActionResult Index()
        {
            var applications1 = db.Applications1.Include(a => a.ApplicationStatu).Include(a => a.OpenPosition).Include(a => a.UserDetail);
            return View(applications1.ToList());
        }

        // GET: Applications/Details/5
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
        public ActionResult Create()
        {
            ViewBag.ApplicationStatus = new SelectList(db.ApplicationStatus1, "ApplicationStatusId", "StatusName");
            ViewBag.OpenPositionId = new SelectList(db.OpenPositions1, "OpenPositionId", "OpenPositionId");
            ViewBag.UserId = new SelectList(db.UserDetails1, "UserId", "FirstName");
            return View();
        }

        // POST: Applications/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ApplicationId,OpenPositionId,UserId,ApplicationDate,ManagerNotes,ApplicationStatus,ResumeFilename")] Applications applications)
        {
            if (ModelState.IsValid)
            {
                db.Applications1.Add(applications);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ApplicationStatus = new SelectList(db.ApplicationStatus1, "ApplicationStatusId", "StatusName", applications.ApplicationStatus);
            ViewBag.OpenPositionId = new SelectList(db.OpenPositions1, "OpenPositionId", "OpenPositionId", applications.OpenPositionId);
            ViewBag.UserId = new SelectList(db.UserDetails1, "UserId", "FirstName", applications.UserId);
            return View(applications);
        }

        // GET: Applications/Edit/5
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