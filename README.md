# Electives Advisory System

This project recommends electives as per the inputs given by the user as per the rules of IIIT Delhi.

## Code Files
1. Prolog File - advisoryMtech.pl

## Install
You need to install SWI-Prolog to run this prolog file. You can download the latest version


## Run
To run this program you need to write 
- Open SWI Prolog and write “welcome.” as the first query.
- Then to find the electives you need to type the numbers (choice) followed by a dot.

### Working of the project

We have to start the program by writing “welcome.”. Then we get two choices to select the
MTech Program in which you are enrolled.
According to the user’s input, we are moving to the other rule predict.
1. if the user has chosen 1 then we will ask CSE related general questions to advice
Or if the user chose 2 then we will ask CB-related general questions.
2. After that, we will ask area of interest in both the MTech Program. And as per the
choices of users, we will select the interest or area_interest rule to move further.
3. If the choices that the user has made are not appropriate then I have also made a
general rule where I can give the general advice due to the variety of choices the user
has made.
4. I have used append_lists rule to concatenate two lists into another single list.
5. print_lists rule is used to print the list values one by one.
6. After giving the specialization advice, I am asking few more questions to find the
electives of that particular specialization. Creating a list of electives using “if or” and then
printing it.


This project was a part of my assignment in Artificial Intelligence at IIIT Delhi during my MTech 1st year.

