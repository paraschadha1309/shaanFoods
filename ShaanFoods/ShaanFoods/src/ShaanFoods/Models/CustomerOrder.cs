using System;
using System.Collections.Generic;

namespace ShaanFoods.Models
{
    public partial class CustomerOrder
    {
        public CustomerOrder()
        {
            OrderDetails = new HashSet<OrderDetails>();
        }

        public int OrderId { get; set; }
        public string Description { get; set; }
        public string CustomerName { get; set; }
        public string CustomerPhone { get; set; }
        public TimeSpan PickupTime { get; set; }
        public DateTime PickupDate { get; set; }
        public string OrderStatus { get; set; }

        public virtual ICollection<OrderDetails> OrderDetails { get; set; }
    }
}
