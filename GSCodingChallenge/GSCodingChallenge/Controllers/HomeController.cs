using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Microsoft.EntityFrameworkCore;
using GSCodingChallenge.Data;
using GSCodingChallenge.Models;

namespace GSCodingChallenge.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private CodingChallengeDbContext _context;

        public HomeController(ILogger<HomeController> logger, CodingChallengeDbContext context)
        {
            _context = context;
            _logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult GetUsers()
        {
            return new JsonResult(_context.User.ToList());
        }
        public IActionResult GetProjects(int id)
        {
            return new JsonResult(_context.Project.Where(x => x.UserProject.Any(y => y.UserId == id)).Select(project => new {
                Id = project.Id,
                StartDate = project.StartDate.ToString("yyyy-MM-dd"),
                EndDate = project.EndDate.ToString("yyyy-MM-dd"),
                Credits = project.Credits,
                Status = _context.UserProject.FirstOrDefault(x => x.ProjectId == project.Id && x.UserId == id).IsActive,
                AssignedDate = _context.UserProject.FirstOrDefault(x => x.ProjectId == project.Id && x.UserId == id).AssignedDate
            }));
        }

        public IActionResult GetUserProjects(int id)
        {
            var userProjectData = _context.UserProject.Where(x => x.UserId==id).ToList();
            return new JsonResult(userProjectData);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        } 
    }
}
