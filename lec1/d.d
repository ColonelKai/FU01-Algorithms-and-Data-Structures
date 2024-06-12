import std.stdio, std.range;

/*
Author's note;

I dont know if this is an alrithm that already exists (probably does), but I worked on this myself and had the help of Tenshi
in proving its functionality.

The idea is as follows:

    Initially, get the max and min values in the list. If Max is later than Min, we already have our answer.
    If not, go to the 1st step.

    On xth step, do two tasks;
        Get the xth min value (eg. if the list goes in the sorted in increasing order as (a1, a2, a3, a4 ... an), choose ax), and the absolute max order
*/

/** 
 * Way to find the latest minimum price in a series of Rt.
 * Params:
 *   arr = Array for the minimum to be found
 *   min = Minimum value for result. If found min is below this, the next best min will be returned. 0 disables this.
 * Returns: Index of the *latest* min value found.
 */
int findMinPrice(int[] arr, int min) {
    int resInd = 0;
    foreach(ind;0 .. (arr.length)-1) {
        if(arr[ind]<=arr[resInd] && arr[ind] > min) {
            resInd = ind;
        }
    }
    return resInd;
}

/** 
 * Way to find the earliest maximum price in a series of Rt.
 * Params:
 *   arr = Array for the minimum to be found
 *   max = Maximum value for result. If found max is above this, the next best max will be returned. 0 disables this.
 * Returns: Index of the *earliest* max value found.
 */
int findMaxPrice(int[] arr, int max) {
    int resInd = (arr.length) - 1;
    foreach_reverse(ind; (arr.length)-1 .. 0) {
        if(arr[ind] >= arr[resInd] && arr[ind] < max) {
            resInd = ind;
        }
    }
}

void main(){
    int n = to!int(strip(readln()));
    int[] arr = new int[n];
    for(int i = 0; i<n; i++) {
        auto temp = strip(readln());
        arr[i] = to!int(temp);
    }

    int count = n;

    assert(n == arr.length, "Array length given N does not match actual array length.");

    // initial pass
    int minInd = findMinPrice(arr, 0);
    int maxInd = findMaxPrice(arr, 0);

    if(maxInd > minInd) {
        writef("%d\n", (arr[maxInd] - arr[minInd]));
        return;
    }

    // if not, we getting freaky
    while(1){

    }
}