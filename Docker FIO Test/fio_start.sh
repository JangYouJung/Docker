#!/bin/bash

# install fio package and make output directory
mkdir test_output

#bash ./create_jobfile.sh

# set numjobs array and test fio
job_array=(2 4 6 8 10 12 14 16 18 20 22 24)
rw_array=("randread" "randwrite")
fio="./fio/fio"

for rw in ${rw_array[@]};do
        for numjobs in ${job_array[@]}; do
                input="${rw}.fio"
                output="${rw}_${numjobs}.txt"
                options="--numjobs=${numjobs}"

                echo "[---[test] fio job"${numjobs}"_file---]"
                ${fio} ${input} ${options}>> ./test_output/${output}
                echo "[---[done] fio job"${numjobs}"_file is done---]"
        done
done

echo "test is done. please check test_output directory in host server"

sshpass -p "[password]" scp -o StrictHostKeyChecking=no -r "./test_output" yuejeong@"[server IP]":/home/yuejeong/volume/