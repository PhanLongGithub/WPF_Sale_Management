using BusinessObject;
using DataAccess.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace SalesWPFApp
{
    /// <summary>
    /// Interaction logic for ProductManagement.xaml
    /// </summary>
    public partial class ProductManagement : Page
    {
        IProductRepository productRepository;
        public ProductManagement(IProductRepository repository)
        {
            this.productRepository = repository;
            InitializeComponent();
        }

        private ProductObject GetProductObject()
        {
            ProductObject product = null;
            try
            {
                product = new ProductObject
                {
                    ProductId = int.Parse(txtProductId.Text),
                    CategoryId = int.Parse(txtCategoryId.Text),
                    ProductName = txtProductName.Text,
                    Weight = txtWeight.Text,
                    UnitPrice = Decimal.Parse(txtUnitPrice.Text),
                    UnitInStock = int.Parse(txtUnitInStock.Text),
                };
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Get Member");
            }
            return product;
        }

        public void LoadProductlist()
        {
            lvProducts.ItemsSource = productRepository.GetProducts();
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var result = MessageBox.Show("Are you sure you want to delete?", "Application Deleted", MessageBoxButton.YesNo);
                if (result == MessageBoxResult.Yes)
                {
                    ProductObject product = GetProductObject();
                    productRepository.DeleteProduct(product);
                    LoadProductlist();
                    MessageBox.Show($"Product {product.ProductName} deleted successfully", "Removed Product");
                }
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnLoad_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                LoadProductlist();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnInsert_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                ProductObject product = GetProductObject();
                productRepository.InsertProduct(product);
                LoadProductlist();
                MessageBox.Show($"Product {product.ProductName} inserted successfully", "Insert Product");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var result = MessageBox.Show("Are you sure you want to update?", "Application Update", MessageBoxButton.YesNo);
                if (result == MessageBoxResult.Yes)
                {
                    ProductObject product = GetProductObject();
                    productRepository.UpdateProduct(product);
                    LoadProductlist();
                    MessageBox.Show($"Product {product.ProductName} updated successfully", "Updated Product");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnSearch_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                int? Id = null;
                if(txtProductId.Text != "")
                {
                    Id = int.Parse(txtProductId.Text);
                }
                String name = txtProductName.Text;
                decimal? UnitPrice = null;
                if(txtUnitPrice.Text != "")
                {
                    UnitPrice = decimal.Parse(txtUnitPrice.Text);
                }
                int? UnitInStock = null;
                if(txtUnitInStock.Text != "")
                {
                    UnitInStock = int.Parse(txtUnitInStock.Text);
                }
                lvProducts.ItemsSource = productRepository.SearchProducts(Id,name,UnitPrice,UnitInStock);
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
