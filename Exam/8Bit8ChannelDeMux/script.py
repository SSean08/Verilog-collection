import sys
import shutil
import os
import subprocess
import re

# CONSTANTS

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

    python script.py c ["project name"] ["test bench file"] = compile code
    python script.py r ["project name"] = clean compiled code
    python script.py n ["project name"] = create new project
"""

# GTK WAVE file format
WAVE = "wave.vcd"

# Compiled/Synthesized code
SYN = "syn.vvp"

# Test bench main file
TB = "main.v"

# Function that will find the dumpfile name given the testbench code for automation
def get_signal_dump_file(code):
    # \s* handles zero or more whitespace characters
    pattern = r'\$dumpfile\("([^"]+)"\);'
    dumpfile_name = re.search(pattern, code)
    if dumpfile_name is None:
        return dumpfile_name
    else:
        return dumpfile_name.group(1).strip()


# Functions
def compile(args):
    if len(args) > 2:
        # has arguments, validate
        project_name = args[2]
        full_path = os.path.join(os.getcwd(), project_name)

        if os.path.isdir(full_path):

            print("Project found")

            if os.path.exists(os.path.join(full_path, TB)):
                # Check main.v

                # Reset old compiled code before compilation
                print(f"Cleaning old compiled code...")
                reset(args)

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
                    os.system(f"gtkwave {os.path.join(full_path, WAVE)}")

                else:
                    print(f"Please name the signal dumpfile as \"{WAVE}\"")

            else:
                print("Project main file does not exist, exiting...")
        elif os.path.isfile(full_path):
            # Passed file is test bench
            project_dir = os.getcwd()

            try:
                with open(full_path, 'r') as tb:
                    testbench_code = tb.read()
                    dumpfile_name = get_signal_dump_file(testbench_code)
                    if dumpfile_name != None:
                        print(f"Compiling project \"{project_name}\"")

                        # Clean old compiled code
                        print(f"Cleaning old compiled code...")
                        if os.path.exists(os.path.join(project_dir, SYN)):
                            os.remove(os.path.join(project_dir, SYN))
                        if os.path.exists(os.path.join(project_dir, dumpfile_name)):
                            os.remove(os.path.join(project_dir, dumpfile_name))

                        subprocess.run(
                            ["iverilog", "-o", SYN, full_path],
                            cwd=project_dir
                        )

                        subprocess.run(
                            ["vvp", SYN],
                            cwd=project_dir
                        )

                        if os.path.exists(os.path.join(project_dir, dumpfile_name)):
                            os.system(f"gtkwave {os.path.join(project_dir, dumpfile_name)}")
                        
                    else:
                        print(f"Test bench {project_name} does not have a dumpfile, exiting...")

            except FileNotFoundError:
                print(f"Testbench {project_name} does not exist, exiting...")
                    

        else:
            print(f"Project {full_path} or testbench does not exist, exiting...")
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
                os.system(f"gtkwave {os.path.join(full_path, WAVE)}")
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
            if os.path.exists(os.path.join(full_path, SYN)):
                os.remove(os.path.join(full_path, SYN))
            if os.path.exists(os.path.join(full_path, WAVE)):
                os.remove(os.path.join(full_path, WAVE))
        else:
            print(f"Project {project_name} does not exists, exitting...")
    else:            
        full_path = os.getcwd()

        # Check if Wave file and Synthesized file exists
        if os.path.exists(os.path.join(full_path, SYN)):
            os.remove(os.path.join(full_path, SYN))
        if os.path.exists(os.path.join(full_path, WAVE)):
            os.remove(os.path.join(full_path, WAVE))


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

    
        
            
