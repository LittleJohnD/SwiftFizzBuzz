// Playground - noun: a place where people can play

import UIKit

for var i=1; i<101; i++
{
    if ((i%3==0) && (i%5==0))
    {
        println("Fizz Buzz")
    }
    else if i%3==0
    {
        println("Fizz")
    }
    else if i%5==0
    {
        println("Buzz")
    }
    else
    {
        println(i)
    }
}