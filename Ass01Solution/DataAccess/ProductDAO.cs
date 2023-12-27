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
    internal class ProductDAO
    {
        private static ProductDAO instance = null;
        private static readonly object instanceLock = new object();
        private ProductDAO() { }
        public static ProductDAO Instance
        {
            get
            {
                lock (instanceLock)
                {
                    if (instance == null)
                    {
                        instance = new ProductDAO();
                    }
                    return instance;
                }
            }
        }

        public IEnumerable<ProductObject> GetProductList()
        {
            List<ProductObject> Products = new List<ProductObject>();
            try
            {
                var context = new FstoreContext();
                Products = context.Products.ToList();
                if (Products.Count <= 0)
                {
                    throw new NullReferenceException();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return Products;
        }

        public ProductObject GetProductByID(int ProductId)
        {
            ProductObject Product = null;
            try
            {
                var context = new FstoreContext();
                Product = context.Products.Include(p => p.OrderDetails).SingleOrDefault(Product => Product.ProductId == ProductId);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return Product;
        }

        public void AddNew(ProductObject Product)
        {
            try
            {
                ProductObject _Product = GetProductByID(Product.ProductId);
                if (_Product == null)
                {
                    var context = new FstoreContext();
                    context.Products.Add(Product);
                    context.SaveChanges();
                }
                else
                {
                    throw new Exception("The Product is already exist.");
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void Update(ProductObject Product)
        {
            try
            {
                ProductObject _Product = GetProductByID(Product.ProductId);
                if (_Product != null)
                {
                    var context = new FstoreContext();
                    context.Entry<ProductObject>(Product).State = EntityState.Modified;
                    context.SaveChanges();
                }
                else
                {
                    throw new Exception("The Product doesn't already exist.");
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void Remove(ProductObject Product)
        {
            try
            {
                ProductObject _Product = GetProductByID(Product.ProductId);
                if (_Product != null)
                {
                    var context = new FstoreContext();
                    foreach(OrderDetailObject orderDetail in _Product.OrderDetails)
                    {
                        OrderDetailObject _orderDetail = context.OrderDetails.SingleOrDefault(od => od.OrderId == orderDetail.OrderId && od.ProductId == orderDetail.ProductId);
                        context.OrderDetails.Remove(_orderDetail);
                    }
                    context.Products.Remove(Product);
                    context.SaveChanges();
                }
                else
                {
                    throw new Exception("The Product doesn't already exist.");
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public IEnumerable<ProductObject> SearchProduct(int? Id, String ProductName, decimal? UnitPrice, int? UnitInStock)
        {
            List<ProductObject> Products = new List<ProductObject>();
            try
            {
                var context = new FstoreContext();
                Products = context.Products.ToList();
                if(Id != null)
                {
                    Products = Products.Where(p => p.ProductId == Id).ToList();
                }
                if (ProductName != null)
                {
                    Products = Products.Where(p => p.ProductName.Contains(ProductName)).ToList();
                }
                if (UnitPrice != null)
                {
                    Products = Products.Where(p => p.UnitPrice == UnitPrice).ToList();
                }
                if (UnitInStock != null)
                {
                    Products = Products.Where(p => p.UnitInStock == UnitInStock).ToList();
                }
                if (Products.Count <= 0)
                {
                    throw new NullReferenceException();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return Products;
        }
    }
}
