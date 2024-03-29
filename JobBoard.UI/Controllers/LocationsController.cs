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
    [Authorize(Roles = "Admin")]
    public class LocationsController : Controller
    {

        private JobBoardEntities db = new JobBoardEntities();

        // GET: Locations
        public ActionResult Index()
        {
            var locations1 = db.Locations1.Include(l => l.UserDetail);
            return View(locations1.ToList());

            
        }

        // GET: Locations/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Locations locations = db.Locations1.Find(id);
            if (locations == null)
            {
                return HttpNotFound();
            }
            return View(locations);
        }

        // GET: Locations/Create
        public ActionResult Create()
        {
            // Get only users with the manager role to populate SelectList
            List<AspNetUser> users = new List<AspNetUser>();
            var roles = db.AspNetRoles;
            foreach (var role in roles)
            {
                if (role.Name == "Manager")
                {
                    users = role.AspNetUsers.ToList();
                }
            }

            List<UserDetails> managers = new List<UserDetails>();
            foreach (var user in users)
            {
                UserDetails manager = db.UserDetails1.Where(m => m.UserId == user.Id).FirstOrDefault();
                managers.Add(manager);
            }

            ViewBag.ManagerId = new SelectList(managers, "UserId", "FullName");
            return View();
        }

        // POST: Locations/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LocationId,StoreNumber,City,State,ManagerId")] Locations locations)
        {
            // Get only users with the manager role to populate SelectList
            List<AspNetUser> users = new List<AspNetUser>();
            var roles = db.AspNetRoles;
            foreach (var role in roles)
            {
                if (role.Name == "Manager")
                {
                    users = role.AspNetUsers.ToList();
                }
            }

            List<UserDetails> managers = new List<UserDetails>();
            foreach (var user in users)
            {
                UserDetails manager = db.UserDetails1.Where(m => m.UserId == user.Id).FirstOrDefault();
                managers.Add(manager);
            }

            if (ModelState.IsValid)
            {
                db.Locations1.Add(locations);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ManagerId = new SelectList(managers, "UserId", "FullName", locations.ManagerId);
            return View(locations);
        }

        // GET: Locations/Edit/5
        public ActionResult Edit(int? id)
        {
            // Get only users with the manager role to populate SelectList
            List<AspNetUser> users = new List<AspNetUser>();
            var roles = db.AspNetRoles;
            foreach (var role in roles)
            {
                if (role.Name == "Manager")
                {
                    users = role.AspNetUsers.ToList();
                }
            }

            List<UserDetails> managers = new List<UserDetails>();
            foreach (var user in users)
            {
                UserDetails manager = db.UserDetails1.Where(m => m.UserId == user.Id).FirstOrDefault();
                managers.Add(manager);
            }

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Locations locations = db.Locations1.Find(id);
            if (locations == null)
            {
                return HttpNotFound();
            }
            ViewBag.ManagerId = new SelectList(managers, "UserId", "FullName", locations.ManagerId);
            return View(locations);
        }

        // POST: Locations/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LocationId,StoreNumber,City,State,ManagerId")] Locations locations)
        {
            // Get only users with the manager role to populate SelectList
            List<AspNetUser> users = new List<AspNetUser>();
            var roles = db.AspNetRoles;
            foreach (var role in roles)
            {
                if (role.Name == "Manager")
                {
                    users = role.AspNetUsers.ToList();
                }
            }

            List<UserDetails> managers = new List<UserDetails>();
            foreach (var user in users)
            {
                UserDetails manager = db.UserDetails1.Where(m => m.UserId == user.Id).FirstOrDefault();
                managers.Add(manager);
            }

            if (ModelState.IsValid)
            {
                db.Entry(locations).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ManagerId = new SelectList(managers, "UserId", "FullName", locations.ManagerId);
            return View(locations);
        }

        // GET: Locations/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Locations locations = db.Locations1.Find(id);
            if (locations == null)
            {
                return HttpNotFound();
            }
            return View(locations);
        }

        // POST: Locations/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Locations locations = db.Locations1.Find(id);
            db.Locations1.Remove(locations);
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
