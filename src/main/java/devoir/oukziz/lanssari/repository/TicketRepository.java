package devoir.oukziz.lanssari.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import devoir.oukziz.lanssari.models.Ticket;





public interface TicketRepository extends JpaRepository<Ticket, Integer> {
	List<Ticket> findByAttribue(Boolean i);
}
