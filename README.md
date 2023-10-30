# helicopter-data

The elevatr_trial.R file is the original R file that was sent over. You can run it with the dataset at this [link](https://trello.com/1/cards/652d9a0206a46fae8fdc815a/attachments/652f1249b7e48d4337f8155c/download/truncate_tracts.csv).

Once you download both files you will need to alter both the csv and R file.

## truncate_tracts.csv edits
In the terminal run the following command: `sed 's/c(\(.*\))/\1/' truncate_tracts.csv > truncate_tracts.csv` You can change the output if you don't want to have it replace the original csv file. Then at the top of the file, change "geometry" and "GEOID" to "longitude" and "latitude" respectively.

## elevatr_trial.R edits
First you need to edit the file path to reflect where your file is actually stored. Then you should be able to run the file properly.

## Optimization Notes:
`10/25/23` 
- You can optimize the get_elev_point() function by changing the src from "epqs" to "aws". This will switch it to using the AWS servers. Also add a z=10 parameter which will increase the accuracy of the AWS server. You can find the documentation [here](https://www.rdocumentation.org/packages/elevatr/versions/0.4.5/topics/get_elev_point)
- Move onto batching and parallelization of the code.
