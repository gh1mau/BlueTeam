## Masta Ghimau's Windows Logon Counter (MGWLC)

## Script Description:

The "Masta Ghimau's Windows Logon Counter (MGWLC)" script is designed to audit and count Windows Logon events based on **Event ID 4624**, in compliance with Information Security Management System (ISMS) audit requirements, specifically for "Pemantauan *Logon Server*", Annex 8.15. The script allows you to input a specific year and then collects and analyzes logon events from the Windows Event Log, summarizing logon counts by month, and determining a logon threshold for further evaluation.

## Script Flow

```mermaid
graph TD
A[Start] --> B[Input Year]
B --> C[Fetch Security Log Events]
C --> D[Count Logon Events by Month]
D --> E[Sort Months Chronologically]
E --> F[Calculate Logon Threshold]
F --> G[Get Computer & User Info]
G --> H[Display Info and Threshold]
H --> I[End]
```

> * Note: Logon threshold, which is set as the maximum logon count plus 10%, rounded to the nearest hundred. (Don't ask me why huhuhu)

Below are few Event ID's that is worth to analyzed for proper and more comprehensive monitoring

| Event ID | Description                                   |
|----------|-----------------------------------------------|
| 4624     | An account was successfully logged on         |
| 4625     | An account failed to log on                   |
| 4634     | An account was logged off                    |
| 4647     | User initiated logoff                        |
| 4648     | A logon was attempted using explicit credentials |
| 4774     | An account was mapped for logon              |
| 4776     | The domain controller attempted to validate |
| 4778     | A session was reconnected to a Window Station |
| 4779     | A session was disconnected from a Window Station |
| 4800     | The workstation was locked                   |
| 4801     | The workstation was unlocked                 |

## Instructions:

 - Note: Before running the script, ensure that you have the necessary
   permissions and that you're running the script on a Windows system
   with PowerShell.
 - Download the "logon.ps1" script to your local machine or server.
 - Open a PowerShell terminal on your Windows machine.
 - To run the script, use the .\ (dot-slash) notation followed by the
   script name: `.\logon.ps1`
 - The script will prompt you to enter the year you want to analyze.
   Enter the desired year and press Enter.
 - The script will execute and display the results on the PowerShell
   terminal, including the logon counts, logon threshold, computer name,
   user count, and more.
 - Review the output to understand the logon activity based on the
   specified year and the logon threshold. The script will provide
   relevant information about logon events.


## Opportunities for enhancement:

 - **Multi-Year Analysis:** Extend the script to support the analysis of
   logon events across multiple years for historical data comparison.
 - **Interactive Reports:** Generate interactive reports with charts and
   graphs to provide a visual representation of logon activity trends.
 - **Custom Event IDs:** Allow users to specify custom Event IDs for logon
   events to make the script more flexible.
 - **Script Automation:** Create automation scripts to schedule the script's execution at regular intervals.
 - **Enhanced Filtering:** Provide advanced filtering options for logon events, including specifying time frames and logon types.
 - **Custom Output Formats:** Allow users to specify custom output formats for reports, such as WORD, HTML, PDF, or CSV.
 - **Scalability:** Ensure that the script can handle a growing volume of
   logon events without degradation in performance.
 - **User Input for Custom Threshold:** Modify the script to prompt the user for their desired logon threshold value.
