cat rebase.sh
#!/bin/bash
# display command line options
count=1
for param in "$@"; do
<<<<<<< HEAD
<<<<<<< HEAD
    echo "\$@ Parameter #$count = $param"
=======
    echo "Parameter: $param"
>>>>>>> dc4688f... git 2.3 rebase @ instead *
    count=$(( $count + 1 ))
done







 














=======
    echo "Next parameter: $param"
    count=$(( $count + 1 ))
done

echo "====="
>>>>>>> a199fa3 (git-rebase 2)

