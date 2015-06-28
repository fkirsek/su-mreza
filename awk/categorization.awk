 # produce the answer file for KDD contest scoring
# Charles Elkan, 8/5/99
 

BEGIN {
FS = ",";

# testing attack types from Wenke Lee

category["apache2."] = 2
category["back."] = 2
category["buffer_overflow."] = 3
category["ftp_write."] = 4
category["guess_passwd."] = 4
category["httptunnel."] = 4
category["httptunnel."] = 3
category["imap."] = 4
category["ipsweep."] = 1
category["land."] = 2
category["loadmodule."] = 3
category["mailbomb."] = 2
category["mscan."] = 1
category["multihop."] = 4
category["multihop."] = 3 # note that this is a duplicate
category["named."] = 4
category["neptune."] = 2
category["nmap."] = 1
category["perl."] = 3
category["phf."] = 4
category["pod."] = 2
category["portsweep."] = 1
category["processtable."] = 2
category["ps."] = 3
category["rootkit."] = 3
category["saint."] = 1
category["satan."] = 1
category["sendmail."] = 4
category["smurf."] = 2
category["snmpgetattack."] = 4
category["snmpguess."] = 4
category["sqlattack."] = 3
category["teardrop."] = 2
category["udpstorm."] = 2
category["warezmaster."] = 2
category["worm."] = 4
category["xlock."] = 4
category["xsnoop."] = 4
category["xterm."] = 3

# training attack types

category["back."] = 2
category["buffer_overflow."] = 3
category["ftp_write."] = 4
category["guess_passwd."] = 4
category["imap."] = 4
category["ipsweep."] = 1
category["land."] = 2
category["loadmodule."] = 3
category["multihop."] = 4
category["neptune."] = 2
category["nmap."] = 1
category["perl."] = 3
category["phf."] = 4
category["pod."] = 2
category["portsweep."] = 1
category["rootkit."] = 3
category["satan."] = 1
category["smurf."] = 2
category["spy."] = 4
category["teardrop."] = 2
category["warezclient."] = 4
category["warezmaster."] = 4  # note that this contradicts the category above

# initialize matrix cost[actual,predicted]
# note that all other entries of the cost matrix are zero, so the computed
# total cost is too low if either actual or predicted is ever out-of-range

for (i = 0; i <= 4; i++)
 for (j = 0; j <= 4; j++)
  if (i == j) cost[i,j] = 0;
  else cost[i,j] = 2;

cost[0,1] = 1;
cost[1,0] = 1;
cost[2,1] = 1;
cost[3,0] = 3;
cost[4,0] = 4;

total = 0

} # end of BEGIN

{
label = $NF;

# heuristic to identify incorrectly labeled records
# if (label == "normal." && $3 == "ecr_i") { disputed++; label = "smurf." }

if (label == label+0) cat = label+0;  # works for submitted entries
else if (label == "normal.") cat = 0;
else if (label in category) cat = category[label];
else cat = 9;

total++
count[cat]++;
for (j = 0; j <= 4; j++) basecost[j] += cost[cat,j];

print cat;
}

END {
print disputed, "records changed from normal to smurf";

for (j = 0; j <= 4; j++) basecost[j] /= total;
for (cat in count)
 print cat ": " 100*count[cat]/total "%%\t base cost", basecost[cat];

print "total", total;
}
 
 
  