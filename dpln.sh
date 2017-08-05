 #!/bin/bash
 #dpĺn - deploying ror with git and heroku
 #by victorf - www.victorf.ch
 
 #1st argument: your branch
 #2st argument: comment your commit 
 #example: bash dpln.sh yourbranch 'a good comment'
 
 
{ 
     # "try"

          echo '* * * * * * * [DPLN] * * * * * * * * 
     ' && echo '
     ' && echo ' deployin using ror + git + heroku   
     ' && echo '     by victorf (www.victorf.ch)     
     ' && echo '                                     
     ' && echo '   								    
     ' && echo '     ᕕ(╯°□°)╯︵ ┻━┻    				
     ' && echo '                                     
     ' && echo '        precompilin da fuckin assets!     
     ' && echo '                                     
     ' && rake assets:precompile && echo '
     ' && echo '     ʕ •ᴥ•ʔ
     ' && echo '
     ' && echo '        addin 2 da stage...  
     ' && echo '
     ' && git add --all && echo '
     ' && echo '     ⅽ[ː̠̈ː̠̈ː̠̈]
     ' && echo '
     ' && echo '     		 commitin em all...
     ' && echo '
     ' && git commit -m '$2' && echo '
     ' && echo '     ಠ_ಠ
     ' && echo '
     ' && echo '        pushin ur branch 2 heroku...
     ' && echo '
     ' && git push heroku $1 && echo '
     ' && echo '     ლ(ಠ益ಠლ)
     ' && echo '
     ' && echo '        really deployin now...
     ' && echo '
     ' && git push heroku $1:master && echo '
     ' && echo '     (งツ)ว
     ' && echo '
     ' && echo '        restartin dis mothafucka!
     ' && echo '
     ' && heroku restart && echo '
     ' && echo '     (งツ)ว
     ' && echo '
     ' && echo '        precompilin da fuckin assets again!
     ' && echo '
     ' && heroku run rake assets:precompile && echo '
     ' && echo '     (งツ)ว
     ' && echo '
     ' && echo '        & restartin dis mothafucka again!
     ' && echo '
     ' && heroku restart && echo '
     ' && echo '     ◦°˚\(*❛‿❛)/˚°◦'
} || {
     # "catch"
     echo '* * * * * * * [SHIT] * * * * * * * *' 
     echo '                                           ' 
     echo '     ¯\_(ツ)_/¯ [ERROR]                    '
     echo '                                           '
     echo '        just read the logs above, ok?  '
}

echo '
' && echo '                       [THE END]
' && echo '- - - - - - - - - - - - - - - - - - -'
