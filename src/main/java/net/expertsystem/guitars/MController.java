package net.expertsystem.guitars;

import lombok.AllArgsConstructor;
import lombok.Getter;
import net.expertsystem.guitars.models.__Answer;
import net.expertsystem.guitars.models.__Dialog;
import org.springframework.lang.Nullable;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Objects;

@org.springframework.stereotype.Controller
@AllArgsConstructor
public class MController {
    MService serv;
    @GetMapping("/start")
    public String index(Model model){
        var firstDialog = serv.getFirstDia();
        model.addAttribute("currDialog", firstDialog);
        var fDiaAnswers = serv.getDialogAnswers(firstDialog.id);
        model.addAttribute("currDialogAnswers", fDiaAnswers);
        model.addAttribute("fromDiaId", serv.getFirstDia().id);
        model.addAttribute("isStart", true);
        return "index";
    }
    @GetMapping("/ans/{fromDiaId}/{toDiaId}")
    public String byAns(@PathVariable int fromDiaId, @PathVariable int toDiaId, Model model){
        var currDialog = serv.getDialogById(toDiaId);
        model.addAttribute("currDialog", currDialog);
        var currDiaAnswers = serv.getDialogAnswers(currDialog.id);
        model.addAttribute("currDialogAnswers", currDiaAnswers);
        model.addAttribute("fromDiaId", fromDiaId);
        model.addAttribute("prevDias", serv.getPrevDia(toDiaId));
        model.addAttribute("isStart", false);

        return "index";
    }
    @GetMapping("/addans/{fromDiaId}/{dId}/")
    public String addAnsToDia(@PathVariable int fromDiaId, @PathVariable int dId, Model model){
        if(fromDiaId != dId){
            model.addAttribute("currDia", serv.getDialogById(dId));
            model.addAttribute("fromDiaId", fromDiaId);
            model.addAttribute("allDiaList", serv.getAllDia());
            model.addAttribute("transitionAnswer", serv.findAnsByTransition(fromDiaId, dId));
            return "addAnswer";
        }
        return "redirect:/start";
    }
    @PostMapping("/addAnswerForm/transition={fromDiaId}to{dId}")
    public String addAnsForm(@PathVariable int fromDiaId, @PathVariable int dId, String titlea, String currDiaId, String nextDiaId, @Nullable String title, @Nullable Boolean isenddia, @Nullable String helptext) {
        __Answer a = new __Answer();
        a.currDialog = serv.getDialogById(Integer.parseInt(currDiaId));
        __Dialog n;
        if (Objects.equals(nextDiaId, "new")) {
            n = new __Dialog();
            n.isEnd = Boolean.TRUE.equals(isenddia);
            n.title = title;
            n.helptext = helptext;
            serv.createDialog(n.title, n.isEnd, n.helptext);
            a.nextDialog = serv.getLastDialog();
        }
        else a.nextDialog = serv.getDialogById(Integer.parseInt(nextDiaId));
        a.title = titlea;
        serv.createAnswer(a.title, a.currDialog.id, a.nextDialog.id);
        var retstr = "redirect:/ans/"+fromDiaId+"/"+dId;
        return retstr;
    }
    @PostMapping("/addDialogForm")
    public String addDiaForm(String title, String isend, String helptext){
        serv.createDialog(title, Boolean.parseBoolean(isend), helptext);
        return "redirect:/start";
    }
    @GetMapping("/adddia/")
    public String addDiaPage(){
        return "addDialog";
    }
    @GetMapping("/")
    public String redToStart(){
        return "slash";
    }
    @GetMapping("/addhelp/{diaid}/{fromdiaid}")
    public String openHelpAddPage(@PathVariable int diaid, Model model, @PathVariable int fromdiaid){
        model.addAttribute("currdia", serv.findDialogById(diaid));
        model.addAttribute("fromdiaid", fromdiaid);
        return "addHelp";
    }
    @PostMapping("/addhelptext/{addto_diaid}/{fromdiaid}")
    public String addHelpToDia(@PathVariable int addto_diaid, String helptext, @PathVariable int fromdiaid){
        serv.updateDiaHelp(addto_diaid, helptext);
        return "redirect:/ans/"+fromdiaid+"/"+addto_diaid;
    }
    @PostMapping("/ans/fromInput/{fromdiaid}/{currdiaid}")
    public String gotoDia(String diaId,@PathVariable int fromdiaid, @PathVariable int currdiaid, Model model){
        if (serv.getAllDia().stream().anyMatch(d->d.id==Integer.parseInt(diaId))){
            return "redirect:/ans/"+diaId+"/"+diaId;
        }
        var currDialog = serv.getDialogById(currdiaid);
        model.addAttribute("currDialog", currDialog);
        var currDiaAnswers = serv.getDialogAnswers(currDialog.id);
        model.addAttribute("currDialogAnswers", currDiaAnswers);
        model.addAttribute("fromDiaId", fromdiaid);
        model.addAttribute("prevDias", serv.getPrevDia(currdiaid));
        model.addAttribute("isStart", false);
        model.addAttribute("isError", true);
        return "index";
    }
}
