package br.com.site_filme.DAO;

import java.util.List;

public interface GenericDAO {
public Boolean cadastar (Object object);
public List<Object> listar();
public void excluir (int idObject);

    
} 


