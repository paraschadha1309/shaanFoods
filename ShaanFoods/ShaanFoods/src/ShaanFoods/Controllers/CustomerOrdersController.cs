using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ShaanFoods.Models;

namespace ShaanFoods.Controllers
{
    public class CustomerOrdersController : Controller
    {
        private readonly ShaanFoodsContext _context;

        public CustomerOrdersController(ShaanFoodsContext context)
        {
            _context = context;    
        }

        // GET: CustomerOrders
        public async Task<IActionResult> Index()
        {
            return View(await _context.CustomerOrder.ToListAsync());
        }

        // GET: CustomerOrders/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var customerOrder = await _context.CustomerOrder.SingleOrDefaultAsync(m => m.OrderId == id);
            if (customerOrder == null)
            {
                return NotFound();
            }

            return View(customerOrder);
        }

        // GET: CustomerOrders/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: CustomerOrders/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("OrderId,CustomerName,CustomerPhone,Description,OrderStatus,PickupDate,PickupTime")] CustomerOrder customerOrder)
        {
            if (ModelState.IsValid)
            {
                _context.Add(customerOrder);
                await _context.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(customerOrder);
        }

        // GET: CustomerOrders/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var customerOrder = await _context.CustomerOrder.SingleOrDefaultAsync(m => m.OrderId == id);
            if (customerOrder == null)
            {
                return NotFound();
            }
            return View(customerOrder);
        }

        // POST: CustomerOrders/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("OrderId,CustomerName,CustomerPhone,Description,OrderStatus,PickupDate,PickupTime")] CustomerOrder customerOrder)
        {
            if (id != customerOrder.OrderId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(customerOrder);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CustomerOrderExists(customerOrder.OrderId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction("Index");
            }
            return View(customerOrder);
        }

        // GET: CustomerOrders/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var customerOrder = await _context.CustomerOrder.SingleOrDefaultAsync(m => m.OrderId == id);
            if (customerOrder == null)
            {
                return NotFound();
            }

            return View(customerOrder);
        }

        // POST: CustomerOrders/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var customerOrder = await _context.CustomerOrder.SingleOrDefaultAsync(m => m.OrderId == id);
            _context.CustomerOrder.Remove(customerOrder);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        private bool CustomerOrderExists(int id)
        {
            return _context.CustomerOrder.Any(e => e.OrderId == id);
        }
    }
}
