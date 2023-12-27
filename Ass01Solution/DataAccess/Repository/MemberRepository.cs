using BusinessObject;
using System;
using System.Collections.Generic;
using System.Diagnostics.Metrics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repository
{
    public class MemberRepository : IMemberRepository
    {
        public void DeleteMember(MemberObject member)
        {
            MemberDAO.Instance.Remove(member);
        }

        public MemberObject GetMemberByEmailAndPassword(string Email, string Password)
        {
            return MemberDAO.Instance.GetMemberByEmailAndPassword(Email, Password);
        }

        public MemberObject GetMemberByID(int memberId)
        {
            return MemberDAO.Instance.GetMemberByID(memberId);
        }

        public IEnumerable<MemberObject> GetMembers()
        {
            return MemberDAO.Instance.GetMemberList();
        }

        public void InsertMember(MemberObject member)
        {
            MemberDAO.Instance.AddNew(member);
        }

        public bool Login(string username, string password)
        {
            return MemberDAO.Instance.Login(username, password);
        }

        public void UpdateMember(MemberObject member)
        {
            MemberDAO.Instance.Update(member);
        }
    }
}
