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
    /// Interaction logic for OrderManagement.xaml
    /// </summary>
    public partial class OrderManagement : Page
    {
        IOrderRepository orderRepository;
        public OrderManagement(IOrderRepository repository)
        {
            this.orderRepository = repository;
            InitializeComponent();
        }

        private OrderObject GetOrderObject()
        {
            OrderObject order = null;
            try
            {
                order = new OrderObject
                {
                    OrderId = int.Parse(txtOrderId.Text),
                    MemberId = int.Parse(txtMemberId.Text),
                    OrderDate = DateTime.Parse(txtOrderDate.Text),
                    RequiredDate = DateTime.Parse(txtRequiredDate.Text),
                    ShippedDate = DateTime.Parse(txtShippedDate.Text),
                    Freight = Decimal.Parse(txtFreight.Text),
                };
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Get Member");
            }
            return order;
        }

        public void LoadOrderlist()
        {
            lvOrders.ItemsSource = orderRepository.GetOrders();
        }

        private void btnLoad_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                LoadOrderlist();
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnInsert_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                OrderObject order = GetOrderObject();
                orderRepository.InsertOrder(order);
                LoadOrderlist();
                MessageBox.Show($"{order.OrderId} inserted successfully", "Insert Order");
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
                    OrderObject order = GetOrderObject();
                    orderRepository.UpdateOrder(order);
                    LoadOrderlist();
                    MessageBox.Show($"Order {order.OrderId} updated successfully", "Updated Order");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var result = MessageBox.Show("Are you sure you want to delete?", "Application Deleted", MessageBoxButton.YesNo);
                if (result == MessageBoxResult.Yes)
                {
                    OrderObject order = GetOrderObject();
                    orderRepository.DeleteOrder(order);
                    LoadOrderlist();
                    MessageBox.Show($"Order {order.OrderId} deleted successfully", "Removed Order");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnSaleReport_Click(object sender, RoutedEventArgs e)
        {
            //DateTime OrderDate = DateTime.Parse(txtOrderDate.Text);
            //DateTime RequiredDate = DateTime.Parse(txtRequiredDate.Text);
            List<OrderObject> OrderObjects = orderRepository.GetOrders().ToList();
            String result = "";
            foreach (OrderObject order in OrderObjects)
            {
                result += ($"{order.ToString()}");
            }
            MessageBox.Show(result, "Sale Report");
        }
    }
}
