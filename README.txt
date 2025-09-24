This is the Incident Response Triage script for the Digital Forensics Course at the University of Tulsa.
The goal of this script is to quickly triage systems.

It is suggested to include:

System Information & Environment

    Collect hostname, OS version, system time.
    Check uptime, current users, and environment variables.

Running Processes & Services

    Script commands to list active processes, services, and parent/child relationships.
    Include checks for anomalies (unknown executables, suspicious names, etc.).

Network Connections

    Script commands to list active TCP/UDP connections and listening ports.
    Capture ARP table, routing table, and DNS cache.

Persistence & Startup Items

    Identify scheduled tasks, autoruns, and startup registry keys (Windows) or cron jobs (Linux).

Devices & Storage

    Identify mounted drives, connected USB devices, and recent media insertions.

Logs & Event Traces

    Script pulling security/system/application logs.
    Define what log windows (last 24h, last 7d) to capture.