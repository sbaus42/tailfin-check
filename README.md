# Check Tailfin!
Just run the gemfile and make sure you have all of your secrets and stuff.
Make sure to make the file `check_shipment.rb` an executable by running the command `chmod +x check_shipment.rb` and adding
`#!/usr/bin/env ruby` at the top of the file. You're golden then... Kind of. If you try to run this file by itself, you're likely to use
the system ruby instead of the RVM ruby.

# Cron
The Cron job in `crontab -e` is the following:
```bash
0 */6 * * * /home/santi/Programming/personal/tailfin-check/check_shipment.rb 1> /dev/null 2> /home/santi/Programming/personal/tailfin-check/cron_error.err
```
The values are hardcoded but for now it's how it works...

Making the file executable was a must for this process. I didn't want to create a bash script and then run it so I had to configure crontab to have
all of the RVM variables since `/usr/bin/env ruby` by default looks at a different ruby version.
This caused a lot of issues with the gem library. I still have to manage to get this working on my DO server.

# Learnings
- Cron is the shit
- #! is pretty interesting and learning more about the intepreter selected should be an interesting read.
- Still need to figure out how to change the number of entries to check without using a database... Writing to a file seems like the way to go
- Grepping syslogs for cron jobs will let you know what jobs are running, like this:
```bash
sudo grep CRON /var/log/syslog 
```
