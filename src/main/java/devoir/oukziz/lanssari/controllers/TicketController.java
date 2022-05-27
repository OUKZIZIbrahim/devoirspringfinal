package devoir.oukziz.lanssari.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import devoir.oukziz.lanssari.models.Developpeur;
import devoir.oukziz.lanssari.models.Ticket;
import devoir.oukziz.lanssari.services.TicketService;




@Controller
public class TicketController {
	
	@Autowired
	private TicketService ticketService;
	
	@GetMapping("/")
	public String liste(Model m) {
		m.addAttribute("tickets",ticketService.lesTickets());
		return "tickets/liste";
	}
	
	@GetMapping("/listeAdmin")
	public String listeAdmin(Model m) {
		m.addAttribute("tickets",ticketService.lesTicketsN());
		return "tickets/listeadmin";
	}
	
	@GetMapping("/add")
	public String ajout(Model model) {
		Ticket p=new Ticket();
		model.addAttribute("ticket",p);
		return "tickets/ajout";
	}
	

	
	@PostMapping("add")
	public String enregistrer(@ModelAttribute("ticket")Ticket ticket) {
		Ticket p=ticketService.getTicket(ticket.getId_t());
		if(p!=null)
			ticketService.modifier(ticket);
		else
			ticketService.ajouter(ticket);
		return "redirect:/";
	}
	
	@PostMapping("addd")
	public String enregistrerr(@ModelAttribute("ticket")Ticket ticket) {
		Ticket p=ticketService.getTicket(ticket.getId_t());
		if(p!=null)
			ticketService.modifierr(ticket);
		return "redirect:/";
	}

	@GetMapping("/edit/{id}")
	public String modifier(@PathVariable int id, Model model) {
		Ticket p=ticketService.getTicket(id);
		if(p!=null) {
			model.addAttribute("ticket", p);
			return "tickets/ajout";
		}
		return "redirect:/tickets";
	}
	
	@GetMapping("/editt/{id}")
	public String modifierr(@PathVariable int id, Model model) {
		Ticket p=ticketService.getTicket(id);
		if(p!=null) {
			model.addAttribute("ticket", p);
			return "tickets/ajoutt";
		}
		return "redirect:/tickets";
	}
	
	@GetMapping("/delete/{id}")
	public String suppr(@PathVariable int id) {
		ticketService.supprimer(id);
		return "redirect:/";
	}
	

}
