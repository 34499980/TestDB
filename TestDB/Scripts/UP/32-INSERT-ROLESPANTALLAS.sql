INSERT INTO RolesPantallas(IdRol, IdPantalla,FechaDesde, FechaHasta)
  select IdRol,22,GetDate(),'99991231'
  from RolesPantallas R
  where R.idPantalla = 19
  AND NOT EXISTS(SELECT TOP 1 1
				From RolesPantallas RP
				WHERE R.IdRol = RP.IdRol
					AND RP.IdPantalla = 22
					)
					
					INSERT INTO RolesPantallas(IdRol, IdPantalla,FechaDesde, FechaHasta)
  select IdRol,23,GetDate(),'99991231'
  from RolesPantallas R
  where R.idPantalla = 19
  AND NOT EXISTS(SELECT TOP 1 1
				From RolesPantallas RP
				WHERE R.IdRol = RP.IdRol
					AND RP.IdPantalla = 23
					)
					
					INSERT INTO RolesPantallas(IdRol, IdPantalla,FechaDesde, FechaHasta)
  select IdRol,24,GetDate(),'99991231'
  from RolesPantallas R
  where R.idPantalla = 19
  AND NOT EXISTS(SELECT TOP 1 1
				From RolesPantallas RP
				WHERE R.IdRol = RP.IdRol
					AND RP.IdPantalla = 24
					)