@allRoutes = "A-B:5 ,B-C:4 ,C-D:8 ,D-E:6 ,A-D:5 ,C-E:2 ,E-B:3 ,A-E:7".split(',')  #allRoutes wird zu einem Array gesplitted
@route = {}  #leerer Hash 

0.upto(@allRoutes.length - 1) do |i| #Schleife durchläuft das Array
  tmp = @allRoutes[i].split(':')   #Strecke und Streckenlaenge wird aufgesplittet und im Array tmp gespeichert
  @route[tmp[0]] = tmp[1]          #@route-hash wird mit Werten gefüllt. z.B.: @route["A-B"] = 5
end

def routeBerechnen(myRoute)         #Methode erhält String in Form von "A-B-C"
  summe = 0
  myRoute = myRoute.split('-')      #myRoute wird in ein Array mit den einzelnen Knoten umgewandelt z.B.: "A" "B" "C"
  0.upto(myRoute.length - 2) do |i|

    tmp = @route[myRoute[i] + '-' + myRoute[i+1]].to_i    #Es wird geschaut ob es eine Strecke A-B gibt
    if(tmp == 0)                                          # wenn nicht -->
      tmp = @route[myRoute[i+1] + '-' + myRoute[i]].to_i  #--> wird geschaut ob es eine Strecke B-A gibt
        if(tmp == 0)                                      # wenn nicht -->
          return "No such route"                          #--> wird "No such route" ausgegeben. Durch das return wird die Methode bei diesem Punkt verlassen
        end
    end
     summe += tmp                  #Die einzelnen Laengen werden aufsummiert.
  end
  return summe                     #summe wird ausgegeben
end

puts routeBerechnen("A-D-C")