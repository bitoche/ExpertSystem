package net.expertsystem.system;

import lombok.AllArgsConstructor;
import net.expertsystem.system.models.__Answer;
import net.expertsystem.system.models.__Dialog;
import net.expertsystem.system.repository.ARepository;
import net.expertsystem.system.repository.DRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@org.springframework.stereotype.Service
@AllArgsConstructor

public class MService {
    private ARepository aRepos;
    private DRepository dRepos;

    public List<__Answer> getAllAns(){
        return aRepos.findAll();
    }
    public List<__Dialog> getPrevDia(int currDiaId){
        var byAnswers = getAllAns().stream().filter(a-> {
            assert a.nextDialog != null;
            return a.nextDialog.id == currDiaId;
        }).toList();
        List<__Dialog> fromDias = new ArrayList<>();
        for (__Answer a:
             byAnswers) {
            if (getAllDia().stream().anyMatch(d-> Objects.equals(d.id, a.currDialog.id))){
                fromDias.add(getAllDia().stream().filter(d-> Objects.equals(d.id, a.currDialog.id)).findFirst().get());
            } else return null;
        }
        return fromDias;
    }
    public __Dialog getFirstDia(){
        for (__Dialog d:
                dRepos.findAll()) {
            int countPrev = 0;
            for (__Answer a:
                    aRepos.findAll()) {
                assert a.nextDialog != null;
                if(Objects.equals(a.nextDialog.id, d.id)){
                    countPrev++;
                    break;
                }
            }
            if(countPrev==0) return d;
        }
        return null;
    }
    public List<__Dialog> getAllDia(){
        var all = dRepos.findAll();
        return all;

    }
    public void createDialog(String title, boolean isEnd, String helptext){
        var e = new __Dialog();
        e.isEnd = isEnd;
        e.title = title;
        e.helptext = helptext;
        dRepos.save(e);
    }
    public void createAnswer(String title, int currdialogid, int nextdialogid){
        var a = new __Answer();
        a.title = title;
        if(dRepos.findById(currdialogid).isPresent()) a.currDialog = dRepos.findById(currdialogid).get();
        if(dRepos.findById(nextdialogid).isPresent()) a.nextDialog = dRepos.findById(nextdialogid).get();
        aRepos.save(a);
    }
    public List<__Answer> getDialogAnswers(int dId){
        return aRepos.findAll().stream().filter(a->a.currDialog.id==dId).toList();
    }
    public __Dialog getDialogById(int id){ return dRepos.findById(id).get();}
    public __Dialog getLastDialog(){
        var count = dRepos.findAll().size();
        return dRepos.findAll().get(count-1);
    }
    public __Answer findAnsByTransition(int fromId, int toId){
        List<__Answer> allAnsFrom = aRepos.findAll().stream().filter(a->a.currDialog.id==fromId).toList();
        var ans = allAnsFrom.stream().filter(a-> {
            assert a.nextDialog != null;
            return a.nextDialog.id==toId;
        }).findFirst();
        return ans.get();
    }
    public __Dialog findDialogById(int id){return dRepos.findById(id).get();}
    public void updateDiaHelp(int dialogid, String helptext){
        __Dialog dialog1 = dRepos.findById(dialogid).orElseThrow(() -> new RuntimeException("__Dialog not found."));
        dialog1.setHelptext(helptext);
        dRepos.save(dialog1);
    }
}
