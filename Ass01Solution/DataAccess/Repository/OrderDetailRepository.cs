using BusinessObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repository
{
    public class OrderDetailRepository : IOrderDetailRepository
    {
        public void DeleteOrderDetail(OrderDetailObject orderDetail)
        {
            OrderDetailDAO.Instance.Remove(orderDetail);
        }

        public IEnumerable<OrderDetailObject> GetOrderDetail()
        {
            return OrderDetailDAO.Instance.GetOrderDetailList();
        }

        public OrderDetailObject GetOrderDetailByID(int orderId, int productId)
        {
            return OrderDetailDAO.Instance.GetOrderDetailByID(orderId, productId);
        }

        public void InsertOrderDetail(OrderDetailObject orderDetail)
        {
            OrderDetailDAO.Instance.AddNew(orderDetail);
        }

        public void UpdateOrderDetail(OrderDetailObject orderDetail)
        {
            OrderDetailDAO.Instance.Update(orderDetail);
        }
    }
}
