package net.expertsystem.guitars.repository;

import net.expertsystem.guitars.models.__Answer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ARepository extends JpaRepository<__Answer, Integer> {
}
