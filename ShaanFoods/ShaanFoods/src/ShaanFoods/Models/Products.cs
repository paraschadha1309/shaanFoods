using System;
using System.Collections.Generic;

namespace ShaanFoods.Models
{
    public partial class Products
    {
        public Products()
        {
            ProductsCategory = new HashSet<ProductsCategory>();
        }

        public int ProductId { get; set; }
        public string ProductName { get; set; }

        public virtual ICollection<ProductsCategory> ProductsCategory { get; set; }
    }
}
