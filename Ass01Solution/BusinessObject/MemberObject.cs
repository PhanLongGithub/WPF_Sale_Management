using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObject
{
    public partial class MemberObject
    {
        public int MemberId { get; set; }

        public string Email { get; set; } = null!;

        public string CompanyName { get; set; } = null!;

        public string City { get; set; } = null!;

        public string Country { get; set; } = null!;

        public string Password { get; set; } = null!;

        public virtual ICollection<OrderObject> Orders { get; set; } = new List<OrderObject>();
    }
}
