﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using System.Data;
using System.Data.SqlClient;

using MVCLaboratorio.Utilerias;

namespace MVCLaboratorio.Controllers
{
    public class VideoController : Controller
    {
        //
        // GET: /Video/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(int idVideo, string titulo, int reproducciones, string url, string creador)
        {
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("@idVideo", idVideo));
            parametros.Add(new SqlParameter("@titulo", titulo));
            parametros.Add(new SqlParameter("@reproducciones", reproducciones));
            parametros.Add(new SqlParameter("@url", url));
            parametros.Add(new SqlParameter("@creador", creador));

            BaseHelper.ejecutarSentencia("spCrearVideo", CommandType.StoredProcedure, parametros);

            return RedirectToAction("Index", "Video");
        }

        public ActionResult Edit()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Edit(int idVideo, string titulo, int reproducciones, string url, string creador)
        {
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("@idVideo", idVideo));
            parametros.Add(new SqlParameter("@titulo", titulo));
            parametros.Add(new SqlParameter("@reproducciones", reproducciones));
            parametros.Add(new SqlParameter("@url", url));
            parametros.Add(new SqlParameter("@creador", creador));

            BaseHelper.ejecutarSentencia("spActualizarVideo", CommandType.StoredProcedure, parametros);

            return RedirectToAction("Index", "Video");

        }

        public ActionResult Delete()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Delete(int idVideo)
        {
            List<SqlParameter> parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("@idVideo", idVideo));

            BaseHelper.ejecutarSentencia("spEliminarVideo", CommandType.StoredProcedure, parametros);

            return RedirectToAction("Index", "Video");
        }

        public ActionResult Select()
        {
            ViewData["Video"] = BaseHelper.ejecutarConsulta("spMostrarVideo", CommandType.StoredProcedure);
            return View();
        }
    }
}
