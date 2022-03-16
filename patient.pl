/*
 * Tested on- http://swish.swi-prolog.org/
*/

:- dynamic yes/1,no/1.
start :- hypothesis(Disease),
      write('The plant may have: '),
      write(Disease),
      nl.

hypothesis("Bacterial leaf blight and stalk rot")   :- 
    has("Discoloration of leafs"),
	has("Leaf sheath"),
	has("Nodes of the stalk").
  
hypothesis("Halcus spot")  :-
    has("Dark green lesions near the tips of lower leafs").

hypothesis("Seed Rot")   :- 
    has("Stunting"),
	has("Discoloration"),
	has("Damping off"),
    has("Root rot").

hypothesis("Late wilt")   :- 
    has("Relatively rapid wilting of maize plants before tasselling and until shortly before maturity").

hypothesis("Horse Tooth")   :- 
    has("Sclerotia that replace the kernels are white to cream"),
	has("Mature sclerotia are comma-shaped"),
	has("Sclerotia beneath the husks are lighter in color").

hypothesis("Cercospora leaf spot")   :- 
    has("Small necrotic spots with halos"),
	has("Rectangular lesions"),
	has("Gray to brown color").

hypothesis("Physalospora ear rot")   :- 
    has("Dark brown-to-black 'fetty' mold growth on all parts of the ear"),
	has("Mildy infected ears may have a few blackened kernels near base of the ear").

hypothesis("Black Spot")   :- 
    has("Small yellow-brown spots on either side of the leaf").

hypothesis("Charcoal Rot")   :- 
    has("Upper leaves of the corn will dry out"),
	has("Shreded stalks"),
	has("Pith completly ratted, leaving only stringy vascular strands intact").



  
  

hypothesis(unknown) :-
    write("Unable to find a disease in database"),
    nl.

ask(Question) :-
    write('Does the plant have the following symptom: '),
    write(Question),
    write('? '),
    read(Response),
    nl,
    ( (Response == yes ; Response == y)
      ->
       assert(yes(Question)) ;
       assert(no(Question)), fail
	).

has(S) :-
   (yes(S) 
    ->
    true ;
    (no(S)
     ->
     fail ;
     ask(S))).