using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using GaugeAPI.Models;
using Newtonsoft.Json.Linq;

namespace GaugeAPI.Controllers
{
    public class ResultController : ApiController
    {
        private GaugeEntities db = new GaugeEntities();

        // GET: api/Result
        public IQueryable<Result> GetResult()
        {
            return db.Result;
        }

        // GET: api/Result/5
        [ResponseType(typeof(Result))]
        public IHttpActionResult GetResult(int id)
        {
            Result result = db.Result.Find(id);
            if (result == null)
            {
                return NotFound();
            }

            return Ok(result);
        }

        // PUT: api/Result/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutResult(int id, Result result)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != result.ResultId)
            {
                return BadRequest();
            }

            db.Entry(result).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ResultExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Result
        //[ResponseType(typeof(Result))]
        //public IHttpActionResult PostResult(Result result)
        //{
        //    if (!ModelState.IsValid)
        //    {
        //        return BadRequest(ModelState);
        //    }

        //    db.Result.Add(result);
        //    db.SaveChanges();

        //    return CreatedAtRoute("DefaultApi", new { id = result.ResultId }, result);
        //}
        public IHttpActionResult Post([FromBody]JArray jsonData)
        {
            // Convert the dynamic JObject to a DocumentDto object.
           List<Result> result = jsonData.ToObject<List<Result>>();

            // Use the given data to create the result.
            //string seperator = ",";
            //string data = string.Join(seperator, dto.Answer.ToList<string>());
            //string result = string.Format("Succesfully uploaded: {0}", data);
            foreach (var res in result)
            {
                db.Result.Add(res);
                

            }
            db.SaveChanges();

            // return CreatedAtRoute("DefaultApi", new { id = result.ResultId }, result);
            return Ok(result);
        }
        // DELETE: api/Result/5
        [ResponseType(typeof(Result))]
        public IHttpActionResult DeleteResult(int id)
        {
            Result result = db.Result.Find(id);
            if (result == null)
            {
                return NotFound();
            }

            db.Result.Remove(result);
            db.SaveChanges();

            return Ok(result);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ResultExists(int id)
        {
            return db.Result.Count(e => e.ResultId == id) > 0;
        }
    }
}