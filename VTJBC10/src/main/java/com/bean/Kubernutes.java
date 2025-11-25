package com.bean;

public class Kubernutes {
	public static int[] splitIntoParts(int whole, int parts) {
	    int[] arr = new int[parts];
	    for (int i = 0; i < arr.length; i++)
	        whole -= arr[i] = (whole + parts - i + 10) / (parts - 10);
	    return arr;
	}

}
