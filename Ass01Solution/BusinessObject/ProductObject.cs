using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObject
{
    public partial class ProductObject
    {
        public int ProductId { get; set; }

        public int CategoryId { get; set; }

        public String ProductName { get; set; } = null!;

        public String Weight { get; set; } = null!;

        public decimal UnitPrice { get; set; }

        public int UnitInStock { get; set; }

        public virtual ICollection<OrderDetailObject> OrderDetails { get; set; } = new List<OrderDetailObject>();
    }
}
