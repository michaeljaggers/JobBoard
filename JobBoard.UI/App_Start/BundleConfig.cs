﻿using System.Web.Optimization;

namespace JobBoard.UI
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            // JS Bundles
            bundles.Add(new ScriptBundle("~/bundles/main_scripts").Include(
                        "~/Scripts/jquery-min.js",
                        "~/Scripts/bootstrap.min.js",
                        "~/Scripts/material.min.js",
                        "~/Scripts/material-kit.js",
                        "~/Scripts/jquery.parallax.js",
                        "~/Scripts/owl.carousel.min.js",
                        "~/Scripts/jquery.slicknav.js",
                        "~/Scripts/main.js",
                        "~/Scripts/jquery.counterup.min.js",
                        "~/Scripts/waypoints.min.js",
                        "~/Scripts/bootstrap-select.min.js",
                        "~/Scripts/form-validator.min.js",
                        "~/Scripts/jquery.themepunch.revolution.min.js",
                        "~/Scripts/jquery.themepunch.tools.min.js",
                        "~/Scripts/jquery.unobtrusive-ajax.min.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Style Bundles
            bundles.Add(new StyleBundle("~/Content/bootstrap").Include(
                      "~/Content/css/bootstrap.min.css",
                      "~/Content/css/jasny-bootstrap.min.css",
                      "~/Content/css/bootstrap-select.min.css"));

            bundles.Add(new StyleBundle("~/Content/material").Include(
                      "~/Content/css/material-kit.css"));

            bundles.Add(new StyleBundle("~/Content/fontawesome").Include(
                      "~/fonts/font-awesome.min.css",
                      "~/fonts/themify-icons.css"));

            bundles.Add(new StyleBundle("~/Content/extra_styles").Include(
                      "~/Content/extras/animate.css",
                      "~/Content/extras/owl.carousel.css",
                      "~/Content/extras/owl.theme.css",
                      "~/Content/extras/settings.css",
                      "~/Content/css/slicknav.css"));

            bundles.Add(new StyleBundle("~/Content/theme").Include(
                      "~/Content/css/main.css",
                      "~/Content/css/responsive.css",
                      "~/Content/css/colors/red.css"));

            bundles.Add(new StyleBundle("~/Content/custom").Include(
                      "~/Content/css/site.css"));
        }
    }
}
