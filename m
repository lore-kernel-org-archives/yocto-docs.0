Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F1E9C433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 10:20:04 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.7441.1648030803895741408
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 03:20:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CqWCGGBL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id
 o7-20020a05600c4fc700b0038c87edc21eso3068442wmq.0
        for <docs@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 03:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=u1Yf/oa69GSGg0G0IstLKfhtDcI3VL0Uh4L7AH+bw08=;
        b=CqWCGGBLLU3ArMLAdFtC9TzefMSmxgHRufNCD8UNHzrRRfNYjNRkWSN1T/kgwSEBo+
         nioCkr3z6RypF3QAFA7AgxFmmTKb/umC99Gxc95XpJ+c6BZ8C6tcAJ73dcBMmzOpZwvU
         dK+ptktHXwDC+5EEsCDxfaNJc05yIBDFSse1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u1Yf/oa69GSGg0G0IstLKfhtDcI3VL0Uh4L7AH+bw08=;
        b=mIiHCw0zJLS0PG1YEKawoN/3aBNJcfZRaVuTY/qj9ozCvVdk5AfzOMFz/MCpP51qTs
         ZUBtDdN/ccfVCF9gtCodqiLPeS4iqA2vOOS3lM/RzhS0iMQ4fOTfc1t0PvAXwgpvApS+
         g/6/SyhIzz/hOsn0gNanLvpdTnLVpZLhEey8GIldkD+KCpVKORst1/+bVSfujCYeaOkH
         oGV7Ri2VEb9Khim4MhV+pP2wxUMGawThC45AxvVXmZMFIL5qwRUYn0Yx7qvcYmQQr3X5
         5/8lGw+G+le5pp+p69cbaLnAW9PTP4CzdSa1wxP0FS9w3NtaAtkXKeGeLr9R63ZsIpxG
         5lOQ==
X-Gm-Message-State: AOAM532L/Afh3M82FP2cTJFyhecaxQxk66IQ/Sz3dK+zJfh9bD433Qq2
	S950LECrO6ID7ZEEue7ke/7L6SxO4fjbv+h8
X-Google-Smtp-Source: 
 ABdhPJwjg8W/sr/2c8tIcRy8RSqjD6WUfl4qFIu2wdMwtewrXlHdBJqL5fwQ2FC9sgx/AIthyCdxiA==
X-Received: by 2002:a7b:cc0d:0:b0:381:220e:a3a0 with SMTP id
 f13-20020a7bcc0d000000b00381220ea3a0mr8585393wmh.59.1648030801936;
        Wed, 23 Mar 2022 03:20:01 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:aaba:716e:9c38:ad87])
        by smtp.gmail.com with ESMTPSA id
 x3-20020a5d6b43000000b001e317fb86ecsm18171336wrw.57.2022.03.23.03.20.01
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 03:20:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH 5/5] set_versions: Various improvements
Date: Wed, 23 Mar 2022 10:19:57 +0000
Message-Id: <20220323101957.1263785-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220323101957.1263785-1-richard.purdie@linuxfoundation.org>
References: <20220323101957.1263785-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Mar 2022 10:20:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2700

- Allow specifying the version from the commandline
- Add all previous release series/version mappings (to support transitions branch)
- Add poky mapping for 3.4 as some releases erronously use it
- Improve git branch 'guessing' code to work properly
- Handle poky '.0' release mappings correctly
- Only write poky.yaml if poky.yaml.in exists
- Ensure older non-active releases are shown in the switchers.js
  release list.
- Ensure current version and current release series are shown in switcher.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/set_versions.py | 117 +++++++++++++++++++++++++---------
 1 file changed, 88 insertions(+), 29 deletions(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index 94e2704a5..9f0d79429 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -12,6 +12,12 @@
 import subprocess
 import collections
 import sys
+import os
+import itertools
+
+ourversion = None
+if len(sys.argv) == 2:
+    ourversion = sys.argv[1]
 
 ourversion = None
 if len(sys.argv) == 2:
@@ -29,6 +35,27 @@ release_series["honister"] = "3.4"
 release_series["hardknott"] = "3.3"
 release_series["gatesgarth"] = "3.2"
 release_series["dunfell"] = "3.1"
+release_series["zeus"] = "3.0"
+release_series["warrior"] = "2.7"
+release_series["thud"] = "2.6"
+release_series["sumo"] = "2.5"
+release_series["rocko"] = "2.4"
+release_series["pyro"] = "2.3"
+release_series["morty"] = "2.2"
+release_series["krogoth"] = "2.1"
+release_series["jethro"] = "2.0"
+release_series["jethro-pre"] = "1.9"
+release_series["fido"] = "1.8"
+release_series["dizzy"] = "1.7"
+release_series["daisy"] = "1.6"
+release_series["dora"] = "1.5"
+release_series["dylan"] = "1.4"
+release_series["danny"] = "1.3"
+release_series["denzil"] = "1.2"
+release_series["edison"] = "1.1"
+release_series["bernard"] = "1.0"
+release_series["laverne"] = "0.9"
+
 
 #    "langdale" : "2.2",
 bitbake_mapping = {
@@ -40,13 +67,14 @@ bitbake_mapping = {
 }
 
 # 3.4 onwards doesn't have poky version
+# Early 3.4 release docs do reference it though
 poky_mapping = {
+    "3.4" : "26.0",
     "3.3" : "25.0",
     "3.2" : "24.0",
     "3.1" : "23.0",
 }
 
-ourversion = None
 ourseries = None
 ourbranch = None
 bitbakeversion = None
@@ -73,31 +101,38 @@ if ourversion:
         if release_series[i] == baseversion:
             ourseries = i
             ourbranch = i
-            bitbakeversion = bitbake_mapping[i]
+            if i in bitbake_mapping:
+                bitbakeversion = bitbake_mapping[i]
 else:
     # We're floating on a branch
     branch = subprocess.run(["git", "branch", "--show-current"], capture_output=True, text=True).stdout.strip()
     ourbranch = branch
     if branch != "master" and branch not in release_series:
-        possible_branches = []
-        for b in release_series.keys():
-            result = subprocess.run(["git", "show-ref", "heads/" + b], capture_output=True, text=True)
+        # We're not on a known release branch so we have to guess. Compare the numbers of commits
+        # from each release branch and assume the smallest number of commits is the one we're based off
+        possible_branch = None
+        branch_count = 0
+        for b in itertools.chain(release_series.keys(), ["master"]):
+            result = subprocess.run(["git", "log", "--format=oneline",  "HEAD..origin/" + b], capture_output=True, text=True)
             if result.returncode == 0:
-                possible_branches.append(b)
-                continue
-            result = subprocess.run(["git", "show-ref", "origin/" + b], capture_output=True, text=True)
-            if result.returncode == 0:
-                possible_branches.append("origin/" + b)
-        nearestbranch = subprocess.run('git show-branch master ' + ' '.join(possible_branches) + ' | grep "*" | grep -v "$(git rev-parse --abbrev-ref HEAD)" | head -n1', shell=True, capture_output=True, text=True).stdout
-        branch = nearestbranch.split('[')[1].split('~')[0]
-        print("Nearest release branch esimtated to be %s" % branch)
+                count = result.stdout.count('\n')
+                if not possible_branch or count < branch_count:
+                    print("Branch %s has count %s" % (b, count))
+                    possible_branch = b
+                    branch_count = count
+        if possible_branch:
+            branch = possible_branch
+        else:
+            branch = "master"
+        print("Nearest release branch estimated to be %s" % branch)
     if branch == "master":
         ourseries = devbranch
         docconfver = "dev"
         bitbakeversion = ""
     elif branch in release_series:
         ourseries = branch
-        bitbakeversion = bitbake_mapping[branch]
+        if branch in bitbake_mapping:
+            bitbakeversion = bitbake_mapping[branch]
     else:
         sys.exit("Unknown series for branch %s" % branch)
 
@@ -115,8 +150,8 @@ else:
         docconfver = ourversion
 
 series = [k for k in release_series]
-previousseries = series[series.index(ourseries)+1:]
-lastlts = [k for k in previousseries if k in ltsseries]
+previousseries = series[series.index(ourseries)+1:] or [""]
+lastlts = [k for k in previousseries if k in ltsseries] or "dunfell"
 
 print("Version calculated to be %s" % ourversion)
 print("Release series calculated to be %s" % ourseries)
@@ -134,21 +169,40 @@ replacements = {
 }
 
 if release_series[ourseries] in poky_mapping:
-    pokyversion = poky_mapping[release_series[ourseries]] + "." + ourversion.rsplit(".", 1)[1]
+    pokyversion = poky_mapping[release_series[ourseries]]
+    if ourversion != release_series[ourseries]:
+        pokyversion = pokyversion + "." + ourversion.rsplit(".", 1)[1]
+    else:
+        pokyversion = pokyversion + ".0"
     replacements["POKYVERSION"] = pokyversion
 
-with open("poky.yaml.in", "r") as r, open("poky.yaml", "w") as w:
-    lines = r.readlines()
-    for line in lines:
-        data = line.split(":")
-        k = data[0].strip()
-        if k in replacements:
-            w.write("%s : \"%s\"\n" % (k, replacements[k]))
-        else:
-            w.write(line)
-
-print("poky.yaml generated from poky.yaml.in")
-
+if os.path.exists("poky.yaml.in"):
+    with open("poky.yaml.in", "r") as r, open("poky.yaml", "w") as w:
+        lines = r.readlines()
+        for line in lines:
+            data = line.split(":")
+            k = data[0].strip()
+            if k in replacements:
+                w.write("%s : \"%s\"\n" % (k, replacements[k]))
+            else:
+                w.write(line)
+
+    print("poky.yaml generated from poky.yaml.in")
+
+
+# In the switcher list of versions we display:
+#  - latest dev
+#  - latest stable release
+#  - latest LTS
+#  - latest for each releases listed as active
+#  - latest doc version in current series
+#  - current doc version
+# (with duplicates removed)
+
+if ourseries not in activereleases:
+    activereleases.append(ourseries)
+
+versions = []
 with open("sphinx-static/switchers.js.in", "r") as r, open("sphinx-static/switchers.js", "w") as w:
     lines = r.readlines()
     for line in lines:
@@ -159,10 +213,15 @@ with open("sphinx-static/switchers.js.in", "r") as r, open("sphinx-static/switch
                     continue
                 versions = subprocess.run('git tag --list yocto-%s*' % (release_series[branch]), shell=True, capture_output=True, text=True).stdout.split()
                 versions = sorted([v.replace("yocto-" +  release_series[branch] + ".", "").replace("yocto-" +  release_series[branch], "0") for v in versions], key=int)
+                if not versions:
+                    continue
                 version = release_series[branch]
                 if versions[-1] != "0":
                     version = version + "." + versions[-1]
+                versions.append(version)
                 w.write("    '%s': '%s',\n" % (version, version))
+            if ourversion not in versions:
+                w.write("    '%s': '%s',\n" % (ourversion, ourversion))
         else:
             w.write(line)
 
-- 
2.32.0


