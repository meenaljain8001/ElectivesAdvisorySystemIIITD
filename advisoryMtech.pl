% Introductory of Elective Advisory System.
welcome :-
    write('Electives Advisory System'),nl,
    write('Select your M.Tech Program:'),nl,
    write('1.CSE'),tab(4),write('2.CB'),nl,
    write('Select the choice number followed by dot:'),nl,
    read(Electives),predict(Electives).


% Creating a dynamic fact named as query taking two parameters.
:-dynamic(query/2).

%Concatenate two lists into a single list.
append_lists([], List, List).
append_lists([E | L1], L2, [E | L3]) :- append_lists(L1, L2, L3).

% Iterating the list one by one to print
print_list([]).
print_list([H|T]) :- writeln(H), print_list(T). %Recursion is used here


% Predict the electives for a particular M.Tech Program
predict(Electives):-
    electives(Electives).


% MTech CSE elective
electives(1):-
    write('What is your area of interest?'),nl,
    write('1.Machine Learning and AI Technologies'),tab(4),write('2.Data and Information Management System'),tab(4),write('3.Networking ad Wireless technology such as Mobiles'),nl
    ,read(Interest),nl,
    question(further_studies,FS),nl,
    question(prior_project,PP),nl,
    question(rate_algo,RA),nl,
    question(theory_or_practical,TP),nl,
    area_interest(Interest,FS,PP,RA,TP).

% MTech CB elective
electives(2):-
    write('What is your Area of interest?'),nl,
    write('1.Biology and Mathematics'),tab(4),write('2.Programming and DS and Mathematics'),tab(4),write('3.Biology and Programming and DS'),nl,
    read(Area_interest),nl,
    question(theory_or_practical,TP),nl,
    question(rate_maths,RM),nl,
    question(interest_other,IO),nl,
    question(project_interest,PI),nl,
    interest(Area_interest,C,TP,RM,IO,PI),nl,nl,
    write(C),nl,
    write('Core Courses are: '),nl,
    write('1.Foundations of Modern Biology'),nl,
    write('2.Algorithms in Computational Biology '),nl,
    write('3.Cell Biology and Biochemistry '),nl,
    write('4.Introduction to Mathematical Biology '),nl.


% In CB, interest to find the electives as per user's input choice.
% Interest in Bio and Maths
interest(1, C,TP,IO,PI,_):-
    TP=:=2,
    IO=:=1,
    PI=:=1,
    C='You like practical application and also interested in other subject than CB and interested in projects.\nYou should take from electives and other CSE courses as follows \n 1.Machine Learning for Biomedical Applications \n2.Machine Learning \n3.Introduction to Quantitative Biology \n 4.Introduction to Computational Neuroscience\n Should also select one Independent Study/Independent Project'.

interest(1, C,TP,IO,_,RM):-
    TP=:=1,
    IO=:=2,
    (RM=:=1;RM=:=2),
    C='You are interested in theory. And also have interest in other subject than CB so you should go with following courses \n
    1.Data Mining \n
    2.Network Science\n
    3.Introduction to Computational Neuroscience \n
    4.Machine Learning for Biomedical Applications'.

interest(1, C,_,_,_,_):-
    C='Sorry I can advice only core courses to you as you have a variety of choices.',nl.




%Interest in Programming and Maths
interest(2, C,TP,_,_,RM):-
    TP=:=2,
    RM=:=2,
    C='You like practical applications. And also intermediate in Mathematics.\n So you should go with following courses \n
    1.Statistical Computation \n
    2.Practical Bioinformatics\n
    3.Probabilistic Graphical Models\n
    4.Machine Learning for Biomedical Applications'.

interest(2, C,TP,_,PI,RM):-
    TP=:=1,
    PI=:=2,
    (RM=:=1;RM=:=2),
    C='You are interested in theory. And beginner in Mathematics and doest not have interest in projects.\n So you should go with following courses \n
    1.Cheminformatics \n
    2.Network Science\n
    3.Probabilistic Graphical Models\n
    4.Graph Theory'.

interest(2, C,_,_,_,_):-
    C='Sorry I can advice only core courses to you as you have a variety of choices.'.



%Interest in Programming and Bio
interest(3, C,TP,IO,PI,RM):-
    TP=:=2,
    IO=:=1,
    PI=:=1,
   (RM=:=1;RM=:=2),
    C='You like practical applications and interested in other subjects too.\nSo you should go with following courses \n
    1.Data Mining\n
    2.Machine Learning\n
    3.Probabilistic Graphical Models\n
    4.Practical Bioinformatics'.

interest(3, C,TP,_,PI,_):-
    TP=:=1,
    PI=:=2,
    C='You are interested in theory. And does not have interets in projects.\nSo you should go with following courses \n
    1.Network Biology \n
    2.Introduction to Quantitative Biology\n
    3.Probabilistic Graphical Models\n
    4.Machine Learning for Biomedical Applications'.

interest(3, C,_,_,_,_):-
    C='Sorry I can advice only core courses to you as you have a variety of choices.'.


% In CSE Program, Area of interest to find the electives as per user's
% input choice.

%Interest in Machine Learning and AI Technologies
area_interest(1,FS,_,RA,TP) :-
    FS=:=1,
    RA=:=3,
    TP=:=2,
    write('Based on your previous choices you should go for specialisation in Artificial Intelligence with Thesis.\n You are an expert in algorithm and practical person so you should go for following Core electives as \n1.Modern Graduate Algorithm \n 2.Artificial Intelligence\n 3.Machine Learning\nThere are several other electives in AI and you have to select atleast 3.'),nl,
    write('Answer few more questions to narrow down the subjects'),nl,
    question(images_or_text,IT),
    (
    (
    IT=:=1-> X=['Advanced Computer Vision','Deep Learning','Image Analysis'];
    IT=:=2-> X=['Natural Language Processing','Speech Recognition','Linear Optimization'])
    ),
    question(rate_maths,RM),
    (
     RM=:=1-> Y=['Probabilistics Graphical Model'];
    (   RM=:=2-> Y=['Probabilistics Graphical Model'];
    RM=:=3-> Y=['Probability and Random Processes '])
    ),
    append_lists(X,Y,Z),nl,nl,
    question(extra_credit,EC),
    (
    EC=:=1-> A=['As you are interested in taking Extra 2 Credit Course. You can choose any as per your choice:','Point Set Topology', 'Data LifeCycle Management','Meta Learning'];
    EC=:=2->A=['Not interested in taking extra credit course']),
    append_lists(Z,A,Q),nl,nl,
    write('The remaining electives as per your choices are:'),nl,print_list(Q).


area_interest(1,FS,_,RA,TP) :-
    FS=:=1,
    RA=:=2,
    TP=:=2,
    write('Based on your previous choices you should go for specialisation in Artificial Intelligence with Thesis.\n You are an intermediate in algorithm and practical person so you should go for following Core electives as\n 1.Introduction to Graduate Algorithm \n 2.Artificial Intelligence\n3.Machine Learning\nThere are several other electives in AI and you have to select atleast 3.'),nl,
    write('Answer few more questions to narrow down the subjects'),nl,
    question(images_or_text,IT),
    (
    (
    IT=:=1-> X=['Computer Vision','Deep Learning','Information Retrieval'];
    IT=:=2-> X=['Natural Language Processing','Speech Recognition','Data Mining'])
    ),
    question(rate_maths,RM),
    (
    RM=:=1-> Y=['Probabilistics Graphical Model'];
    (   RM=:=2-> Y=['Probabilistics Graphical Model'];
    RM=:=3-> Y=['Probability and Random Processes '])
    ),
    append_lists(X,Y,Z),nl,nl,
    question(extra_credit,EC),
    (
    EC=:=1-> A=['As you are interested for taking Extra 2 Credit Course. You can choose any as per your choice','Point Set Topology', 'Data LifeCycle Management','Meta Learning'];
    EC=:=2->A=['Not interested in taking extra credit course']
    ),
    append_lists(Z,A,Q),nl,nl,
    write('The remaining electives as per your choices are:'),nl,print_list(Q).


area_interest(1,FS,_,_,TP) :-
    FS=:=1,
    TP=:=1,
    write('Based on your previous choices you should go for specialisation in Artificial Intelligence with Thesis.\n You are a theoritical person so you should go for following Core electives as\n 1.Introduction to Graduate Algorithm \n 2.Data mining \n 3.Statistical Machine Learning\n There are several other electives in AI and you have to select atleast 3.'),nl,write('Answer few more questions to narrow down the subjects'),nl,nl,
     question(images_or_text,IT),
    (
    (
    IT=:=1-> X=['Computer Vision','Deep Learning','Information Retrieval'];
    IT=:=2-> X=['Natural Language Processing','Speech Recognition','Data Mining'])
    ),
    question(rate_maths,RM),
    (
     RM=:=1-> Y=['Probabilistics Graphical Model'];
    (   RM=:=2-> Y=['Probabilistics Graphical Model'];
    RM=:=3-> Y=['Probability and Random Processes '])
    ),
    append_lists(X,Y,Z),nl,nl,
    question(extra_credit,EC),
    (
    EC=:=1-> A=['As you are interested for taking Extra 2 Credit Course. You can choose any as per your choice','Point Set Topology', 'Data LifeCycle Management','Meta Learning'];
    EC=:=2->A=['Not interested in taking extra credit course']
    ),
    append_lists(Z,A,Q),nl,nl,
    write('The remaining electives as per your choices are:'),nl,print_list(Q),!.


area_interest(1,FS,_,_,_) :-
    FS=:=1,
    write('Based on your previous choices you should go for specialisation in Artificial Intelligence with Thesis.\n You have variety of choices so you should go for following common Core electives as\n 1.Introduction to Graduate Algorithm \n 2.Artificial Intelligence \n 3.Machine Learning\n There are several other electives in AI and you have to select atleast 3.'),nl,write('Answer few more questions to narrow down the subjects'),nl,
    question(images_or_text,IT),
    (
    (
    IT=:=1-> X=['Computer Vision','Deep Learning','Information Retrieval'];
    IT=:=2-> X=['Natural Language Processing','Speech Recognition','Data Mining'])
    ),
    question(rate_maths,RM),
    (
     RM=:=1-> Y=['Probabilistics Graphical Model'];
    (   RM=:=2-> Y=['Probabilistics Graphical Model'];
    RM=:=3-> Y=['Probability and Random Processes '])
    ),
    append_lists(X,Y,Z),nl,nl,
    question(extra_credit,EC),
    (
    EC=:=1-> A=['As you are interested for taking Extra 2 Credit Course. You can choose any as per your choice','Point Set Topology', 'Data LifeCycle Management','Meta Learning'];
    EC=:=2->A=['Not interested in taking extra credit course']
    ),
    append_lists(Z,A,Q),nl,nl,
    write('The remaining electives as per your choices are:'),nl,print_list(Q).


area_interest(1,FS,PP,RA,TP) :-
    FS=:=2,
    RA=:=3,
    TP=:=2,
    PP=:=1,
    write('Based on your previous choices you should go for specialisation in Artificial Intelligence with Capstone project as you have done prior projects too. You should go for the following Core electives as\n 1.Modern Graduate Algorithm \n 2.Artificial Intelligence\n3.Machine Learning\n There are several electives in AI and you have to select atleast 4'),nl,write('Answer few more questions to narrow down the subjects'),nl,
     question(images_or_text,IT),
    (
    (
    IT=:=1-> X=['Advanced Computer Vision','Deep Learning','Image Analysis'];
    IT=:=2-> X=['Natural Language Processing','Speech Recognition','Linear Optimization'])
    ),
    question(rate_maths,RM),
    (
     RM=:=1-> Y=['Probabilistics Graphical Model'];
    (   RM=:=2-> Y=['Probabilistics Graphical Model'];
    RM=:=3-> Y=['Probability and Random Processes '])
    ),
    append_lists(X,Y,Z),nl,nl,
    question(extra_credit,EC),
    (
    EC=:=1-> A=['As you are interested for taking Extra 2 Credit Course. You can choose any as per your choice','Point Set Topology', 'Data LifeCycle Management','Meta Learning'];
    EC=:=2->A=['Not interested in taking extra credit course']
    ),
    append_lists(Z,A,Q),nl,nl,
    write('The remaining electives as per your choices are:'),nl,print_list(Q).


area_interest(1,FS,PP,RA,_) :-
    FS=:=2,
    RA=:=2,
    PP=:=1,
    write('Based on your previous choices you should go for specialisation in Artificial Intelligence with Independent project as you have done prior projects too and intermediate in algorithm. You should go for the following Core electives as\n 1.Introduction to Graduate Algorithm \n2.Artificial Intelligence \n 3.Machine Learning\n  There are several electives in AI and you have to select atleast 4'),nl,
    write('Answer few more questions to narrow down the subjects'),nl,
    question(images_or_text,IT),
    (
    (
    IT=:=1-> X=['Computer Vision','Deep Learning','Information Retrieval'];
    IT=:=2-> X=['Natural Language Processing','Speech Recognition','Data Mining'])
    ),
    question(rate_maths,RM),
    (
     RM=:=1-> Y=['Probabilistics Graphical Model'];
    (   RM=:=2-> Y=['Probabilistics Graphical Model'];
    RM=:=3-> Y=['Probability and Random Processes '])
    ),
    append_lists(X,Y,Z),nl,nl,
    question(extra_credit,EC),
    (
    EC=:=1-> A=['As you are interested for taking Extra 2 Credit Course. You can choose any as per your choice','Point Set Topology', 'Data LifeCycle Management','Meta Learning'];
    EC=:=2->A=['Not interested in taking extra credit course']
    ),
    append_lists(Z,A,Q),nl,nl,
    write('The remaining electives as per your choices are:'),nl,print_list(Q).


area_interest(1,FS,PP,_,TP) :-
    FS=:=2,
    TP=:=1,
    PP=:=2,
    write('Based on your previous choices you should go for specialisation in Artificial Intelligence with Independent study as you have not done prior projects. You should go for the following Core electives as\n 1.Introduction to Graduate Algorithm \n2.Data Mining \n 3.Statistical Machine Learning\n  There are several electives in AI and you have to select atleast 4'),nl,
    write('Answer few more questions to narrow down the subjects'),nl,
     question(images_or_text,IT),
    (
    (
    IT=:=1-> X=['Computer Vision','Deep Learning','Information Retrieval'];
    IT=:=2-> X=['Natural Language Processing','Speech Recognition','Data Mining'])
    ),
    question(rate_maths,RM),
    (
     RM=:=1-> Y=['Probabilistics Graphical Model'];
    (   RM=:=2-> Y=['Probabilistics Graphical Model'];
    RM=:=3-> Y=['Probability and Random Processes '])
    ),
    append_lists(X,Y,Z),nl,nl,
    question(extra_credit,EC),
    (
    EC=:=1-> A=['As you are interested for taking Extra 2 Credit Course. You can choose any as per your choice','Point Set Topology', 'Data LifeCycle Management','Meta Learning'];
    EC=:=2->A=['Not interested in taking extra credit course']
    ),
    append_lists(Z,A,Q),nl,nl,
    write('The remaining electives as per your choices are:'),nl,print_list(Q),!.


area_interest(1,FS,_,_,_) :-
    FS=:=2,
    write('Based on your previous choices you should go for specialisation in Artificial Intelligence with Independent Study/Project.\n You have variety of choices so you should go for the following common Core electives as\n 1.Introduction to Graduate Algorithm \n 2.Artificial Intelligence \n 3.Machine Learning\n There are several other electives in AI and you have to select atleast 4.'),nl,write('Answer few more questions to narrow down the subjects'),nl,
    question(images_or_text,IT),
    (
    (
    IT=:=1-> X=['Computer Vision','Deep Learning','Information Retrieval'];
    IT=:=2-> X=['Natural Language Processing','Speech Recognition','Data Mining'])
    ),
    question(rate_maths,RM),
    (
     RM=:=1-> Y=['Probabilistics Graphical Model'];
    (   RM=:=2-> Y=['Probabilistics Graphical Model'];
    RM=:=3-> Y=['Probability and Random Processes '])
    ),
    append_lists(X,Y,Z),nl,nl,
    question(extra_credit,EC),
    (
    EC=:=1-> A=['As you are interested for taking Extra 2 Credit Course. You can choose any as per your choice','Point Set Topology', 'Data LifeCycle Management','Meta Learning'];
    EC=:=2->A=['Not interested in taking extra credit course']
    ),
    append_lists(Z,A,Q),nl,nl,
    write('The remaining electives as per your choices are:'),nl,print_list(Q).





% Interest in Data and Information Management System
area_interest(2,FS,_,RA,TP) :-
    FS=:=1,
    RA=:=3,
    TP=:=2,
    write('Based on your previous choices you should go for specialisation in Data Engineering with Thesis.\n You are an expert in algorithm and practical person so you should go for following Core electives as\n 1.Modern Graduate Algorithm \n 2.Data Mining\n 3.Machine Learning\n There are several other electives in DE and youhave to select atleast 3.'),nl,write('Answer few more questions to narrow down the subjects'),nl,
    question(images_or_text,IT),
    (
    (
    IT=:=1-> X=['Information Retreival'];
    IT=:=2-> X=['Natural Language Processing'])
    ),
    question(rate_maths,RM),
    (
     RM=:=1-> Y=['Collaborative Filtering'];
    (   RM=:=2-> Y=['Statistical Machine Learning'];
    RM=:=3-> Y=['Probabilistic Graphical Models'])
    ),
    append_lists(X,Y,Z),nl,
    question(like_dataML,DML),
    (
    (
    DML=:=1-> P=['GPU Computing'];
    DML=:=2-> P=['Big Data Analytics'])
    ),
    append_lists(Z,P,Q),nl,nl,
    question(extra_credit,EC),
    (
    EC=:=1-> A=['As you are interested for taking Extra 2 Credit Course. You can choose any as per your choice','Point Set Topology', 'Data LifeCycle Management','Meta Learning'];
    EC=:=2->A=['Not interested in taking extra credit course']
    ),
    append_lists(Q,A,B),nl,nl,
    write('The remaining electives as per your choices are:'),nl,print_list(B).


area_interest(2,FS,_,RA,TP) :-
    FS=:=1,
    RA=:=2,
    TP=:=2,
    write('Based on your previous choices you should go for specialisation in Data Engineering with Thesis.\nYou are an intermediate in algorithm and practical person so you should go for following Core electives as\n 1.Introduction to Graduate Algorithm \n 2.Data Mining\n 3.Machine Learning\nThere are several other electives in DE and you have to select atleast 3.'),nl,write('Answer few more questions to narrow down the subjects'),nl,
    question(images_or_text,IT),
    (
    (
    IT=:=1-> X=['Information Retreival'];
    IT=:=2-> X=['Natural Language Processing'])
    ),
    question(rate_maths,RM),
    (
     RM=:=1-> Y=['Collaborative Filtering'];
    (   RM=:=2-> Y=['Statistical Machine Learning'];
    RM=:=3-> Y=['Probabilistic Graphical Models'])
    ),
    append_lists(X,Y,Z),nl,
    question(like_dataML,DML),
    (
    (
    DML=:=1-> P=['GPU Computing'];
    DML=:=2-> P=['Big Data Analytics'])
    ),
    append_lists(Z,P,Q),nl,nl,
    question(extra_credit,EC),
    (
    EC=:=1-> A=['As you are interested for taking Extra 2 Credit Course. You can choose any as per your choice','Point Set Topology', 'Data LifeCycle Management','Meta Learning'];
    EC=:=2->A=['Not interested in taking extra credit course']
    ),
    append_lists(Q,A,B),nl,nl,
    write('The remaining electives as per your choices are:'),nl,print_list(B).


area_interest(2,FS,_,_,TP) :-
    FS=:=1,
    TP=:=1,
    write('Based on your previous choices you should go for specialisation in Data Engineering with Thesis.\n You are a theoritical person so you should go for following Core electives as\n 1.Introduction to Graduate Algorithm \n 2.Data Mining\n 3.Machine Learning\nThere are several other electives in DE and you have to select atleast 3.'),nl,write('Answer few more questions to narrow down the subjects'),nl,
    question(images_or_text,IT),
    (
    (
    IT=:=1-> X=['Information Retreival'];
    IT=:=2-> X=['Natural Language Processing'])
    ),
    question(rate_maths,RM),
    (
     RM=:=1-> Y=['Collaborative Filtering'];
    (   RM=:=2-> Y=['Statistical Machine Learning'];
    RM=:=3-> Y=['Probabilistic Graphical Models'])
    ),
    append_lists(X,Y,Z),nl,
    question(like_dataML,DML),
    (
    (
    DML=:=1-> P=['GPU Computing'];
    DML=:=2-> P=['Big Data Analytics'])
    ),
    append_lists(Z,P,Q),nl,nl,
    question(extra_credit,EC),
    (
    EC=:=1-> A=['As you are interested for taking Extra 2 Credit Course. You can choose any as per your choice','Point Set Topology', 'Data LifeCycle Management','Meta Learning'];
    EC=:=2->A=['Not interested in taking extra credit course']
    ),
    append_lists(Q,A,B),nl,nl,
    write('The remaining electives as per your choices are:'),nl,print_list(B),!.


area_interest(2,FS,_,_,_) :-
    FS=:=1,
    write('Based on your previous choices you should go for specialisation in Data Engineering with Thesis.\n You have variety of choices so you should go for following common Core electives as\n 1.Introduction to Graduate Algorithm  \n 2.Data Mining\n 3.Machine Learning\n There are several other electives in DE and you have to select atleast 3.'),nl,write('Answer few more questions to narrow down the subjects'),nl,
    question(images_or_text,IT),
    (
    (
    IT=:=1-> X=['Information Retreival'];
    IT=:=2-> X=['Natural Language Processing'])
    ),
    question(rate_maths,RM),
    (
     RM=:=1-> Y=['Collaborative Filtering'];
    (   RM=:=2-> Y=['Statistical Machine Learning'];
    RM=:=3-> Y=['Probabilistic Graphical Models'])
    ),
    append_lists(X,Y,Z),nl,
    question(like_dataML,DML),
    (
    (
    DML=:=1-> P=['GPU Computing'];
    DML=:=2-> P=['Big Data Analytics'])
    ),
    append_lists(Z,P,Q),nl,nl,
    question(extra_credit,EC),
    (
    EC=:=1-> A=['As you are interested for taking Extra 2 Credit Course. You can choose any as per your choice','Point Set Topology', 'Data LifeCycle Management','Meta Learning'];
    EC=:=2->A=['Not interested in taking extra credit course']
    ),
    append_lists(Q,A,B),nl,nl,
    write('The remaining electives as per your choices are:'),nl,print_list(B).


area_interest(2,FS,PP,RA,TP) :-
    FS=:=2,
    RA=:=3,
    TP=:=2,
    PP=:=1,
    write('Based on your previous choices you should go for specialisation in Data Engineering  with Capstone project as you have done prior projects too.\n You should go for the following Core electives as \n1.Modern Graduate Algorithm \n 2.Data Mining\n 3.Machine Learning\n There are several other electives in DE and you have to select atleast 4.'),nl,write('Answer few more questions to narrow down the subjects'),nl,
    question(images_or_text,IT),
    (
    (
    IT=:=1-> X=['Information Retreival'];
    IT=:=2-> X=['Natural Language Processing'])
    ),
    question(rate_maths,RM),
    (
     RM=:=1-> Y=['Collaborative Filtering'];
    (   RM=:=2-> Y=['Statistical Machine Learning'];
    RM=:=3-> Y=['Probabilistic Graphical Models'])
    ),
    append_lists(X,Y,Z),nl,
    question(like_dataML,DML),
    (
    (
    DML=:=1-> P=['GPU Computing'];
    DML=:=2-> P=['Big Data Analytics'])
    ),
    append_lists(Z,P,Q),nl,nl,
    question(extra_credit,EC),
    (
    EC=:=1-> A=['As you are interested for taking Extra 2 Credit Course. You can choose any as per your choice','Point Set Topology', 'Data LifeCycle Management','Meta Learning'];
    EC=:=2->A=['Not interested in taking extra credit course']
    ),
    append_lists(Q,A,B),nl,nl,
    write('The remaining electives as per your choices are:'),nl,print_list(B).


area_interest(2,FS,PP,RA,_) :-
    FS=:=2,
    RA=:=2,
    PP=:=1,
    write('Based on your previous choices you should go for specialisation in Data Engineering with Independent project as you have done prior projects too and intermediate in algorithm.\n You should go for the following Core electives as\n 1.Introduction to Graduate Algorithm\n 2.Data Mining\n 3.Machine Learning\n There are several other electives in DE and you have to select atleast 4.'),nl,
    write('Answer few more questions to narrow down the subjects'),nl,
    question(images_or_text,IT),
    (
    (
    IT=:=1-> X=['Information Retreival'];
    IT=:=2-> X=['Natural Language Processing'])
    ),
    question(rate_maths,RM),
    (
     RM=:=1-> Y=['Collaborative Filtering'];
    (   RM=:=2-> Y=['Statistical Machine Learning'];
    RM=:=3-> Y=['Probabilistic Graphical Models'])
    ),
    append_lists(X,Y,Z),nl,
    question(like_dataML,DML),
    (
    (
    DML=:=1-> P=['GPU Computing'];
    DML=:=2-> P=['Big Data Analytics'])
    ),
    append_lists(Z,P,Q),nl,nl,
    question(extra_credit,EC),
    (
    EC=:=1-> A=['As you are interested for taking Extra 2 Credit Course. You can choose any as per your choice','Point Set Topology', 'Data LifeCycle Management','Meta Learning'];
    EC=:=2->A=['Not interested in taking extra credit course']
    ),
    append_lists(Q,A,B),nl,nl,
    write('The remaining electives as per your choices are:'),nl,print_list(B).


area_interest(2,FS,PP,_,TP) :-
    FS=:=2,
    TP=:=1,
    PP=:=2,
    write('Based on your previous choices you should go for specialisation in Data Engineering with Independent study as you have not done prior projects.\n You should go for the following Core electives as \n1.Introduction to Graduate Algorithm \n 2.Data Mining\n 3.Machine Learning\nThere are several other electives in DE and you have to select atleast 4.'),nl,write('Answer few more questions to narrow down the subjects'),nl,
    question(images_or_text,IT),
    (
    (
    IT=:=1-> X=['Information Retreival'];
    IT=:=2-> X=['Natural Language Processing'])
    ),
    question(rate_maths,RM),
    (
     RM=:=1-> Y=['Collaborative Filtering'];
    (   RM=:=2-> Y=['Statistical Machine Learning'];
    RM=:=3-> Y=['Probabilistic Graphical Models'])
    ),
    append_lists(X,Y,Z),nl,
    question(like_dataML,DML),
    (
    (
    DML=:=1-> P=['GPU Computing'];
    DML=:=2-> P=['Big Data Analytics'])
    ),
    append_lists(Z,P,Q),nl,nl,
    question(extra_credit,EC),
    (
    EC=:=1-> A=['As you are interested for taking Extra 2 Credit Course. You can choose any as per your choice','Point Set Topology', 'Data LifeCycle Management','Meta Learning'];
    EC=:=2->A=['Not interested in taking extra credit course']
    ),
    append_lists(Q,A,B),nl,nl,
    write('The remaining electives as per your choices are:'),nl,print_list(B),!.


area_interest(2,FS,_,_,_) :-
    FS=:=2,
    write('Based on your previous choices you should go for specialisation in Data Engineering with Independent Study/Project.\n You have variety of choices so you should go for the following common Core electives as\n 1.Introduction to Graduate Algorithm \n 2.Data Mining\n 3.Machine Learning\n There are several other electives in DE and you have to select atleast 4.'),nl,write('Answer few more questions to narrow down the subjects'),nl,
    question(images_or_text,IT),
    (
    (
    IT=:=1-> X=['Information Retreival'];
    IT=:=2-> X=['Natural Language Processing'])
    ),
    question(rate_maths,RM),
    (
     RM=:=1-> Y=['Collaborative Filtering'];
    (   RM=:=2-> Y=['Statistical Machine Learning'];
    RM=:=3-> Y=['Probabilistic Graphical Models'])
    ),
    append_lists(X,Y,Z),nl,
    question(like_dataML,DML),
    (
    (
    DML=:=1-> P=['GPU Computing'];
    DML=:=2-> P=['Big Data Analytics'])
    ),
    append_lists(Z,P,Q),nl,nl,
    question(extra_credit,EC),
    (
    EC=:=1-> A=['As you are interested for taking Extra 2 Credit Course. You can choose any as per your choice','Point Set Topology', 'Data LifeCycle Management','Meta Learning'];
    EC=:=2->A=['Not interested in taking extra credit course']
    ),
    append_lists(Q,A,B),nl,nl,
    write('The remaining electives as per your choices are:'),nl,print_list(B).





% Interest in Networking ad Wireless technology such as Mobiles.
area_interest(3,FS,_,RA,TP) :-
    FS=:=1,
    RA=:=3,
    TP=:=2,
    write('Based on your previous choices you should go for specialisation in Mobile Computing with Thesis.\n You are an expert in algorithm and practical person so you should go for following Core electives as\n 1.Modern Graduate Algorithm \n 2.Information Retrieval\n 3.Data Mining\nThere are several other electives in Mobile Computing and you have to select atleast 3.'),nl,write('Answer few more questions to narrow down the subjects'),nl,
    question(prior_knowledge_security,PKS),
    (
    (
    PKS=:=1-> X=['Distributed Systems Security','Network Security'];
    PKS=:=2-> X=['Mobile Computing', 'Embedded System'])
    ),
    question(rate_maths,RM),
    (
     RM=:=1-> Y=['Introduction to Spatial Computing'];
    (   RM=:=2-> Y=['Cellular Data Networks'];
    RM=:=3-> Y=['Probabilistic Graphical Models'])
    ),
    append_lists(X,Y,Z),nl,
    question(networking_or_OS,NOS),
    (
    (
    NOS=:=1-> P=['Ad Hoc Wireless Network'];
    NOS=:=2-> P=['Programming Cloud Services for Mobile Applications'])
    ),
    append_lists(Z,P,Q),nl,nl,
    question(extra_credit,EC),
    (
    EC=:=1-> A=['As you are interested for taking Extra 2 Credit Course. You can choose any as per your choice','Point Set Topology', 'Data LifeCycle Management','Meta Learning'];
    EC=:=2->A=['Not interested in taking extra credit course']
    ),
    append_lists(Q,A,B),nl,nl,
    write('The remaining electives as per your choices are:'),nl,print_list(B).


area_interest(3,FS,_,RA,TP) :-
    FS=:=1,
    RA=:=2,
    TP=:=2,
    write('Based on your previous choices you should go for specialisation in Mobile Computing with Thesis.\nYou are an intermediate in algorithm and practical person so you should go for following Core electives as\n 1.Introduction to Graduate Algorithm \n 2.Information Retrieval\n 3.Data Mining\nThere are several other electives in Mobile Computing and you have to select atleast 3.'),nl,write('Answer few more questions to narrow down the subjects'),nl,
    question(prior_knowledge_security,PKS),
    (
    (
    PKS=:=1-> X=['Distributed Systems Security','Network Security'];
    PKS=:=2-> X=['Mobile Computing', 'Embedded System'])
    ),
    question(rate_maths,RM),
    (
     RM=:=1-> Y=['Introduction to Spatial Computing'];
    (   RM=:=2-> Y=['Cellular Data Networks'];
    RM=:=3-> Y=['Probabilistic Graphical Models'])
    ),
    append_lists(X,Y,Z),nl,
    question(networking_or_OS,NOS),
    (
    (
    NOS=:=1-> P=['Ad Hoc Wireless Network'];
    NOS=:=2-> P=['Programming Cloud Services for Mobile Applications'])
    ),
    append_lists(Z,P,Q),nl,nl,
    question(extra_credit,EC),
    (
    EC=:=1-> A=['As you are interested for taking Extra 2 Credit Course. You can choose any as per your choice','Point Set Topology', 'Data LifeCycle Management','Meta Learning'];
    EC=:=2->A=['Not interested in taking extra credit course']
    ),
    append_lists(Q,A,B),nl,nl,
    write('The remaining electives as per your choices are:'),nl,print_list(B).


area_interest(3,FS,_,_,TP) :-
    FS=:=1,
    TP=:=1,
    write('Based on your previous choices you should go for specialisation in Mobile Computing with Thesis.\n You are a theoritical person so you should go for following Core electives as \n1.Introduction to Graduate Algorithm \n 2.Information Retrieval\n 3.Data Mining\n There are several other electives in Mobile Computing and you have to select atleast 3.'),nl,write('Answer few more questions to narrow down the subjects'),nl,
    question(prior_knowledge_security,PKS),
    (
    (
    PKS=:=1-> X=['Distributed Systems Security','Network Security'];
    PKS=:=2-> X=['Mobile Computing', 'Embedded System'])
    ),
    question(rate_maths,RM),
    (
     RM=:=1-> Y=['Introduction to Spatial Computing'];
    (   RM=:=2-> Y=['Cellular Data Networks'];
    RM=:=3-> Y=['Probabilistic Graphical Models'])
    ),
    append_lists(X,Y,Z),nl,
    question(networking_or_OS,NOS),
    (
    (
    NOS=:=1-> P=['Ad Hoc Wireless Network'];
    NOS=:=2-> P=['Programming Cloud Services for Mobile Applications'])
    ),
    append_lists(Z,P,Q),nl,nl,
    question(extra_credit,EC),
    (
    EC=:=1-> A=['As you are interested for taking Extra 2 Credit Course. You can choose any as per your choice','Point Set Topology', 'Data LifeCycle Management','Meta Learning'];
    EC=:=2->A=['Not interested in taking extra credit course']
    ),
    append_lists(Q,A,B),nl,nl,
    write('The remaining electives as per your choices are:'),nl,print_list(B),!.


area_interest(3,FS,_,_,_) :-
    FS=:=1,
    write('Based on your previous choices you should go for specialisation in Mobile Computing with Thesis. \nYou have variety of choices so you should go for following common Core electives as\n 1.Introduction to Graduate Algorithm  \n 2.Information Retrieval \n3.Data Mining\nThere are several other electives in Mobile Computing and you have to select atleast 3.'),nl,write('Answer few more questions to narrow down the subjects'),nl,
    question(prior_knowledge_security,PKS),
    (
    (
    PKS=:=1-> X=['Distributed Systems Security','Network Security'];
    PKS=:=2-> X=['Mobile Computing', 'Embedded System'])
    ),
    question(rate_maths,RM),
    (
     RM=:=1-> Y=['Introduction to Spatial Computing'];
    (   RM=:=2-> Y=['Cellular Data Networks'];
    RM=:=3-> Y=['Probabilistic Graphical Models'])
    ),
    append_lists(X,Y,Z),nl,
    question(networking_or_OS,NOS),
    (
    (
    NOS=:=1-> P=['Ad Hoc Wireless Network'];
    NOS=:=2-> P=['Programming Cloud Services for Mobile Applications'])
    ),
    append_lists(Z,P,Q),nl,nl,
    question(extra_credit,EC),
    (
    EC=:=1-> A=['As you are interested for taking Extra 2 Credit Course. You can choose any as per your choice','Point Set Topology', 'Data LifeCycle Management','Meta Learning'];
    EC=:=2->A=['Not interested in taking extra credit course']
    ),
    append_lists(Q,A,B),nl,nl,
    write('The remaining electives as per your choices are:'),nl,print_list(B).


area_interest(3,FS,PP,RA,TP) :-
    FS=:=2,
    RA=:=3,
    TP=:=2,
    PP=:=1,
    write('Based on your previous choices you should go for specialisation in Mobile Computing  with Capstone project as you have done prior projects too.\n You should go for the following Core electives as\n 1.Modern Graduate Algorithm \n 2.Information Retrieval\n 3.Data Mining\n There are several other electives in Mobile Computing and you have to select atleast 4.'),nl,write('Answer few more questions to narrow down the subjects'),nl,
    question(prior_knowledge_security,PKS),
    (
    (
    PKS=:=1-> X=['Distributed Systems Security','Network Security'];
    PKS=:=2-> X=['Mobile Computing', 'Embedded System'])
    ),
    question(rate_maths,RM),
    (
     RM=:=1-> Y=['Introduction to Spatial Computing'];
    (   RM=:=2-> Y=['Cellular Data Networks'];
    RM=:=3-> Y=['Probabilistic Graphical Models'])
    ),
    append_lists(X,Y,Z),nl,
    question(networking_or_OS,NOS),
    (
    (
    NOS=:=1-> P=['Ad Hoc Wireless Network'];
    NOS=:=2-> P=['Programming Cloud Services for Mobile Applications'])
    ),
    append_lists(Z,P,Q),nl,nl,
    question(extra_credit,EC),
    (
    EC=:=1-> A=['As you are interested for taking Extra 2 Credit Course. You can choose any as per your choice','Point Set Topology', 'Data LifeCycle Management','Meta Learning'];
    EC=:=2->A=['Not interested in taking extra credit course']
    ),
    append_lists(Q,A,B),nl,nl,
    write('The remaining electives as per your choices are:'),nl,print_list(B).


area_interest(3,FS,PP,RA,_) :-
    FS=:=2,
    RA=:=2,
    PP=:=1,
    write('Based on your previous choices you should go for specialisation in Mobile Computing with Independent project as you have done prior projects too and intermediate in algorithm.\n You should go for the following Core electives as\n 1.Introduction to Graduate Algorithm \n 2.Information Retrieval 3.Data Mining\n There are several other electives in Mobile Computing and you have to select atleast 4.'),nl,write('Answer few more questions to narrow down the subjects'),nl,
    question(prior_knowledge_security,PKS),
    (
    (
    PKS=:=1-> X=['Distributed Systems Security','Network Security'];
    PKS=:=2-> X=['Mobile Computing', 'Embedded System'])
    ),
    question(rate_maths,RM),
    (
     RM=:=1-> Y=['Introduction to Spatial Computing'];
    (   RM=:=2-> Y=['Cellular Data Networks'];
    RM=:=3-> Y=['Probabilistic Graphical Models'])
    ),
    append_lists(X,Y,Z),nl,
    question(networking_or_OS,NOS),
    (
    (
    NOS=:=1-> P=['Ad Hoc Wireless Network'];
    NOS=:=2-> P=['Programming Cloud Services for Mobile Applications'])
    ),
    append_lists(Z,P,Q),nl,nl,
    question(extra_credit,EC),
    (
    EC=:=1-> A=['As you are interested for taking Extra 2 Credit Course. You can choose any as per your choice','Point Set Topology', 'Data LifeCycle Management','Meta Learning'];
    EC=:=2->A=['Not interested in taking extra credit course']
    ),
    append_lists(Q,A,B),nl,nl,
    write('The remaining electives as per your choices are:'),nl,print_list(B).


area_interest(3,FS,PP,_,TP) :-
    FS=:=2,
    TP=:=1,
    PP=:=2,
    write('Based on your previous choices you should go for specialisation in Mobile Computing with Independent study as you have not done prior projects.\n You should go for the following Core electives as\n 1.Introduction to Graduate Algorithm \n 2.Information Retrieval 3.Data Mining\n There are several other electives in Mobile Computing and you have to select atleast 4.'),nl,write('Answer few more questions to narrow down the subjects'),nl,
    question(prior_knowledge_security,PKS),
    (
    (
    PKS=:=1-> X=['Distributed Systems Security','Network Security'];
    PKS=:=2-> X=['Mobile Computing, Embedded System'])
    ),
    question(rate_maths,RM),
    (
     RM=:=1-> Y=['Introduction to Spatial Computing'];
    (   RM=:=2-> Y=['Cellular Data Networks'];
    RM=:=3-> Y=['Probabilistic Graphical Models'])
    ),
    append_lists(X,Y,Z),nl,
    question(networking_or_OS,NOS),
    (
    (
    NOS=:=1-> P=['Ad Hoc Wireless Network'];
    NOS=:=2-> P=['Programming Cloud Services for Mobile Applications'])
    ),
    append_lists(Z,P,Q),nl,nl,
    question(extra_credit,EC),
    (
    EC=:=1-> A=['As you are interested for taking Extra 2 Credit Course. You can choose any as per your choice','Point Set Topology', 'Data LifeCycle Management','Meta Learning'];
    EC=:=2->A=['Not interested in taking extra credit course']
    ),
    append_lists(Q,A,B),nl,nl,
    write('The remaining electives as per your choices are:'),nl,print_list(B),!.


area_interest(3,FS,_,_,_) :-
    FS=:=2,
    write('Based on your previous choices you should go for specialisation in Mobile Computing with Independent Study/Project.\n You have variety of choices so you should go for the following common Core electives as\n 1.Introduction to Graduate Algorithm  \n 2.Information Retrieval\n 3.Data Mining\n There are several other electives in Mobile Computing and you have to select atleast 4.'),nl,
    write('Answer few more questions to narrow down the subjects'),nl,
    question(prior_knowledge_security,PKS),
    (
    (
    PKS=:=1-> X=['Distributed Systems Security','Network Security'];
    PKS=:=2-> X=['Mobile Computing', 'Embedded System'])
    ),
    question(rate_maths,RM),
    (
     RM=:=1-> Y=['Introduction to Spatial Computing'];
    (   RM=:=2-> Y=['Cellular Data Networks'];
    RM=:=3-> Y=['Probabilistic Graphical Models'])
    ),
    append_lists(X,Y,Z),nl,
    question(networking_or_OS,NOS),
    (
    (
    NOS=:=1-> P=['Ad Hoc Wireless Network'];
    NOS=:=2-> P=['Programming Cloud Services for Mobile Applications'])
    ),
    append_lists(Z,P,Q),nl,nl,
    question(extra_credit,EC),
    (
    EC=:=1-> A=['As you are interested for taking Extra 2 Credit Course. You can choose any as per your choice','Point Set Topology', 'Data LifeCycle Management','Meta Learning'];
    EC=:=2->A=['Not interested in taking extra credit course']
    ),
    append_lists(Q,A,B),nl,nl,
    write('The remaining electives as per your choices are:'),nl,print_list(B).



%Questions to be asked.

question(further_studies,FS):-
    assertz(query(further_studies,FS)).

question(theory_or_practical,TP) :-
    assertz(query(theory_or_practical,TP)).

question(project_interest,PI) :-
    assertz(query(project_interest,PI)).

question(interest_other,IO) :-
    assertz(query(interest_other,IO)).

question(extra_credit,EC) :-
    assertz(query(extra_credit,EC)).

question(rate_maths,RM) :-
    assertz(query(rate_maths,RM)).

question(rate_algo,RA) :-
    assertz(query(rate_algo,RA)).

question(prior_project,PP) :-
    assertz(query(prior_project,PP)).


question(images_or_text,IT) :-
    assertz(query(images_or_text,IT)).

question(networking_or_OS,NOS) :-
    assertz(query(networking_or_OS,NOS)).


question(like_dataML,DML) :-
    assertz(query(like_dataML,DML)).


question(prior_knowledge_security,PKS) :-
    assertz(query(prior_knowledge_security,PKS)).




