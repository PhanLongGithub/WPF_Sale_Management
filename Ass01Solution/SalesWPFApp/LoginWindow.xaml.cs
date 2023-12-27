using BusinessObject;
using DataAccess.Repository;
using System;
using System.Collections.Generic;
using System.DirectoryServices.ActiveDirectory;
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
using System.Windows.Shapes;

namespace SalesWPFApp
{
    /// <summary>
    /// Interaction logic for LoginWindow.xaml
    /// </summary>
    public partial class LoginWindow : Window
    {
        IMemberRepository memberRepository;
        IProductRepository productRepository;
        IOrderRepository orderRepository;
        public LoginWindow(IMemberRepository MemberRepository, IProductRepository ProductRepository, IOrderRepository OrderRepository)
        {
            this.memberRepository = MemberRepository;
            this.productRepository = ProductRepository;
            this.orderRepository = OrderRepository;
            InitializeComponent();
        }

        private void btnLogin_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                String Email = txtEmail.Text;
                String Passwod = txtPass.Text;
                Boolean result = memberRepository.Login(Email, Passwod);
                if(result== true)
                {
                    MainWindow mainWindow = new MainWindow(memberRepository, productRepository, orderRepository);
                    mainWindow.Show();
                    this.Close();
                }
                else if(result== false)
                {
                    MemberObject memberObject = this.memberRepository.GetMemberByEmailAndPassword(Email, Passwod);
                    ProfileWindow profileWindow = new ProfileWindow(memberRepository, memberObject);
                    profileWindow.Show();
                    this.Close();
                }
            }catch(Exception ex)
            {
                MessageBox.Show(ex.Message, "Error");
            }
        }
    }
}
