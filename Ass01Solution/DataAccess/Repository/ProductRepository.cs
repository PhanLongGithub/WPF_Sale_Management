using BusinessObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repository
{
    public class ProductRepository : IProductRepository
    {
        public void DeleteProduct(ProductObject product)
        {
            ProductDAO.Instance.Remove(product);
        }

        public ProductObject GetProductByID(int productId)
        {
            return ProductDAO.Instance.GetProductByID(productId);
        }

        public IEnumerable<ProductObject> GetProducts()
        {
            return ProductDAO.Instance.GetProductList();
        }

        public void InsertProduct(ProductObject product)
        {
            ProductDAO.Instance.AddNew(product);
        }

        public IEnumerable<ProductObject> SearchProducts(int? Id, String ProductName, decimal? UnitPrice, int? UnitInStock)
        {
            return ProductDAO.Instance.SearchProduct(Id,ProductName,UnitPrice,UnitInStock);
        }

        public void UpdateProduct(ProductObject product)
        {
            ProductDAO.Instance.Update(product);
        }
    }
}
