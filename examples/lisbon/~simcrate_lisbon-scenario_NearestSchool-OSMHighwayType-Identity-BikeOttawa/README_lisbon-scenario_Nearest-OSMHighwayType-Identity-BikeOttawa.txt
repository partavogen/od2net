# ~simcrate_lisbon-scenario1 

In this scenario I aim to simulate the results for the youngest group of students
in this study (1st through 6th grade), incurring in stricter LTS, distance and 
slope requirements. 

I use every point to nearest destination for two main reasons: 1) use the previously
created random points (I hope to re-run this simulation with real, anonymized data 
in the near future) and because students in this age group are usually located closer
to their education facilities when compared to older students.

The cost function is based on previously set weights related to the OSM "highway"
tag of a given segment. The "highway" tag intends to characterize the type of 
street/road and has options such as  the general tags of "motorway", "trunk", 
"primary", "residential", etc and more specialized ones like "footway", "cycleway",
"service", etc. FUTURE: CUSTOM FUNCTION INCLUDING SLOPE, BIKE TYPE, LTS, MAXDIST

For the uptake param we use "Identity" in order to set a baseline that will be used to
compare against other uptake scenarios. 

LTS is calculated with the standard "BikeOttawa" method/param. I also intend to 
discuss possible LTS customization with @temospena. FUTURE: CUSTOM ENMAC SCENARIOS

~~~~~~~~~~~~ DUMP (IGNORE) ~~~~~~~~~~~~
In this scenario I aim to simulate the results for the youngest group of students
in this study (1st through 6th grade), incurring in stricter LTS, distance and 
slope requirements. 
The cost function in customized and includes segment slopes. I achieved this by the
usage of the bash commands (I have to thank Dustin for the helpful link left on the 
issues list). 
GoDutchPCT was the chosen uptake model. If possible and relevant, I'd like to
create a custom uptake model for Portugal in the near future.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


SUMMARY:

     config.json     - pattern: "FromEveryOriginToNearestDestination"
		       cost   : "ExternalCommand": "python3 setup.py"
		       uptake : "GoDutchPCT"
		       lts    : "BikeOttawa"
		       
      setup.py       - 
      
      
 cost_lisbon-sc1.py  -
 
 
uptake_lisbon-sc1.py - 


  lts_lisbon-sc1.py  - ear future) and because students in this age group are usually located closer to their education facilities when compared to older students.

The cost function in customized and includes segment slopes. I achieved this by the usage of the bash commands (I have to thank Dustin for the helpful link left on the issues list). 

GoDutchPCT was the chosen uptake model. If possible and relevant, I'd like to create a custom uptake model# ~simcrate_lisbon-scenario1 

In this scenario I aim to simulate the results for the youngest group of students in this study (1st through 6th grade), incurring in stricter LTS, distance and slope requirements. 

I use every point to nearest destination for two main reasons: 1) use the previously created random points (I hope to re-run this simulation with real, anonymized data in the near future) and because students in this age group are usually located closer to their education facilities when compared to older students.

The cost function in customized and includes segment slopes. I achieved this by the usage of the bash commands (I have to thank Dustin for the helpful link left on the issues list). 

GoDutchPCT was the chosen uptake model. If possible and relevant, I'd like to create a custom uptake model for Portugal in the near future.

LTS is calculated with the standard "BikeOttawa" method/param. I also intend to discuss possible LTS customization with @temospena.

SUMMARY:

     config.json     - pattern: "FromEveryOriginToNearestDestination"
		       cost   :
		       uptake :
		       lts    :
		       
      setup.py       - 
      
      
 cost_lisbon-sc1.py  -
 
 
uptake_lisbon-sc1.py - 


  lts_lisbon-sc1.py  -  for Portugal in the near future.

LTS is calculated with the standard "BikeOttawa" method/param. I also intend to discuss possible LTS customization with @temospena.



SUMMARY:

     config.json     - pattern: "FromEveryOriginToNearestDestination"
		       cost   :
		       uptake :
		       lts    :
		       
      setup.py       - 
      
      
 cost_lisbon-sc1.py  -
 
 
uptake_lisbon-sc1.py - 


  lts_lisbon-sc1.py  - 