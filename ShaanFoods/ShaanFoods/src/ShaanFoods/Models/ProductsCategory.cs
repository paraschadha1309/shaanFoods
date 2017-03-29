using System;
using System.Collections.Generic;

namespace ShaanFoods.Models
{
    public partial class ProductsCategory
    {
        public ProductsCategory()
        {
            OrderDetails = new HashSet<OrderDetails>();
        }

        public int PCategoryId { get; set; }
        public int ProductId { get; set; }
        public string CategoryName { get; set; }
        public double? Price { get; set; }
        public string Description { get; set; }

        public virtual ICollection<OrderDetails> OrderDetails { get; set; }
        public virtual Products Product { get; set; }
    }
}
