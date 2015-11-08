# Ascii-gen
Turns an image into an (extended) ascii-art picture

## Techinal overview

For any color image, this estimates which ascii character would best represent a certain segment of an image, and records that character for later use. Written primarily in GNU octave, I needed to add an additional Java program to actually display the image (octave didn't like printing out the characters given my data formats).

In essence, the program uses edge detection to find where lines should be drawn, recombines the edges with the original image (to get some influence of image brightness), and then tries to find the best characters to represent the processed image in text.

Currently, it does this by simply treating the provided charset as a series of vectors, and finding the "closest" vector in that set to any given subset of the input image (18 x 8 pixels). It does allow for some translation of the characters through convoluting the two inputs rather than just computing their dot product.

## Usage

In Octave, first ```load "chars.mat"``` must be called to load the character matrices (```w```) and the ascii string (```ascii```).

This ascii string isn't used, but printing it out shows which indices correspond to which characters.

After that run ```[cls,M] = asciigen("inputimage", edgeweight, w)```, where ```inputimage``` is the location of an image to ASCII-fy, ```edgeweight``` is the balance of edges to brightness (from 0 to 1).

This outputs the matrix ```cls```, whose values point to the index of a character in ```ascii```, and ```M```, the result of combining the edges and the original image (used for debugging)

Then I usually do ```save "test.mat" cls``` to save ```cls``` to file. This allows you to copy it more easily into another program to actually display the output.

I use ```Ascii.java```, but any program that can translate the indices into characters will work.

You mileage may vary. Be warned.

                                                                                          
      | _…m                     mw……_¸               ¸_……wm                       w…[     
            ¸_wm          mw_¸                               ¸_wm            w…¸    |     
       |         ¸_wm W…¸                                         ¸…‰   w…¸        ’      
                                                                                   |      
        ’                                                                                 
        |                                                                         [       
         ’                                                                                
         |                                                                       [        
         ,                                                                       [        
        ¸                  ˆ˜™™™™˜                       ˜™™™™™˜                  ,       
       ¸                `P         ¶'                 'P         ¶’                ,      
      ,                '             ¶               f             !                L     
     |                        |   .   ]                     ,   .                    |    
     ¸                        ¶˜ ˆ”   ]                     ¶˜ ˜P                    ,    
                       ,             g               L             ,                      
    |                   ¸w          ¸                 .‰         w¸                   |   
    |                      ¸_…………¸                       ¸_………_¸                      |   
                                                                                          
     ’                                                                               ’    
     |                              `PMM        MMMM“`                               |    
      ’                             ,      mmm       ,                              ’     
       ’                             ,   ¶      ’   ,                              '      
        ’                 ¶           .   ¶’  `P   ,         `  ¶                 ’       
         ³                 |            L   ¶”   d¸          |  |                ’        
          ¶`            ,   ¶            .‰     ¸           ’   ¸              `P         
            ”            .    ¶˜`     ˜”M        M™ˆ     ˜”    ¸             `“           
              ”`           ¸‰             W¸¸ ¸‰             ,             `“             
                ¶˜            ¸……wwwww…_¸        ¸_…wwmww…_¸             ˜P               
                   ™ˆ                                                 ˜™                  
                      ¶™`                                         `”M                     
                          M™˜                                `˜™M                         
                                M™™˜ˆ                 ˜˜™™M                               
                                                                                          
                                                                                          

## FUTURE ADDITIONS (possibly)

- Kernelize the input segments so that it represents linear sections of the input better
- Keep searching for a better edge detection algorithm (currently Canny, although it doesn't give gradients which can be useful)
- Find some way to emphasize connecting edges between blocks/penalizes rogue edges (like for those found in 'X')
