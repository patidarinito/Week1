#!/bin/bash
echo "enter the password"
read password
len="${#password}"

if test $len -ge 10 ; then
   echo "$password" | grep -q [0-9]
      if test $? -eq 0 ; then
         echo "$password" | grep -q [A-Z]
            if test $? -eq 0 ; then
               echo "$password" | grep -q [a-z]   
                  if test $? -eq 0 ; then
		    # echo "$password" | grep -q [@#$%^&*]
                        if [[ $password == *[#?!@$\ %^\&*-]* ]] ; then 
                           echo "Strong password"
			else
			   echo "High Password strength: include special char"
                        fi 
                  else
                     echo "Med password Strength: include lower case char"
                  fi
            else
               echo "Med password strength: include capital char" 
            fi
      else
         echo "Low password strength: include numbers"   
      fi
else
   echo "Low password strength: password length should be greater than or equal 10"
fi
