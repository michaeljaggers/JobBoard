﻿using JobBoard.UI.Models;
using System.Collections.Generic;
using System.Linq;
using System;
using System.Net;
using System.Net.Mail;
using System.Web.Mvc;
using JobBoard.DATA;
using System.Configuration;

namespace JobBoard.UI.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        [Authorize]
        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        [HttpGet]
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        // POST: Home/Contact
        [HttpPost]
        public ActionResult Contact(ContactViewModel cvm)
        {
            if (!ModelState.IsValid)
            {
                return PartialView("ContactForm", cvm);
            }

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
                message);

            mm.IsBodyHtml = true;
            mm.ReplyToList.Add(cvm.Email);
            mm.Priority = MailPriority.High;

            SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["EmailClient"].ToString());
            client.Credentials = new NetworkCredential(
                // LOGIN
                ConfigurationManager.AppSettings["EmailUser"].ToString(),
                // PASSWORD
                ConfigurationManager.AppSettings["EmailPass"].ToString());

            try
            {
                client.Send(mm);
            }
            catch (Exception ex)
            {
                ViewBag.Error = $"<div class=\"alert alert-danger\" role=\"alert\">Your message cannot be sent at this time.<br />Error: {ex.Message}</div>";

                return PartialView("ContactForm", cvm);
            }

            ModelState.Clear();
            ViewBag.Success = $"<div class=\"alert alert-success\" role=\"alert\">Message sent.</div>";
            return PartialView("ContactForm");
        }
    }
}
