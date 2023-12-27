using BusinessObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.ConstrainedExecution;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repository
{
    public interface IMemberRepository
    {
        IEnumerable<MemberObject> GetMembers();
        MemberObject GetMemberByID(int memberId);
        void InsertMember(MemberObject member);
        void DeleteMember(MemberObject member);
        void UpdateMember(MemberObject member);
        Boolean Login(string username, string password);
        MemberObject GetMemberByEmailAndPassword(String Email, String Password);
    }
}
