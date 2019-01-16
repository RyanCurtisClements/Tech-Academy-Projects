using CarlsCarQuotes.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CarlsCarQuotes.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        public ActionResult Index()
        {
            using (CarQuotesDBEntities db = new CarQuotesDBEntities())
            {
                var carSeekers = db.CarSeekers;
                var carSeekerVms = new List<CarSeekersVm>();
                foreach (var carSeeker in carSeekers)
                {
                    var carSeekerVm = new CarSeekersVm();
                    carSeekerVm.FirstName = carSeeker.FirstName;
                    carSeekerVm.LastName = carSeeker.LastName;
                    carSeekerVm.EmailAddress = carSeeker.EmailAddress;
                    carSeekerVms.Add(carSeekerVm);
                }

                return View(carSeekerVms);
            }
        }
    }
}