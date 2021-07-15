using JobBoard.UI.Models;
using System.Collections.Generic;
using System.Linq;
using System;
using System.Data;
using System.Data.Entity;
using System.Net;
using System.Net.Mail;
using System.Web.Mvc;
using JobBoard.DATA;
using System.Configuration;

namespace JobBoard.UI.Controllers
{
    public class HomeController : Controller
    {
        private JobBoardEntities db = new JobBoardEntities();

        [HttpGet]
        public ActionResult Index()
        {
            var openPositions1 = db.OpenPositions1.Include(o => o.Location).Include(o => o.Position).Take(3)
                                                   .OrderBy(o => o.Position.Title);
            ViewBag.Openings = db.OpenPositions1.Include(o => o.OpenPositionId).Count();
            ViewBag.Accounts = db.AspNetUsers.Include(a => a.UserName).Count();
            ViewBag.Resumes = db.UserDetails1.Where(r => r.ResumeFilename != null).Count();
            return View(openPositions1.ToList());
        }

        // GET: Featured Open Position Partial
        public ActionResult FeaturedOpenPositions()
        {
            List<OpenPositions> featuredOpenPositions = db.OpenPositions1.Where(o => o.IsFeatured == true).Take(6).ToList();
            return PartialView("FeaturedOpenPositions", featuredOpenPositions);
        }

        [HttpGet]
        // GET: Home/About
        public ActionResult About()
        {
            return View();
        }

        [HttpGet]
        // GET: Home/Contact
        public ActionResult Contact()
        {
            return View();
        }

        // POST: Home/Contact
        [HttpPost]
        [ValidateAntiForgeryToken]
        public JsonResult ContactAjax(ContactViewModel cvm)
        {
            string message = $"You have received a new contact form submisson.<br /><br />" +
                                $"Name: {cvm.Name}<br />" +
                                $"Email: {cvm.Email}<br />" +
                                $"Message:<br /><br />" +
                                $"{cvm.Message}";

            MailMessage mm = new MailMessage(
                // FROM
                ConfigurationManager.AppSettings["EmailUser"].ToString(),
                // TO
                ConfigurationManager.AppSettings["EmailTo"].ToString(),
                // SUBJECT
                "New contact form submission.",
                // MESSAGE
                message
            );

            mm.IsBodyHtml = true;
            mm.ReplyToList.Add(cvm.Email);
            mm.Priority = MailPriority.High;

            SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["EmailClient"].ToString());
            client.Credentials = new NetworkCredential(
                // LOGIN
                ConfigurationManager.AppSettings["EmailUser"].ToString(),
                // PASSWORD
                ConfigurationManager.AppSettings["EmailPass"].ToString()
            );

            try
            {
                client.Send(mm);
            }
            catch (Exception ex)
            {
                ViewBag.Message = ex.StackTrace;
            }

            return Json(cvm);
        }
    }
}
