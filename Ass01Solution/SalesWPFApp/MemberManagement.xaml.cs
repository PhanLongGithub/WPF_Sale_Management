using BusinessObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.ConstrainedExecution;
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
using DataAccess.Repository;

namespace SalesWPFApp
{
    /// <summary>
    /// Interaction logic for MemberManagement.xaml
    /// </summary>
    public partial class MemberManagement : Page
    {
        IMemberRepository memberRepository;
        public MemberManagement(IMemberRepository repository)
        {
            this.memberRepository = repository;
            InitializeComponent();
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

        public void LoadMemberlist()
        {
            lvMembers.ItemsSource = memberRepository.GetMembers();
        }

        private void btnLoad_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                LoadMemberlist();
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
                MemberObject member = GetMemberObject();
                memberRepository.InsertMember(member);
                LoadMemberlist();
                MessageBox.Show($"Member {member.MemberId} inserted successfully", "Insert Member");
            }
            catch(Exception ex)
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
                    MemberObject member = GetMemberObject();
                    memberRepository.UpdateMember(member);
                    LoadMemberlist();
                    MessageBox.Show($"Member {member.MemberId} updated successfully", "Updated Member");
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
                    MemberObject member = GetMemberObject();
                    memberRepository.DeleteMember(member);
                    LoadMemberlist();
                    MessageBox.Show($"Member {member.MemberId} deleted successfully", "Removed Member");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
