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
    public class FeedbacksController : Controller
    {
        private readonly ShaanFoodsContext _context;

        public FeedbacksController(ShaanFoodsContext context)
        {
            _context = context;    
        }

        // GET: Feedbacks
        

        // GET: Feedbacks/Create
        public IActionResult Create()
        {
            ViewData["FeedId"] = new SelectList(_context.Feedback, "FeedId", "Email");
            return View();
        }

        // POST: Feedbacks/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("FeedId,Email,Feedback1,FirstName,LastName")] Feedback feedback)
        {
            if (ModelState.IsValid)
            {
                _context.Add(feedback);
                await _context.SaveChangesAsync();
                return Redirect("../Home/Index");                
            }
            return View(feedback);
        }

       
    }
}
