package com.bean;

import java.util.Random;

public class RandomKeys {
	
	// defining a function to generate a random string of length l

		public static String RandGeneratedStr(int l)

		 {

		 // a list of characters to choose from in form of a string

		 String AlphaNumericStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvxyz0123456789";

		 // creating a StringBuffer size of AlphaNumericStr

		 StringBuilder s = new StringBuilder(l);

		 int i;

		 for ( i=0; i<l; i++) {

		   //generating a random number using math.random()

		   int ch = (int)(AlphaNumericStr.length() * Math.random());

		   //adding Random character one by one at the end of s

		   s.append(AlphaNumericStr.charAt(ch));

		  }

		    return s.toString();

		 } 
		
		
		
		
		public static String RandGeneratedStr1(int l)

		 {

		 // a list of characters to choose from in form of a string

		 String AlphaNumericStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvxyz0123456789@!#$%^&*(?//>,';";

		 // creating a StringBuffer size of AlphaNumericStr

		 StringBuilder s = new StringBuilder(l);

		 int i;

		 for ( i=0; i<l; i++) {

		   //generating a random number using math.random()

		   int ch = (int)(AlphaNumericStr.length() * Math.random());

		   //adding Random character one by one at the end of s

		   s.append(AlphaNumericStr.charAt(ch));

		  }

		    return s.toString();

		 } 

		
		public static String Randprivatekeys(int l)

		 {

		 // a list of characters to choose from in form of a string

		 String AlphaNumericStr = "ABCDEFGdefghijk%OPQRSTUVWXYZrstuvxyz01HIJKLMabc89@!#$';";

		 // creating a StringBuffer size of AlphaNumericStr

		 StringBuilder s = new StringBuilder(l);

		 int i;

		 for ( i=0; i<l; i++) {

		   //generating a random number using math.random()

		   int ch = (int)(AlphaNumericStr.length() * Math.random());

		   //adding Random character one by one at the end of s

		   s.append(AlphaNumericStr.charAt(ch));

		  }

		    return s.toString();

		 } 

public static String getFid() {
	
	String SALTCHARS = "123456789012345678901234567890";
    StringBuilder salt = new StringBuilder();
    Random rnd = new Random();
    while (salt.length() < 5) { // length of the random string.
        int index = (int) (rnd.nextFloat() * SALTCHARS.length());
        salt.append(SALTCHARS.charAt(index));
    }
    String saltStr = salt.toString();
    return saltStr;
}
public static String getuid(int l) {
	
	String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890";
    StringBuilder salt = new StringBuilder();
    Random rnd = new Random();
    while (salt.length() < 5) { // length of the random string.
        int index = (int) (rnd.nextFloat() * SALTCHARS.length());
        salt.append(SALTCHARS.charAt(index));
    }
    String saltStr = salt.toString();
    return saltStr;
}

public static String setKey(int l) {
	
	String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890";
    StringBuilder salt = new StringBuilder();
    Random rnd = new Random();
    while (salt.length() < 8) { // length of the random string.
        int index = (int) (rnd.nextFloat() * SALTCHARS.length());
        salt.append(SALTCHARS.charAt(index));
    }
    String saltStr = salt.toString();
    return saltStr;
}
}
