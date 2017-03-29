using System;
using System.Collections.Generic;

namespace ShaanFoods.Models
{
    public partial class Account
    {
        public int UserId { get; set; }
        public string UserName { get; set; }
        public string UserPassword { get; set; }
        public string Role { get; set; }
    }
}
