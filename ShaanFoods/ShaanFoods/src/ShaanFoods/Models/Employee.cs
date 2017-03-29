using System;
using System.Collections.Generic;

namespace ShaanFoods.Models
{
    public partial class Employee
    {
        public int EmployeeId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string MiddleName { get; set; }
        public DateTime Dob { get; set; }
        public string Gender { get; set; }
        public string Street { get; set; }
        public string PostalCode { get; set; }
        public string Email { get; set; }
        public string Sin { get; set; }
        public string Phone { get; set; }
        public string EmergencyContact { get; set; }
        public bool? IsAdministrator { get; set; }
    }
}
