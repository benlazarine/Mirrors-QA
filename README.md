# Mirrors-QA

# Documentation

For Robotframework tests
The easiest way to run this regression is by running the bash script

```bash
./Scripts/mirrors_regression.sh dev
```

The suites can also be run manually like

```bash
pybot -A PathTo/OverrideVars.txt Commandline/Mirrors_Commandline_Tests.robot
```

For jMeter tests

```bash
jmeter -n -t Mirrors-LoadTest.jmx -JWebHost=server.domainname.com
```