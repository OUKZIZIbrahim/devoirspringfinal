package devoir.oukziz.lanssari.services;

import java.util.List;

import devoir.oukziz.lanssari.models.Developpeur;
import devoir.oukziz.lanssari.models.Ticket;





public interface TicketService {
	public void ajouter(Ticket ticket);

	public List<Ticket> lesTickets();
	
	public List<Ticket> lesTicketsN();

	public void supprimer(int id_t);

	public void modifier(Ticket ticket);
	
	public void modifierr(Ticket ticket);

	public Ticket getTicket(int id_t);
	

}

