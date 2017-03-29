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
    public class ProductsCategories : Controller
    {
        private readonly ShaanFoodsContext _context;

        public ProductsCategories(ShaanFoodsContext context)
        {
            _context = context;    
        }

        // GET: ProductsCategories
        public async Task<IActionResult> Index(int productId)
        {
            if (productId.ToString() == null || productId.ToString().Trim() == "")
            {
                return RedirectToAction("../Home/Index.cshtml");
            }
            var shaanFoodsContext = _context.ProductsCategory.Where(x => x.ProductId == productId).Include(p => p.Product);
            return View(await shaanFoodsContext.ToListAsync());
            
        }

        // GET: ProductsCategories/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var productsCategory = await _context.ProductsCategory.SingleOrDefaultAsync(m => m.PCategoryId == id);
            if (productsCategory == null)
            {
                return NotFound();
            }

            return View(productsCategory);
        }

        // GET: ProductsCategories/Create
        public IActionResult Create()
        {
            ViewData["ProductId"] = new SelectList(_context.Products, "ProductId", "ProductName");
            return View();
        }

        // POST: ProductsCategories/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("PCategoryId,CategoryName,Description,Price,ProductId")] ProductsCategory productsCategory)
        {
            if (ModelState.IsValid)
            {
                _context.Add(productsCategory);
                await _context.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewData["ProductId"] = new SelectList(_context.Products, "ProductId", "ProductName", productsCategory.ProductId);
            return View(productsCategory);
        }

        // GET: ProductsCategories/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var productsCategory = await _context.ProductsCategory.SingleOrDefaultAsync(m => m.PCategoryId == id);
            if (productsCategory == null)
            {
                return NotFound();
            }
            ViewData["ProductId"] = new SelectList(_context.Products, "ProductId", "ProductName", productsCategory.ProductId);
            return View(productsCategory);
        }

        // POST: ProductsCategories/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("PCategoryId,CategoryName,Description,Price,ProductId")] ProductsCategory productsCategory)
        {
            if (id != productsCategory.PCategoryId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(productsCategory);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProductsCategoryExists(productsCategory.PCategoryId))
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
            ViewData["ProductId"] = new SelectList(_context.Products, "ProductId", "ProductName", productsCategory.ProductId);
            return View(productsCategory);
        }

        // GET: ProductsCategories/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var productsCategory = await _context.ProductsCategory.SingleOrDefaultAsync(m => m.PCategoryId == id);
            if (productsCategory == null)
            {
                return NotFound();
            }

            return View(productsCategory);
        }

        // POST: ProductsCategories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var productsCategory = await _context.ProductsCategory.SingleOrDefaultAsync(m => m.PCategoryId == id);
            _context.ProductsCategory.Remove(productsCategory);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        private bool ProductsCategoryExists(int id)
        {
            return _context.ProductsCategory.Any(e => e.PCategoryId == id);
        }
    }
}
