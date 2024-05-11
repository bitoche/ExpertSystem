package net.expertsystem.guitars.repository;

import net.expertsystem.guitars.models.__Dialog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface DRepository extends JpaRepository<__Dialog, Integer> {
}
