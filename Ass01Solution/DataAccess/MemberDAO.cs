using BusinessObject;
using DataAccess.Repository;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.ConstrainedExecution;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    internal class MemberDAO
    {
        private static MemberDAO instance = null;
        private static readonly object instanceLock = new object();
        private MemberDAO() { }

        public static MemberDAO Instance
        {
            get
            {
                lock (instanceLock)
                {
                    if (instance == null)
                    {
                        instance = new MemberDAO();
                    }
                    return instance;
                }
            }
        }

        public IEnumerable<MemberObject> GetMemberList()
        {
            List<MemberObject> members = new List<MemberObject>();
            try
            {
                var context = new FstoreContext();
                members = context.Members.ToList();
                if (members.Count <= 0)
                {
                    throw new NullReferenceException();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return members;
        }

        public MemberObject GetMemberByID(int memberId)
        {
            MemberObject member = null;
            try
            {
                var context = new FstoreContext();
                member = context.Members.Include(member => member.Orders).SingleOrDefault(member => member.MemberId == memberId);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return member;
        }

        public void AddNew(MemberObject member)
        {
            try
            {
                MemberObject _member = GetMemberByID(member.MemberId);
                if (_member == null)
                {
                    var context = new FstoreContext();
                    context.Members.Add(member);
                    context.SaveChanges();
                }
                else
                {
                    throw new Exception("The member is already exist.");
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void Update(MemberObject member)
        {
            try
            {
                MemberObject _member = GetMemberByID(member.MemberId);
                if (_member != null)
                {
                    var context = new FstoreContext();
                    context.Entry<MemberObject>(member).State = EntityState.Modified;
                    context.SaveChanges();
                }
                else
                {
                    throw new Exception("The member doesn't already exist.");
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void Remove(MemberObject member)
        {
            try
            {
                MemberObject _member = GetMemberByID(member.MemberId);
                if (_member != null)
                {
                    var context = new FstoreContext();
                    foreach(OrderObject order in _member.Orders)
                    {
                        OrderDetailObject orderDetail = context.OrderDetails.SingleOrDefault(od => od.OrderId == order.OrderId);
                        context.OrderDetails.Remove(orderDetail);
                        OrderObject _order = context.Orders.SingleOrDefault(o => o.OrderId == order.OrderId);
                        context.Orders.Remove(_order);
                    }
                    context.Members.Remove(member);
                    context.SaveChanges();
                }
                else
                {
                    throw new Exception("The member doesn't already exist.");
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public Boolean Login(String email, String password)
        {
            try
            {
                var config = new ConfigurationBuilder().AddJsonFile("appsettings.json").Build();
                string adminEmail = config.GetSection("DefaultAccount")["Email"];
                string adminPass = config.GetSection("DefaultAccount")["Password"];
                if(email == null || password == null || email == "" || password == "")
                {
                    throw new Exception("Invalid Email or Password");
                }
                else if(adminEmail != null && adminPass != null && email == adminEmail && password == adminPass)
                {
                    return true;
                }
                else
                {
                    MemberObject member = this.GetMemberByEmailAndPassword(email, password);
                    if(member == null)
                    {
                        throw new Exception("Wrong Email or Password");
                    }
                    return false;
                }
            }
            catch(Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public MemberObject GetMemberByEmailAndPassword(String Email, String Password)
        {
            MemberObject member = null;
            try
            {
                var context = new FstoreContext();
                member = context.Members.Include(member => member.Orders).SingleOrDefault(member => member.Email == Email && member.Password == Password);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return member;
        }
    }
}
