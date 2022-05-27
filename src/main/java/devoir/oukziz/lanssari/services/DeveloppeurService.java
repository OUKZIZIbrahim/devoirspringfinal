package devoir.oukziz.lanssari.services;

import java.util.List;

import devoir.oukziz.lanssari.models.Developpeur;
import devoir.oukziz.lanssari.models.Ticket;

public interface DeveloppeurService {
	
	public List<Developpeur> lesDeveloppeurs();

	public void affecterTicket(int idDev,int idTicjet);
	
}
