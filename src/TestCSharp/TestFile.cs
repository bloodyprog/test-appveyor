using System;
using NUnit.Framework;

namespace TestCSharp
{
    [TestFixture]
    public class Fixture
    {
        [Test]
        public void TestCase_A()
        {
            Assert.IsTrue(true);
        }

        [Test]
        public void TestCase_B()
        {
            Assert.IsTrue(4 == 2 + 2);
        }

        [Test]
        public void TestCase_C()
        {
            Assert.IsTrue(true);
        }
    }
}
