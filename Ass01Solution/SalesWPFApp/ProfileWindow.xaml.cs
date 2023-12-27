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
using System.Windows.Shapes;

namespace SalesWPFApp
{
    /// <summary>
    /// Interaction logic for ProfileWindow.xaml
    /// </summary>
    public partial class ProfileWindow : Window
    {
        IMemberRepository memberRepository;
        MemberObject MemberObject;
        public ProfileWindow(IMemberRepository memberRepository, MemberObject memberObject)
        {
            this.memberRepository = memberRepository;
            this.MemberObject = memberObject;
            InitializeComponent();
            LoadMember();
        }

        private void LoadMember()
        {
            txtMemberId.Text = MemberObject.MemberId.ToString();
            txtEmail.Text = MemberObject.Email.ToString();
            txtCompanyName.Text = MemberObject.CompanyName.ToString();
            txtCity.Text = MemberObject.City.ToString();
            txtCountry.Text = MemberObject.Country;
            txtPassword.Text = MemberObject.Password;
        }
        private MemberObject GetMemberObject()
        {
            MemberObject member = null;
            try
            {
                member = new MemberObject
                {
                    MemberId = int.Parse(txtMemberId.Text),
                    Email = txtEmail.Text,
                    CompanyName = txtCompanyName.Text,
                    City = txtCity.Text,
                    Country = txtCountry.Text,
                    Password = txtPassword.Text,
                };
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Get Member");
            }
            return member;
        }

        private void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var result = MessageBox.Show("Are you sure you want to update?", "Application Update", MessageBoxButton.YesNo);
                if (result == MessageBoxResult.Yes)
                {
                    MemberObject member = GetMemberObject();
                    memberRepository.UpdateMember(member);
                    MessageBox.Show($"Member {member.MemberId} updated successfully", "Updated Member");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
