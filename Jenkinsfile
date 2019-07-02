properties([parameters([string(defaultValue: '.', description: 'Path to your CSV file', name: 'CSV_File_Path', trim: false)])])
properties([parameters([choice(choices: ['DISTINCTION', 'FIRST', 'SECOND', 'THIRD', 'FAIL'], description: 'select choices from drop down list to see sorted students list based on division scored', name: 'DIVISION')])])
node{
 
      stage('SCM checkout')
    {
       git url: 'https://github.com/0ds/utility.git', branch: "master"
     }
      stage('Rank_Calculation')
    {
       source ./Rank_calculator.sh
       COMPUTE_RANK $CSV_File_Path $DIVISION
     }
}
