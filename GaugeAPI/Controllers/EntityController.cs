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

namespace GaugeAPI.Controllers
{
    public class EntityController : ApiController
    {
        private GaugeEntities db = new GaugeEntities();

        // GET: api/Entity
        public IQueryable<Entity> GetEntities()
        {
            return db.Entities;
        }

        // GET: api/Entity/5
        [ResponseType(typeof(Entity))]
        public IHttpActionResult GetEntity(int id)
        {
            Entity entity = db.Entities.Find(id);
            if (entity == null)
            {
                return NotFound();
            }

            return Ok(entity);
        }

        // PUT: api/Entity/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutEntity(int id, Entity entity)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != entity.EntityID)
            {
                return BadRequest();
            }

            db.Entry(entity).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EntityExists(id))
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

        // POST: api/Entity
        [ResponseType(typeof(Entity))]
        public IHttpActionResult PostEntity(Entity entity)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Entities.Add(entity);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = entity.EntityID }, entity);
        }

        // DELETE: api/Entity/5
        [ResponseType(typeof(Entity))]
        public IHttpActionResult DeleteEntity(int id)
        {
            Entity entity = db.Entities.Find(id);
            if (entity == null)
            {
                return NotFound();
            }

            db.Entities.Remove(entity);
            db.SaveChanges();

            return Ok(entity);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool EntityExists(int id)
        {
            return db.Entities.Count(e => e.EntityID == id) > 0;
        }
    }
}