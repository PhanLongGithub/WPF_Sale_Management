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
    internal class OrderDetailDAO
    {
        private static OrderDetailDAO instance = null;
        private static readonly object instanceLock = new object();
        private OrderDetailDAO() { }
        public static OrderDetailDAO Instance
        {
            get
            {
                lock (instanceLock)
                {
                    if (instance == null)
                    {
                        instance = new OrderDetailDAO();
                    }
                    return instance;
                }
            }
        }

        public IEnumerable<OrderDetailObject> GetOrderDetailList()
        {
            List<OrderDetailObject> OrderDetails = new List<OrderDetailObject>();
            try
            {
                var context = new FstoreContext();
                OrderDetails = context.OrderDetails.ToList();
                if (OrderDetails.Count <= 0)
                {
                    throw new NullReferenceException();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return OrderDetails;
        }

        public OrderDetailObject GetOrderDetailByID(int OrderId, int ProductId)
        {
            OrderDetailObject OrderDetail = null;
            try
            {
                var context = new FstoreContext();
                OrderDetail = context.OrderDetails.SingleOrDefault(OrderDetail => OrderDetail.OrderId == OrderId && OrderDetail.ProductId == ProductId);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return OrderDetail;
        }

        public void AddNew(OrderDetailObject OrderDetail)
        {
            try
            {
                OrderDetailObject _OrderDetail = GetOrderDetailByID(OrderDetail.OrderId, OrderDetail.ProductId);
                if (_OrderDetail == null)
                {
                    var context = new FstoreContext();
                    context.OrderDetails.Add(OrderDetail);
                    context.SaveChanges();
                }
                else
                {
                    throw new Exception("The OrderDetail is already exist.");
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void Update(OrderDetailObject OrderDetail)
        {
            try
            {
                OrderDetailObject _OrderDetail = GetOrderDetailByID(OrderDetail.OrderId, OrderDetail.ProductId);
                if (_OrderDetail != null)
                {
                    var context = new FstoreContext();
                    context.Entry<OrderDetailObject>(OrderDetail).State = EntityState.Modified;
                    context.SaveChanges();
                }
                else
                {
                    throw new Exception("The OrderDetail doesn't already exist.");
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void Remove(OrderDetailObject OrderDetail)
        {
            try
            {
                OrderDetailObject _OrderDetail = GetOrderDetailByID(OrderDetail.OrderId, OrderDetail.ProductId);
                if (_OrderDetail != null)
                {
                    var context = new FstoreContext();
                    context.OrderDetails.Remove(OrderDetail);
                    context.SaveChanges();
                }
                else
                {
                    throw new Exception("The OrderDetail doesn't already exist.");
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
