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
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        IMemberRepository memberRepository;
        IProductRepository productRepository;
        IOrderRepository orderRepository;
        public MainWindow(IMemberRepository MemberRepository, IProductRepository ProductRepository,IOrderRepository OrderRepository)
        {
            this.memberRepository = MemberRepository;
            this.productRepository = ProductRepository;
            this.orderRepository = OrderRepository;
            InitializeComponent();
        }

        private void btnMember_Click(object sender, RoutedEventArgs e)
        {
            frMain.Content = new MemberManagement(memberRepository);
        }

        private void btnProduct_Click(object sender, RoutedEventArgs e)
        {
            frMain.Content = new ProductManagement(productRepository);
        }

        private void btnOrder_Click(object sender, RoutedEventArgs e)
        {
            frMain.Content = new OrderManagement(orderRepository);
        }
    }
}
