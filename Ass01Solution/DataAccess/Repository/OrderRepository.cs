using BusinessObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repository
{
    public class OrderRepository : IOrderRepository
    {
        public void DeleteOrder(OrderObject order)
        {
            OrderDAO.Instance.Remove(order);
        }

        public OrderObject GetOrderByID(int orderId)
        {
            return OrderDAO.Instance.GetOrderByID(orderId);
        }

        public IEnumerable<OrderObject> GetOrders()
        {
            return OrderDAO.Instance.GetOrderList();
        }

        public void InsertOrder(OrderObject order)
        {
            OrderDAO.Instance.AddNew(order);
        }

        public void UpdateOrder(OrderObject order)
        {
            OrderDAO.Instance.Update(order);
        }
    }
}
