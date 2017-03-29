using System;
using System.Collections.Generic;

namespace ShaanFoods.Models
{
    public partial class Feedback
    {
        public int FeedId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Feedback1 { get; set; }
    }
}
