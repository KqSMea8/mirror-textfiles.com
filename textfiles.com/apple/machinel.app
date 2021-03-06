Filename: M/L Part I

***************************************
*				      *
*				      *
*   MACHINE LANGUAGE TUTORIAL DISK    *
*				      *
*      WRITTEN BY DR. FIRMWARE	      *
*				      *
*				      *
***************************************


The aim of this disk is for you the reader to understand machine language to an
extent so that you can program fully in machine language (ml).


PART I
======

The fundamentals.
-----------------

The first part of the course is number bases. if you undestand binary and
hexadecimal numbers and conversion between these and decimal, you can skip to
the next section.


Binary: Base two.
-----------------

Number bases are what we are dealing with here. The number base that we normally
use in everday life is decimal. 'Decimal' comes from latin where it meant ten.
We have ten digits, 0,1,2,3,4,5,6,7,8, and 9, which are combined in various ways
to produced other numbers. It is understood that the number '345' means
3x100+4x10+5x1. The right-most digit has the least significance, while the
left-most has the most significance. FrgiOÏOa8 P$  B ! 	¥â$à `.È#¨îÌ] ·4·   G¢  .ÒÐ    `Ta	`hQéña+£phPhRs{¹cËKs9£C+)3«s#k+s£ca»);ca{s£«¡£C))£»ya{KsÉas«k+hSË£+iq3K¡£C+))£»y#K;K£aas!qya£C)K;C¡kk{¡#K;K¡C£C(hSc+¡K;sK3Ks)s!£C)c+3¡kk{¡a£C)k{¡K;sK3Ks)aS«¡cK[)KphS#+Kkaqs{¹a£C)s«k+k«c£KcK+!»K£A£C)#K;Hts will be successive powers
of two. 2~0=1, 2~1=2, 2~2=4, 2~3=8, etc. We now have the basics down, so we'll
take a number, such as '1001101', and find it's decimal value.

To start, we'll take the right-most digit and find out what it is multiplied
with. Since it's the right- most digit, it's multiplied with two to the power of
zero. 1x2~0=1. Now, repeat the process, this time with the second right most
digit, which is a 0. 0x2~1=0. Continueing produces: 1x2~2=4, 1x2~3=8, 0x2~4=0,
0x2~5=0, and 1x2~6=64. Summing the results, 1+0+4+8+0+0+64=77. So 77 is the
decimal value of the binary number 1001101.

If you want to practice some, just make strings of 0's and 1's and do what we
did above.

Conversion from decimal to binary is a little more complex. Suppose we take a
decimal number, 35. To convert, we do a series of steps.

1> Divide the number by two, and put the remainder aside.

2> Replace the dividend with the quotient.

3> Repeat step 1 & 2 until the number reaches zero.

4> Take the remainders and place them in a row, the first is right-most, the
last is left-most.

And that's it. To demostrate, we'll convert 35 to binary.

       0 R=1 -------
     ---	   !
   2)  1 R=0	   !
     ---	   !
   2)  2 R=0	   !
     ---	   v
   2)  4 R=0	   100011
     ---		~
   2)  8 R=1		!
     ---		!
   2) 17 R=1 ------------
     ---
   2) 35

There. Quite simple. The diagram would look somewhat better on paper, but this
will have to do in the mean while.


Hexadecimal
-----------

'Hex', as it is affectionately called by in most computerese dialects, is
nothing more than a base sixteen number system. Let's go through some basics.

It has 16 digits. These digits are the numbers 0-9, and the letters A-F. The
reason why the letters are included is because there aren't enough numbers.
Let's take a number, $4A. Note that when you see a '$' infront of a number, it
denotes that the number is a hex number. $4A means 4x16~1+10x16~0. The letters
are the numbers from 10-15, A being 10, B is 11, C=12, etc.

Conversion to decimal is exactly the same as for binary. To demostrate we'll
convert 10234 to hex.

	    0
       ------
    16)     2  R=7  ----
       ------	       v
    16)    39  R=15    7FA
       ------		 ~
    16)   639  R=10 -----/
       ------
    16) 10234


There we are! 10234 is $7FA.

One interesting fact: since 16=2~4, then a 4 digit binary number is equal to 1
hex digit, i.e. 1111=$F, 1010=$A, etc. This makes binary to hex, and vice versa,
conversion very easy. For example, the number $3A0 in binary is

  0011 1010 0000.
   ~	~    ~
   !	!    $0
   !	$a
   $3


This ends the discussion on number bases and now the reader should be aquianted
with binary and hex and what they mean. Digital is really only a binary digit.
In other words, a 1 or a 0. These are digital computers handle, strings upon
strigs of bits. Unfortunately, bits are very combersome, because even the
charcters that you see require 8 bits each. The screen size is 40x24, and that
adds up to 7680! bits!

A more convinient form are two digit hex numbers. A two digit hex number
represents 8 bits in only two digits. A more common name for this compact unit
is a byte.

You might know that your computer has 64K RAM. The K represents 1,024 bytes. So
this means that your computer has 65,536 bytes of RAM memory. 65,536 can be
expresses more conviniently as 2~16. This is important for reasons that we'll
discuss a little later.

Well, there we are! Now that we have some basics down, we can get to some
machine language.

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

***************************************
*				      *
*				      *
*   MACHINE LANGUAGE TUTORIAL DISK    *
*				      *
*      WRITTEN BY DR. FIRMWARE	      *
*				      *
*				      *
***************************************


PART II
=======

Machine language command structure.
-----------------------------------

Even though this sounds complicated, the structure of machine language commands
is quite simple. The command is one to three bytes long and consists of two
sections, the operator and the arguement. The operator is always one byte long
and the arguement is either zero, one or two bytes long. If the arguement is
zero bytes long, then it is said that there is no arguement for that command.

The accumulator
---------------

The accumulator is the primary register in the 6502 microprocessor. It is an 8
bit register, which means that it can handle only eight bits at a time or the
numbers from zero to 255.

To put numbers into the accumulator, we use a command called LDA which stands
for LoaD Accumulator. This command takes the value generated by the arguemant
and places it into the accumulator.

Addressing modes
----------------

Addressing modes are very important. These tell the computer how to deal with
the arguement that it recieves. We will only be dealing with two modes for the
present, immeadiate, and absolute.

In immeadiate addressing mode, the LDA command load the accummulator with the
actual value of the arguement. Suppose that we wanted to load the value $6F into
the accumulator. We would do this by telling the microprocessor to 'LDA #$6F'.
That is assembly language. In actual fact, the code used by the microprocessor
would represent it as '$A9 $6F'. The $A9 tells the microprocessor that you want
to load the accumulator in immeadiate addressing mode. The $6F is the arguement
and is treated as described above. So then, the number $6F is put directly into
the accumulator.

The LDA command in immeadiate addressing mode is two bytes long. The first byte
being the operator ($A9) and the second being the arguement.


Memory locations.
-----------------

The Apple computer has 2~16 memory locations. Each memory location is 8 bits
large. Each memory location can be referenced by a 4 digit hex number. A four
digit hex number is 2 bytes long and can be cut in half into two separate bytes.
The byte on the left is more significant than the one on the right, so the one
on the left is called the Most Significant Byte (MSB) and the one on the right
is the Least Significant Byte (LSB).

In absolute addressing mode, the LDA command takes the arguement as an address
and then takes the value held in that address and transfers it to the
accumulator. The arguement is two bytes long and it forms the address LSB first
and MSB second. The address is in effect backwards.

Say you wanted to load the accumulator with whatever was in location $456D. The
operator is $AD, this is followed by the LSB which is $6D, and finally the MSB,
$45.

Storing the accumulator.
------------------------

To move the contents of the accumulator to some other memory location, we use
the command STA, which stands for STore Accumulator.

The STA command has an absolute addressing mode. The hex operator is $8D and it
is followed by the LSB and MSB, in that order. After the command is executed,
the accummulator still contains the value.

Now we can make a tiny program to store the value $8D into location $2000.
First, we have to load it into the accumulator. To do this, we'll load the $8D
into the accumulator through the LDA immeadiate command. So, then we'll store
the accumulator into $2000 while it contains our value using the STA absolute
command.

In assembly language, our program looks like this:

LDA #$8D
STA $2000
RTS

Note: the '#' indicates that the command is in immediate addressing mode. The
RTS is going to be used as a general 'end' command for now, until I can explain
it's actual usage.

This assembly language version is not understandable by the microprocessor. It
has to be translated into hex codes. This translation is normally done by an
assenbly program, but since this is a short program, we'll do it by hand.

We are going to put this program at location $300-$306. This area can be used
for short programs as $300-$3b0 is free memory space. An extended memory map
will be included in a later edition.

LDA #$8d   -->	  $A9 8D
STA $2000  -->	  $8D 00 20
RTS	   -->	  $60

hex location	   contents
---------------------------
 $300		    $A9
 $301		    $8D
 $302		    $8D
 $303		    $00
 $304		    $20
 $305		    $60

The program can be entered into memory using the BASIC POKE command. $300 is
equal to 768 and the rest of the hex numbers you should be able to convert into
decimal yourselves.

This concludes PART II of the series. Coming next: X and Y registers.

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

********************************ª
**  P³ P-IÂsðIÑÝ¾!ÝÐ ½¹ÌÔ ½ÉÑ¼!(àA09£ÑLÔ 1=¼?¡½ÁÐ$0@; OQÉ°< Ì!ñA&Ü7-
And wue	 :0(	Q
Ä ääääàáàáàáàá<	$$$àáàáàá		àáàáàá			   	  			 	 	  	àá  	      	  	ster,
we use the LDX command. This command works in both immediate and absolute
addressing mode. The STX command stores the X register in an address the same
way as the STA command does, operator, LSB, and then the MSB.

The Y register it affected by the LDY and STY commands.


Absolute indexed addressing mode.
---------------------------------

The X and Y registers are also called 'index' registers. This is because they
can be used to index the accumulator to generate a 'flexible' address.

When one uses absolute addresing in loading the accumulator, then the program is
using a 'fixed' address, in that the address reference remains the same all the
time. This is desirable, but there are instances which require a certain byte
within a range of memory depending on other factors. Providing the range is
small (2-4 locations), one can do it with some branching commands, but if it
goes beyond 10 locations, this can become a nightmare. Indexing provides a very
simple solution. When using the LDA command in absolute indexed addressing mode,
the X or Y register (the register that will be used is specified by the
operator, there is one opertaor for each register ($BD for indexing with X and
$B9 for Y.) For the discussion we'll assume that the X register is being used to
index the accumulator) is added to the value of LSB the address in the arguement
(carry is considered) and then the accumulator is loaded with the contents of
the resulting address.

For example, suppose the X register holds $50 and the program executed a command
LDA $2000,x. The LDA is to tell us that we want to load the accumulator with a
number. The '$2000,x' tells us that we'll be using absolute indexed addressing
and that the indexing register is the X register. This is what happens in the
circuitry: We take the 'base' address, $2000, and add the value of the X
register to the LSB. This gives us $2050. The contents of that location is then
copied into the accumultor.

As you can see, the X register is used to 'offset' the accumulator and it
produces various addresses as the value in the X changes. Also since the X
register can only hold the numbers from 0-255, then you can only offset by that
much.

Storing in absolute indexed is exactly like loading. The same principle applies
except that instead of transfering a byte from memory to the accumulator, you're
transfering a byte from the accumulator to memory.

There also exists an LDY absolute indexed X, that is, load Y absolute, but add X
to the LSB of the address, and an LDX absolute indexed Y. These are useful when
the accumulator is busy holding some important data. Unfortunately, you cannot
store either X or Y register indexed in absolute addressing mode.

Indexing is quite useful at times. However, the usefulness will be exposed to a
much greater depth in the next installment when we cover branching. I will leave
for now with some notes on memory orginization.


64K....
-------

That is the total directly addressable memory that your apple computer has. Now
wait, I know, you've got a 128K card sitting in slot 0, that's fine and dandy,
but it's not all availble at once. For now, just consider a basic 48K system,
and later I'll tell you how the ramcards work.

64K is equal to $10000, or $0 through $FFFF, memory locations. (In the latter
case, location $10000 is the same as location $0.) This is subdivided into 256
$100 byte pages. Page zero would be locations $0000 through $00FF, page one
would be $0100-$01FF, etc...

Zero page (page zero, if you prefer) is special. In this range of memory, there
exists many pointers, flags and other stuff that is very crucial to the smooth
operation of BASIC. One of the reasons why is because the MSB of all the
locations is zero.

Page one is reserved for the hardware stack. You'll know all about it in a short
while.

Page two is reserved by the BASIC input routine. We'll cover that very soon,
too.

Page three is mostly free programmimg space. You might notice that most of the
shorter programs that we will write will be located in this area.

Pages four to seven ($400-$7FF) are the primary text screen. (Yes, there are two
text screens.)

From $800 to $95FF is BASIC programming space (or M.L. space if you want it).

Under DOS 3.3, from $9600 to $BFFF is taken by DOS.

From $C000-$CFFF is periphreal softswitches and PROM programming space.

And finally, $D000 to $FFFF is taken up by ROM.

Your basic Apple memory map. Of course, we'll be expanding on it greatly, but
for now, this is it.

=======================================
