import sys
import shutil
import os
import subprocess

# CONSTANTS

CODE = """
test
"""

# Quick commands menu
QUICK_COM = """
    Quick operations:
    c = compile
    r = clean compiled code
    h = help
"""

HELP = """
    c = compile
    r = clean compiled code
    n = create new iverilog project
    h = help

    Omitting project name will do the operation in the current directory where this python script is located

    python script.py c ["project name"] = compile code
    python script.py r ["project name"] = clean compiled code
    python script.py n ["project name"] = create new project
"""

# GTK WAVE file format
WAVE = "wave.vcd"

# Compiled/Synthesized code
SYN = "syn.vvp"

# Test bench main file
TB = "main.v"


# Functions
def compile(args):
    if len(args) > 2:
        # has arguments, validate
        project_name = args[2]
        full_path = os.path.join(os.getcwd(), project_name)

        if os.path.exists(full_path):

            print("Project found")

            if os.path.exists(os.path.join(full_path, TB)):
                # Check main.v

                print(f"Compiling project \"{project_name}\"")

                subprocess.run(
                    ["iverilog", "-o", SYN, TB],
                    cwd=full_path
                )

                subprocess.run(
                    ["vvp", SYN],
                    cwd=full_path
                )

                if os.path.exists(os.path.join(full_path, WAVE)):
                    os.system(f"gtkwave {os.path.join(full_path, WAVE)} &")
                    os.system("clear")

                else:
                    print(f"Please name the signal dumpfile as \"{WAVE}\"")

            else:
                print("Project main file does not exist, exiting...")

        else:
            print(f"Project {project_name} does not exist, exiting...")
    else:
        full_path = os.getcwd()
        if os.path.exists(os.path.join(full_path, TB)):
            print(os.path.join(full_path, TB))
            # Check main.v

            subprocess.run(
                ["iverilog", "-o", SYN, TB],
                cwd=full_path
            )

            subprocess.run(
                ["vvp", SYN],
                cwd=full_path
            )

            if os.path.exists(os.path.join(full_path, WAVE)):
                os.system(f"gtkwave {os.path.join(full_path, WAVE)} &")
                os.system("\n")
            else:
                print(f"Please name the signal dumpfile as \"{WAVE}\"")

        else:
            print("Project main file does not exist, exiting...")


        


def reset(args):
    if len(args) > 2:
        # has arguments, validate
        project_name = args[2]
        full_path = os.path.join(os.getcwd(), project_name)

        if os.path.exists(full_path):
            
            # Check if Wave file and Synthesized file exists
            if os.path.exists(os.path.join(full_path, SYN)) and os.path.exists(os.path.join(full_path, WAVE)):
                os.remove(os.path.join(full_path, WAVE))
                os.remove(os.path.join(full_path, SYN))
            else:
                print(f"Project {project_name} clean")
        else:
            print(f"Project {project_name} does not exists, exitting...")
    else:            
        full_path = os.getcwd()

        # Check if Wave file and Synthesized file exists
        if os.path.exists(os.path.join(full_path, SYN)) and os.path.exists(os.path.join(full_path, WAVE)):
            os.remove(os.path.join(full_path, WAVE))
            os.remove(os.path.join(full_path, SYN))
        else:
            print(f"Project is clean")


def new(args):
    if len(args) > 2:
        # has arguments, validate
        project_name = args[2]
        full_path = os.path.join(os.getcwd(), project_name)
        script = os.path.join(os.getcwd(), args[0])

        if os.path.exists(full_path):
            print(f"Project with name \"{project_name}\" exists")
        else:
            os.mkdir(full_path)
            shutil.copyfile(script, os.path.join(full_path, args[0]))
    else:
        print("No project name given, exitting")




if __name__ == "__main__":

    if len(sys.argv) <= 1:
        # only the script name, so execute interactively
        print("Unknown command, do \"python script.py h\" for help")          
    else:
        # validate
        match sys.argv[1]:
            case "c":
                compile(sys.argv)
                
            case "r":
                reset(sys.argv)
                
            case "n":
                new(sys.argv)
                
            case "h":
                print(HELP)
                
            case _:
                print("Unknown command, do \"python script.py h\" for help")          

    
        
            
