# PH4WSL1.cmd (Pi-hole for Windows)

Installer script to make [Pi-hole](https://github.com/pi-hole) run reliably under Windows 10/11 (or Windows Server 2019/2022) using Windows Subsystem for Linux.  
 - For a quick overview, watch the [installation walk-through](https://youtu.be/keDtJwK65Dw) on YouTube

**Latest Updates for 2022-01-08:**  

 - Less Pi-hole code is patched since upstream moved from ``lsof`` to ``ss`` for port and service checking.  Now a wrapper for ``ss`` on WSL1 reformats the output of ``netstat.exe`` into something Pi-hole can work with.
 - Integrated [**Unbound DNS Resolver**](https://www.nlnetlabs.nl/projects/unbound/about) and set default Pi-hole configuration to use encrypted DNS
 - Updated to Debian 11
 - Fixes for Windows 11 compatibility 
 - Addded links in the install folder for updater ``Pi-hole Updater.cmd`` and web admin ``Pi-hole Web Admin.cmd`` 
 - Debian self-updates using its built-in '[unattended-upgrades](https://wiki.debian.org/UnattendedUpgrades)' mechanism 

**Pi-hole on Hyper-V Server 2019 (Server Core) with 768MB RAM:**
![Install Complete](https://user-images.githubusercontent.com/33142753/119683187-d3b13d00-be19-11eb-8ed1-344fba3b6fdf.png)

Note: There is no endorsement or partnership between this page and [**Pi-hole© LLC**](https://pi-hole.net).  They deserve [your support](https://pi-hole.net/donate/) if you find this useful.

By utilizing the Windows Subsystem for Linux it is possible to run Pi-hole on a Windows 10 PC just like any other Windows app.  The install script performs an automated install of Pi-hole on Windows 10 (version 1809 and newer) or Windows Server 2019 (including 'free' Hyper-V Core) - No Virtualization, Docker, or Linux expertise required.  Pi-hole can be used to block ads and encrypt DNS queries for your local Windows PC or entire network. 

Pi-hole for Windows is a great way to [upcycle](https://en.wikipedia.org/wiki/Upcycling) old hardware. If you have a Windows PC, tablet, or HDMI stick with 1GB RAM and it can boot Windows 10 x64 you are good to go.  This installation method uses fewer resources than other hypervisor/container solutions, and runs on older CPU models without VT, or cloud instances that don't support [nested virtualization](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/user-guide/nested-virtualization)   

**INSTRUCTIONS:**  Copy [**PH4WSL1.cmd**](https://github.com/DesktopECHO/Pi-Hole-for-WSL1/raw/master/PH4WSL1.cmd) to your computer, right click the file and select **"Run as Administrator."**  

Download and configuration steps complete in 5-20 minutes, depending on your hardware and antivirus solution.  If Windows Defender is active the installation will take longer.  Some users have reported issues with [other antivirus products](https://github.com/DesktopECHO/Pi-Hole-for-WSL1/issues/14) during installaion.

**This script performs the following steps:**

* Enable WSL1 and download the official Debian image from [**salsa.debian.org**](https://salsa.debian.org/debian/WSL/-/raw/master/x64/install.tar.gz) 

* Download the [**LxRunOffline**](https://github.com/DDoSolitary/LxRunOffline) distro manager and install Debian

* Perform interface/gateway detection and create a **/etc/pihole/setupVars.conf** file for automated install

* Run the [official installer](https://github.com/pi-hole/pi-hole/#one-step-automated-install) from Pi-hole©

* Create shim so Pi-hole gets the expected output from ``/bin/ss`` along with other fix-ups for WSL1 compatibility.

* Add exceptions to Windows Firewall for DNS and the Pi-hole admin page

* **NOTE:** After the install completes, the Scheduled Task **needs to be configured** for auto-start at boot (before logon).  
   - Open Windows Task Scheduler (taskschd.msc) and right-click the **Pi-hole for Windows** task, click edit.  
   - On the *General* tab, place a checkmark next to both **Run whether user is logged on or not** and **Hidden**  
   - On the *Conditions* tab, un-check the option **Start the task only if the computer is on AC power**

**Additional Info:**

* DHCP Server is not supported and has been removed from the UI.

* IPv6 DNS now works in addition to IPv4.

* To reset or reconfigure Pi-Hole, run **Pi-hole Configuration.cmd** in the Pi-hole install folder.

* To completely uninstall Pi-Hole, open the Pi-hole install folder in Windows Explorer.  Right-click ``Pi-hole Uninstall.cmd`` and click **Run As Administrator.**  If you are uninstalling or reinstalling and need to retain your Pi-hole's configuration, export it first via the web interface. 

**Trimmed console dump and screenshots:**

```
---------------------
 Pi-hole for Windows
--------------------- 
Set location for 'Pi-hole' install folder or hit enter for default [C:\Program Files] -> 

Pi-hole will be installed in "C:\Program Files\Pi-hole" and Web Admin will listen on port 80
Press any key to continue . . .

This will take a few minutes:  Installing Debian -> Compacting the install -> Install dependencies
Extracting templates from packages: 100%

Launching Pi-hole installer...

  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   145  100   145    0     0    362      0 --:--:-- --:--:-- --:--:--   364
100  121k  100  121k    0     0   100k      0  0:00:01  0:00:01 --:--:--  222k

  [✓] Root user check

        .;;,.
        .ccccc:,.
         :cccclll:.      ..,,
          :ccccclll.   ;ooodc
           'ccll:;ll .oooodc
             .;cll.;;looo:.
                 .. ','.
                .',,,,,,'.
              .',,,,,,,,,,.
            .',,,,,,,,,,,,....
          ....''',,,,,,,'.......
        .........  ....  .........
        ..........      ..........
        ..........      ..........
        .........  ....  .........
          ........,,,,,,,'......
            ....',,,,,,,,,,,,.
               .',,,,,,,,,'.
                .',,,,,,'.
                  ..'''.

  [✓] Update local cache of available packages
  [i] Existing PHP installation detected : PHP version 7.4.3
  [i] Performing unattended setup, no whiptail dialogs will be displayed

  [✗] Checking apt-get for upgraded packages
      Kernel update detected. If the install fails, please reboot and try again
  [i] Installer Dependency checks...
  [✓] Checking for dhcpcd5
  [✓] Checking for git
  [✓] Checking for iproute2
  [✓] Checking for whiptail
  [✓] Checking for dnsutils

  [✓] Supported OS detected
  [i] SELinux not detected
  [✗] Check for existing repository in /etc/.pihole
  [i] Clone https://github.com/pi-hole/pi-hole.git into /etc/.pihole...HEAD is now at 0d8ece1 Merge pull request #3889 from pi-hole/release/v5.2.1
  [✓] Clone https://github.com/pi-hole/pi-hole.git into /etc/.pihole

  [✗] Check for existing repository in /var/www/html/admin
  [i] Clone https://github.com/pi-hole/AdminLTE.git into /var/www/html/admin...HEAD is now at 8ac95be Merge pull request #1647 from pi-hole/release/v5.2.1
  [✓] Clone https://github.com/pi-hole/AdminLTE.git into /var/www/html/admin
  [✓] Preparing new gravity database
  [i] Using libz compression

  [i] Target: https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
  [✓] Status: Retrieval successful
  [i] Analyzed 101021 domains

  [✓] Storing downloaded domains in new gravity database
  [✓] Building tree
  [✓] Swapping databases
  [✓] The old database remains available.
  [i] Number of gravity domains: 101021 (101021 unique domains)
  [i] Number of exact blacklisted domains: 0
  [i] Number of regex blacklist filters: 0
  [i] Number of exact whitelisted domains: 0
  [i] Number of regex whitelist filters: 0
  [✓] Flushing DNS cache
  [✓] Cleaning up stray matter

  [✓] FTL is listening on port 53
     [✓] UDP (IPv4)
     [✓] TCP (IPv4)
     [✓] UDP (IPv6)
     [✓] TCP (IPv6)

  [✓] Pi-hole blocking is enabled

  [i] The install log is located at: /etc/pihole/install.log
Update Complete!

  Current Pi-hole version is v5.8.1
  Current AdminLTE version is v5.10.1
  Current FTL version is v5.13

Pi-hole Web Admin, Enter New Password (Blank for no password):
  [✓] Password Removed

SUCCESS: The scheduled task "Pi-hole for Windows" has successfully been created.

   NOTE! The Scheduled Task needs to be configured so
         Pi-hole can automatically start at boot time.

       - Open Windows Task Scheduler (taskschd.msc) right-click
         the task "Pi-hole for Windows" and click edit.

       - On the General tab, place a checkmark next to
         "Both Run whether user is logged on or not" and "Hidden"

       - On the Conditions tab, un-check the option
         "Start the task only if the computer is on AC power"

Press any key to continue . . .
```

**Installer run:**
![PH4WSL](https://user-images.githubusercontent.com/33142753/101309416-c16b2480-3822-11eb-95ab-e1e2e1953adc.png)


**Install Folder:**

![Install Folder](https://user-images.githubusercontent.com/33142753/101309475-e8295b00-3822-11eb-9a84-d22b74df849e.PNG)


**Install Complete:**

![Install Complete](https://user-images.githubusercontent.com/33142753/101309494-f4151d00-3822-11eb-8521-66a96279add0.PNG)
