````markdown
# WeatherInShell

A simple shell scripting project to automate weather data logging, evaluate forecast accuracy, and generate weekly insights.

## Overview

This project is built using pure bash scripts and focuses on:

- Periodic weather data collection  
- Forecast vs actual temperature comparison  
- Accuracy classification (excellent, good, fair, poor)  
- Weekly summary generation  

It is designed to be lightweight, automated, and easy to understand.

## Project Structure

- `rx_poc.sh` → Main script for fetching and storing weather data  
- `fc_accuracy.sh` → Computes forecast accuracy using historical logs  
- `weekly_stats.sh` → Generates weekly aggregated statistics  
- Output files → Auto-generated logs and reports (no manual edits needed)  

## How It Works

1. `rx_poc.sh` runs on a schedule and logs weather data  
2. It calls `fc_accuracy.sh` to compare:
   - Yesterday forecast  
   - Today actual temperature  
3. Accuracy is calculated and categorized  
4. `weekly_stats.sh` aggregates data into weekly insights  

## Automation Using Cron

Edit crontab:

```bash
crontab -e
````

Add:

```bash
10 * * * * /path/to/rx_poc.sh
```

This executes the script at the 10th minute of every hour.

## Setup Instructions

Make all scripts executable:

```bash
chmod +x *.sh
```

Ensure:

* Correct file paths are used
* Input log file (`rx_poc.log`) exists
* Scripts are in the same directory or paths are updated

## Output

The project generates:

* `rx_poc.log` → Raw weather data
* `historical_fc_accuracy.tsv` → Accuracy tracking
* Weekly stats report → Summary insights

## Notes

* No external dependencies required
* Works on any Unix or Linux system
* Focused on simplicity and automation
* Good practice project for bash scripting and cron jobs
