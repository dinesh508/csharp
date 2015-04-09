using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Calculator.CheckBook;
using System.Linq;
using System.Collections.ObjectModel;

namespace CalculatorTests
{
    [TestClass]
    public class CheckBookTest
    {
        [TestMethod]
        public void FillsUpProperly()
        {
            var ob = new CheckBookVM();

            Assert.IsNull(ob.Transactions);

            ob.Fill();

            Assert.AreEqual(12, ob.Transactions.Count);
        }

        [TestMethod]
        public void CountofEqualsMoshe()
        {
            var ob = new CheckBookVM();
            ob.Fill();

            var count = ob.Transactions.Where( t => t.Payee == "Moshe" ).Count();

            Assert.AreEqual(4, count);
        }

        [TestMethod]
        public void SumOfMoneySpentOnFood()
        {
            var ob = new CheckBookVM();
            ob.Fill();

            var category = "Food";

            var food = ob.Transactions.Where(t=> t.Tag == category );

            var total = food.Sum(t => t.Amount);

            Assert.AreEqual(261, total);

        }

        [TestMethod]
        public void Group()
        {
            var ob = new CheckBookVM();
            ob.Fill();

            var total = ob.Transactions.GroupBy(t => t.Tag).Select(g => new { g.Key, Sum=g.Sum( t=> t.Amount ) });

            Assert.AreEqual(261, total.First().Sum);
            Assert.AreEqual(300, total.Last().Sum);
            
        }

 /****************************************Unit Test 1***********************************************************/

        [TestMethod]
        public void AvgTransactionForEachTag()
        {
             var ob = new CheckBookVM();
            ob.Fill();

            var total = ob.Transactions.GroupBy(t => t.Tag).Select(g => new { g.Key, Avg=g.Average( t=> t.Amount ) });

            Assert.AreEqual(32.625, total.First().Avg);
            Assert.AreEqual(75, total.Last().Avg);
        }

   /*******************************************Unit Test 2***********************************************************/
        [TestMethod]
        public void PayForEachPayee()
        {
            var ob = new CheckBookVM();
            ob.Fill();

            var total = ob.Transactions.GroupBy(t => t.Payee).Select(g => new { g.Key, Sum=g.Sum( t=> t.Amount ) });
            var atotal=total.ToList();
            Assert.AreEqual(130, atotal.First().Sum);
            Assert.AreEqual(300, atotal[1].Sum);
            Assert.AreEqual(131, atotal.Last().Sum);
            //Assert.AreEqual();
            
        }

  /*******************************************Unit Test 3***********************************************************/
        [TestMethod]
        public void PayForEachPayeeForFood()
        {
            var ob = new CheckBookVM();
            ob.Fill();
            var category = "Food";
            var totalPay = ob.Transactions.Where(t => t.Tag == category).GroupBy(t => new { t.Payee }).Select((g => new { g.Key, Sum = g.Sum(t => t.Amount) })).ToList();
            Assert.AreEqual(130, totalPay[0].Sum);
            //Assert.AreEqual(0, atotal[1].Sum);
            Assert.AreEqual(131, totalPay[1].Sum);
            
        }

/****************************************Unit Test 4***********************************************************/
        [TestMethod]
        public void ListTransactions()
        {
           var ob = new CheckBookVM();
            ob.Fill();
            var transaction=ob.Transactions;
            var list = ob.Transactions.Where(t => t.Date.ToString("d") == DateTime.Parse("4/6/2015").ToString("d"));

            Assert.AreEqual(transaction.ElementAt(1), list.ElementAt(0));
            Assert.AreEqual(transaction.ElementAt(7), list.ElementAt(1));
        }

 /****************************************Unit Test 5***********************************************************/

        [TestMethod]
        public void ListDates()
        {
            var ob = new CheckBookVM();
            ob.Fill();
            var CheckingDates = ob.Transactions.Where(t=>t.Account=="Checking").Select(t=>t.Date.Date.ToString("d"));
            var CreditDates = ob.Transactions.Where(t => t.Account == "Credit").Select(t => t.Date.Date.ToString("d"));

            Assert.AreEqual(DateTime.Now.AddDays(-1).Date.ToString("d"), CheckingDates.ElementAt(0));
            Assert.AreEqual(DateTime.Now.AddDays(-1).Date.ToString("d"), CreditDates.ElementAt(0));
        }

  /****************************************Unit Test 6***********************************************************/

        [TestMethod]
        public void MaxAccountOnAutoExpenses()
        {
             var ob = new CheckBookVM();
            ob.Fill();
            var category = "Auto";
            var checkingAcct = ob.Transactions.Where(t=>t.Account=="Checking" && t.Tag==category).Sum(t=>t.Amount) ;
            var creditAcct = ob.Transactions.Where(t => t.Account == "Credit" && t.Tag == category).Sum(t => t.Amount);
            var checkingAcct1 = ob.Transactions.Where(t=> t.Tag == category).Sum(t => t.Amount);
            Assert.AreEqual(checkingAcct,creditAcct);
        }

  /****************************************Unit Test 7***********************************************************/
        [TestMethod]
        public void ListNumberOfTransactionsForEachAccount()
        {
            var ob = new CheckBookVM();
            ob.Fill();
            var checkingCount = ob.Transactions.Where(t => t.Account == "Checking" && t.Date.ToString("d") == DateTime.Parse("4/6/2015").ToString("d")).Count();
            var creditCount = ob.Transactions.Where(t => t.Account == "Credit" && t.Date > DateTime.Parse("2015-4-5") && t.Date.ToString("d") == DateTime.Parse("4/6/2015").ToString("d")).Count();
            Assert.AreEqual(1, checkingCount);
            Assert.AreEqual(1, creditCount);

        }
    }

}
