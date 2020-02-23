#bin/bash
mapping_file=$1

if [[ $mapping_file = "-h" ]]; then
    cat << EOF
    Usage:
    ./unmap.sh <mapping_file>
    If <mapping_file> is empty, it will be replacing by 'mapping.txt'
EOF
exit 1
fi


if [ -z "$1" ]; then
    mapping_file="mapping.txt"
fi
echo "Mapping file: $mapping_file\n"

echo "Paste stack-trace and RE-ENTER to de-obfuscate:\n"
stacktrace=$(sed '/^$/q')

echo "$stacktrace" > stacktrace.txt 
echo "\n\n================ Stacktrace ===============\n"
java -jar retrace.jar -verbose $mapping_file stacktrace.txt
rm -rf stacktrace.txt

exit 1
