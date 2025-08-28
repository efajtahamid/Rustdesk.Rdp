import psutil
import subprocess
import time

# CPU usage threshold in percent
THRESHOLD_PERCENTAGE = 30

# Processes to exclude from termination (essential for RDP/VM)
EXCLUDED_PROCESSES = ['devenv.exe', 'HopToDesk.exe', 'msedge.exe', 'RustDesk.exe', 'provisioner.exe']

print("⏱️  Timelimit Monitor Started... Monitoring CPU usage.")

while True:
    for process in psutil.process_iter(['pid', 'name', 'cpu_percent']):
        name = process.info['name']
        if name and name not in ['Idle', 'System Idle Process']:
            cpu = process.info['cpu_percent']
            if cpu > THRESHOLD_PERCENTAGE and name not in EXCLUDED_PROCESSES:
                print(f"⚠️ High CPU Usage detected: {name} ({cpu}%)")
                try:
                    subprocess.run(['taskkill', '/F', '/IM', name], check=True)
                    print(f"✅ Terminated process: {name}")
                except subprocess.CalledProcessError:
                    print(f"❌ Failed to terminate process: {name}")
    time.sleep(10)  # Wait 10 seconds before checking again
