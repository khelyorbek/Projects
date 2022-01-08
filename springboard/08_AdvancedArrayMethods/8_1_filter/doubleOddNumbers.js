function doubleOddNumbers(arr) {
   const arrOdd = arr.filter(function(num){
        return num % 2 !== 0;
   })


   const arrDouble = arrOdd.map(function(odd){
       return odd * 2;
   })

   return arrDouble;
}