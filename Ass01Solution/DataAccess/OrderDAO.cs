using BusinessObject;
using DataAccess.Repository;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    internal class OrderDAO
    {
        private static OrderDAO instance = null;
        private static readonly object instanceLock = new object();
        private OrderDAO() { }
        public static OrderDAO Instance
        {
            get
            {
                lock (instanceLock)
                {
                    if (instance == null)
                    {
                        instance = new OrderDAO();
                    }
                    return instance;
                }
            }
        }

        public IEnumerable<OrderObject> GetOrderList()
        {
            List<OrderObject> orders = new List<OrderObject>();
            try
            {
                var context = new FstoreContext();
                orders = context.Orders.ToList();
                if (orders.Count <= 0)
                {
                    throw new NullReferenceException();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return orders;
        }

        public OrderObject GetOrderByID(int OrderId)
        {
            OrderObject Order = null;
            try
            {
                var context = new FstoreContext();
                Order = context.Orders.SingleOrDefault(Order => Order.OrderId == OrderId);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return Order;
        }

        public void AddNew(OrderObject Order)
        {
            try
            {
                OrderObject _Order = GetOrderByID(Order.OrderId);
                if (_Order == null)
                {
                    var context = new FstoreContext();
                    context.Orders.Add(Order);
                    context.SaveChanges();
                }
                else
                {
                    throw new Exception("The Order is already exist.");
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void Update(OrderObject Order)
        {
            try
            {
                OrderObject _Order = GetOrderByID(Order.OrderId);
                if (_Order != null)
                {
                    var context = new FstoreContext();
                    context.Entry<OrderObject>(Order).State = EntityState.Modified;
                    context.SaveChanges();
                }
                else
                {
                    throw new Exception("The Order doesn't already exist.");
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void Remove(OrderObject Order)
        {
            try
            {
                OrderObject _Order = GetOrderByID(Order.OrderId);
                if (_Order != null)
                {
                    var context = new FstoreContext();
                    List<OrderDetailObject> orderDetails = context.OrderDetails.Where(od => od.OrderId == Order.OrderId).ToList();
                    foreach(OrderDetailObject detail in orderDetails)
                    {
                        context.OrderDetails.Remove(detail);
                    }
                    context.Orders.Remove(Order);
                    context.SaveChanges();
                }
                else
                {
                    throw new Exception("The Order doesn't already exist.");
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
