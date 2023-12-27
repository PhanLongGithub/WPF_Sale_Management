using BusinessObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repository
{
    public interface IOrderDetailRepository
    {
        IEnumerable<OrderDetailObject> GetOrderDetail();
        OrderDetailObject GetOrderDetailByID(int orderId, int productId);
        void InsertOrderDetail(OrderDetailObject orderDetail);
        void DeleteOrderDetail(OrderDetailObject orderDetail);
        void UpdateOrderDetail(OrderDetailObject orderDetail);
    }
}
