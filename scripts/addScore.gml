///addScore(score, name); argument 0 = score, argument = 1 name
ini_open('scores.ini');
for (i=0; i<global.slength+1; i+=1) //Looks though all the scores
{
    if (argument0>global.hscore[0,i]) { //Checks if you have broken a record
    nameholder = global.hscore[1,i] //Saves old score and name so you can "push" them down a position
    scoreholder = global.hscore[0,i]

    global.hscore[0,i]=argument0; //Sets the highscore
    ini_write_real('scores',string(i), argument0);
    global.hscore[1,i]=argument1;
    ini_write_string('names',string(i), nameholder);

    i++; //moves to next score

        while (i<global.slength) { //This loop will then push the rest of the scores, so you don't loss any scores except the last one
            nameholder2 = global.hscore[0,i]
            scoreholder2 = global.hscore[1,i]

            global.hscore[0,i] = nameholder
            ini_write_string('names',string(i), nameholder);
            global.hscore[1,i] = scoreholder
            ini_write_real('scores',string(i), scoreholder);

            nameholder = nameholder2;
            scoreholder = scoreholder2;

            i++;
        }
        ini_close();
    return true; //return true if new record is made (can be ignored)
    }
}
ini_close();
return false //no highscore made, returns false
