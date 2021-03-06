$TestsPath = Split-Path $MyInvocation.MyCommand.Path

$RootFolder = (get-item $TestsPath).Parent

Push-Location -Path $RootFolder.FullName

set-location -Path $RootFolder.FullName

Import-module ".\PWSHSchool" -force

  $Path = "$PSScriptRoot\..\Classes\Private"
  $PrivateClasses = gci "$Path" -Filter "*.Class.ps1" | Select -Expand FullName | sort -Descending
    foreach($c in $PrivateClasses){
        . $c
    }


Describe "Testing Class PWSHSchool Step" {
    Context "Base functionality" {
        it "[PWSHSchool][Class][Step] Creating an instance" {
            {[Step]::new(".\Lessons\Variable_Datatypes\Step1\Step.json")} | should not throw
        }
    }

    Context "Properties" {

        $Step = [Step]::new(".\Lessons\Variable_Datatypes\Step1\Step.json")

        it "[PWSHSchool][Class][Step] The Title Property should not be empty" {
            $Step.Title | should not BeNullOrEmpty
        }
        
        it "[PWSHSchool][Class][Step] The Title Property should be of type 'String'" {
            $Step.Title | should BeOfType String
        }

        it "[PWSHSchool][Class][Step] The Description Property should not be empty" {
            $Step.Description | should not BeNullOrEmpty
        }

        it "[PWSHSchool][Class][Step] The Hint Property should not be empty" {
            $Step.Hint | should not BeNullOrEmpty
        }
        
        it "[PWSHSchool][Class][Step] The Test Property should not be empty" {
            $Step.Test | should not BeNullOrEmpty
        }

        it "[PWSHSchool][Class][Step] The Path Property should not be empty" {
            $Step.Path | should not BeNullOrEmpty
        }

        it "[PWSHSchool][Class][Step] The Template Property should not be empty" {
            $Step.Template | should not BeNullOrEmpty
        }
    }
}