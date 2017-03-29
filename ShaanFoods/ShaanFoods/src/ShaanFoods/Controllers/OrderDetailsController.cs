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
    public class OrderDetailsController : Controller
    {
        private readonly ShaanFoodsContext _context;

        public OrderDetailsController(ShaanFoodsContext context)
        {
            _context = context;    
        }

        // GET: OrderDetails
        public async Task<IActionResult> Index()
        {
            var shaanFoodsContext = _context.OrderDetails.Include(o => o.Order).Include(o => o.PCategory);
            return View(await shaanFoodsContext.ToListAsync());
        }

        // GET: OrderDetails/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var orderDetails = await _context.OrderDetails.SingleOrDefaultAsync(m => m.OrderDetailsId == id);
            if (orderDetails == null)
            {
                return NotFound();
            }

            return View(orderDetails);
        }

        // GET: OrderDetails/Create
        public IActionResult Create()
        {
            ViewData["OrderId"] = new SelectList(_context.CustomerOrder, "OrderId", "CustomerName");
            ViewData["PCategoryId"] = new SelectList(_context.ProductsCategory, "PCategoryId", "CategoryName");
            return View();
        }

        // POST: OrderDetails/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("OrderDetailsId,OrderId,OrderPrice,OrderQuantity,OrderWeight,PCategoryId")] OrderDetails orderDetails)
        {
            if (ModelState.IsValid)
            {
                _context.Add(orderDetails);
                await _context.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewData["OrderId"] = new SelectList(_context.CustomerOrder, "OrderId", "CustomerName", orderDetails.OrderId);
            ViewData["PCategoryId"] = new SelectList(_context.ProductsCategory, "PCategoryId", "CategoryName", orderDetails.PCategoryId);
            return View(orderDetails);
        }

        // GET: OrderDetails/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var orderDetails = await _context.OrderDetails.SingleOrDefaultAsync(m => m.OrderDetailsId == id);
            if (orderDetails == null)
            {
                return NotFound();
            }
            ViewData["OrderId"] = new SelectList(_context.CustomerOrder, "OrderId", "CustomerName", orderDetails.OrderId);
            ViewData["PCategoryId"] = new SelectList(_context.ProductsCategory, "PCategoryId", "CategoryName", orderDetails.PCategoryId);
            return View(orderDetails);
        }

        // POST: OrderDetails/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("OrderDetailsId,OrderId,OrderPrice,OrderQuantity,OrderWeight,PCategoryId")] OrderDetails orderDetails)
        {
            if (id != orderDetails.OrderDetailsId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(orderDetails);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!OrderDetailsExists(orderDetails.OrderDetailsId))
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
            ViewData["OrderId"] = new SelectList(_context.CustomerOrder, "OrderId", "CustomerName", orderDetails.OrderId);
            ViewData["PCategoryId"] = new SelectList(_context.ProductsCategory, "PCategoryId", "CategoryName", orderDetails.PCategoryId);
            return View(orderDetails);
        }

        // GET: OrderDetails/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var orderDetails = await _context.OrderDetails.SingleOrDefaultAsync(m => m.OrderDetailsId == id);
            if (orderDetails == null)
            {
                return NotFound();
            }

            return View(orderDetails);
        }

        // POST: OrderDetails/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var orderDetails = await _context.OrderDetails.SingleOrDefaultAsync(m => m.OrderDetailsId == id);
            _context.OrderDetails.Remove(orderDetails);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        private bool OrderDetailsExists(int id)
        {
            return _context.OrderDetails.Any(e => e.OrderDetailsId == id);
        }
    }
}
