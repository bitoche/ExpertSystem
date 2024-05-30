package net.expertsystem.system.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.lang.Nullable;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "__dialog")
public class __Dialog {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    public Integer id;
    @Column(name = "title")
    public String title;
    @Column(name = "isend")
    public boolean isEnd;
    @Nullable
    @Column(name="helptext")
    public String helptext;
}
