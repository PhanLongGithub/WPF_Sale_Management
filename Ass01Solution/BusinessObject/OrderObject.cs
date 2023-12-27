using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObject
{
    public partial class OrderObject
    {
        public int OrderId { get; set; }

        public int MemberId { get; set; }

        public DateTime OrderDate { get; set; }

        public DateTime? RequiredDate { get; set; }

        public DateTime? ShippedDate { get; set; }

        public decimal? Freight { get; set; }

        public virtual MemberObject Member { get; set; } = null!;

        public override string? ToString()
        {
            return $"Id:{OrderId}, Member Id:{MemberId}, Order Date:{OrderDate}, Required Date:{RequiredDate}, Shipped Date:{ShippedDate}, Freight:{Freight}\n";
        }
    }
}
