/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package corpus.sinhala.crawler.controller.webui.beans;

/**
 *
 * @author dimuthuupeksha
 */
public class DateRange {
    public int sYear,sMonth,sDay,eYear,eMonth,eDay;

    public DateRange(int sYear, int sMonth, int sDay) {
        this.sYear = sYear;
        this.sMonth = sMonth;
        this.sDay = sDay;
        this.eYear = sYear;
        this.eMonth = sMonth;
        this.eDay = sDay;
    }
    
    public boolean nextDay(int year,int month,int day){
        if(year==eYear+1){
            if(eMonth==12&&eDay==31&&month==1&&day==1){
                return true;
            }
        }else if(year==eYear){
            if(month==eMonth+1){
                if(eMonth==1){
                    if(eDay==31&&day==1){
                        return true;
                    }
                }else if(eMonth==2){
                    if(year%4==0){
                        if(eDay==29&&day==1){
                            return true;
                        }
                    }else{
                        if(eDay==28&&day==1){
                            return true;
                        }
                    }
                }else if(eMonth==3){
                    if(eDay==31&&day==1){
                        return true;
                    }
                }else if(eMonth==4){
                    if(eDay==30&&day==1){
                        return true;
                    }
                }else if(eMonth==5){
                    if(eDay==31&&day==1){
                        return true;
                    }
                }else if(eMonth==6){
                    if(eDay==30&&day==1){
                        return true;
                    }
                }else if(eMonth==7){
                    if(eDay==31&&day==1){
                        return true;
                    }
                }else if(eMonth==8){
                    if(eDay==31&&day==1){
                        return true;
                    }
                }else if(eMonth==9){
                    if(eDay==30&&day==1){
                        return true;
                    }
                }else if(eMonth==10){
                    if(eDay==31&&day==1){
                        return true;
                    }
                }else if(eMonth==11){
                    if(eDay==31&&day==1){
                        return true;
                    }
                }
            }else if(month==eMonth){
                if(day==eDay+1){
                    return true;
                }
            }
        }
        return false;
    }
}
