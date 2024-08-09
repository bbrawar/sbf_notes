import os
import glob

a=glob.glob('./../PolaRxPro/*/*_')

for i in a:
    j = i.split('/')
    directory = j[-2]
    # Check if the directory exists before creating it
    if not os.path.exists(directory):
        os.mkdir(directory)
    temp = j[-1].split('.')
    fout = temp[0] + '.csv'
    #print(fout)
    temp=j[:-1]
    temp.append(fout)
    fout_path=os.path.join(*temp)
    #print()
    #print(fout_path)
    #os.system(sbf2ismr -f i -r fout_path)
    command = f"sbf2ismr -f {i} -r {fout_path}"
    os.system(command)
