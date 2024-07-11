import subprocess
import os
def run_command(command):
    result = subprocess.run(command, shell=True, capture_output=True, text=True)
    if result.returncode != 0:
        print(f"Error running command: {command}")
        print(f"Error: {result.stderr}")
    else:
        print(result.stdout)

def main():
    while True:
        command_flag = input("Enter Your Desired Command (init, plan, apply, Clear, exit): ").strip().lower()
        
        if command_flag == "exit":
            print("Exiting the script...")
            break
        elif command_flag == "init":
            print("Initializing Terraform...")
            run_command("terraform init")
        elif command_flag == "plan":
            print("Planning Terraform...")
            run_command("terraform plan")
        elif command_flag == "apply":
            print("Applying Terraform...")
            run_command("terraform apply -auto-approve")
        elif command_flag == "clear":
            os.system('clear')
        else:
            print("Invalid command. Please enter 'init', 'plan', 'apply', or 'exit'.")
        print("\n" + "="*40 + "\n")

if __name__ == "__main__":
    main()
