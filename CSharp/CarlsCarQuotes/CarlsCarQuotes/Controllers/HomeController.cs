using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CarlsCarQuotes.ViewModels;
using CarlsCarQuotes.Models;

namespace CarlsCarQuotes.Controllers
{
    public class HomeController : Controller
    {
        //private readonly string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog = master; Integrated Security = True; Connect Timeout = 30; Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            return View();
        }

        public ActionResult Contact()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ProcessCarSeeker(string firstName, string lastName, string emailAddress,
            DateTime dateOfBirth, DateTime carYear, string carMake, string carModel,
            bool? hasHadDUI, int? speedingTickets, bool? coverageVsLiability)
        {
            using (CarQuotesDBEntities db = new CarQuotesDBEntities())
            {
                var carSeeker = new CarSeeker();

                carSeeker.FirstName = firstName;
                carSeeker.LastName = lastName;
                carSeeker.EmailAddress = emailAddress;
                carSeeker.DateOfBirth = dateOfBirth;
                carSeeker.CarYear = carYear;
                carSeeker.CarMake = carMake;
                carSeeker.CarModel = carModel;
                
                if (Request.Form["HasHadDUI"] == "Yes")
                {
                    carSeeker.HasHadDUI = true;
                }
                else
                {
                    carSeeker.HasHadDUI = false;
                }

                carSeeker.SpeedingTickets = speedingTickets;

                if (Request.Form["CoverageVsLiability"] == "Full Coverage")
                {
                    carSeeker.CoverageVsLiability = true;
                }
                else
                {
                    carSeeker.CoverageVsLiability = false;
                }

                db.CarSeekers.Add(carSeeker);
                db.SaveChanges();

                var carSeekerProcessed = new CarSeekerProcessed();
                var carSeekersProcessed = new List<CarSeekerProcessed>();
                int finalQuote = 50;
                CarQuote.CalculateQuote(carSeeker, out finalQuote);

                carSeekerProcessed.FirstName = carSeeker.FirstName;
                carSeekerProcessed.LastName = carSeeker.LastName;
                carSeekerProcessed.EmailAddress = carSeeker.EmailAddress;
                carSeekerProcessed.DateOfBirth = carSeeker.DateOfBirth;
                carSeekerProcessed.CarYear = carSeeker.CarYear;
                carSeekerProcessed.CarMake = carSeeker.CarMake;
                carSeekerProcessed.CarModel = carSeeker.CarModel;
                carSeekerProcessed.HasHadDUI = carSeeker.HasHadDUI;
                carSeekerProcessed.SpeedingTickets = carSeeker.SpeedingTickets;
                carSeekerProcessed.CoverageVsLiability = carSeeker.CoverageVsLiability;
                carSeekerProcessed.FinalQuote = finalQuote;

                carSeekersProcessed.Add(carSeekerProcessed);

                return View("YourQuote", carSeekersProcessed);
            }                  
            }

        }
    }