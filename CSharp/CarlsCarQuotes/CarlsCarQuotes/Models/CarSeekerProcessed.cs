using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CarlsCarQuotes.Models
{
    public class CarSeekerProcessed
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string EmailAddress { get; set; }
        public Nullable<System.DateTime> DateOfBirth { get; set; }
        public Nullable<System.DateTime> CarYear { get; set; }
        public string CarMake { get; set; }
        public string CarModel { get; set; }
        public Nullable<bool> HasHadDUI { get; set; }
        public Nullable<int> SpeedingTickets { get; set; }
        public Nullable<bool> CoverageVsLiability { get; set; }
        public Nullable<int> FinalQuote { get; set; }
    }
}