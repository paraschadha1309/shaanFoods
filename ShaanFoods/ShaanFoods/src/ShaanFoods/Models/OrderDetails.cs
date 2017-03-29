using System;
using System.Collections.Generic;

namespace ShaanFoods.Models
{
    public partial class OrderDetails
    {
        public int OrderDetailsId { get; set; }
        public int OrderId { get; set; }
        public int PCategoryId { get; set; }
        public decimal OrderWeight { get; set; }
        public int OrderQuantity { get; set; }
        public decimal OrderPrice { get; set; }

        public virtual CustomerOrder Order { get; set; }
        public virtual ProductsCategory PCategory { get; set; }
    }
}
