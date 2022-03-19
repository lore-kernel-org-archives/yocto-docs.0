Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B08CC4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 15:28:09 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.8231.1647703688354387093
 for <docs@lists.yoctoproject.org>;
 Sat, 19 Mar 2022 08:28:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DT0u9La7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id r13so299116wrr.9
        for <docs@lists.yoctoproject.org>;
 Sat, 19 Mar 2022 08:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=96tC9qi/YygQB8wiUuEtJenKZCGkf3wbtFMgLuUcHo4=;
        b=DT0u9La7EDUJ8BeIKYE8GMgEc2HWXvhk6DDHJiQ9PrwNowoxVMCkXRJOYQ1Ztwjnk7
         STG9iPluTJTcNCuMi8DDALnNiRwtXqf7l0B6BIHx3VB6oOkLmLxxJTBSN18xsjjyRNdJ
         VC30QfpfKDfqlk0Gz5JLspyVi4qwIOtrfbdxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=96tC9qi/YygQB8wiUuEtJenKZCGkf3wbtFMgLuUcHo4=;
        b=IbLugiuz7dBF+vVfxg87bd994UKcyLuW5auyXju8hf6CfG4V7VuYn8aIrI9tEh64hh
         jeRa0HUb/oToSj3vDGy/95aYjY4yuMhTkOx55WU9dEU4D1P/hGIJsnOswt7VKrYd1ke0
         of83KYIAtmu4gI2hoeOsrx4Cr6vMIYlDdFoK7XdMmb5kpTN90+EPFZExCcVDakIp/As0
         UAM5jvuhflUw1DIZgBeaU7iekvfVweColCDaZvBzoMqRGxgocvvPHuWOPnnZE/UeGQ9j
         4Fl9LjPYTn69OczBAG8tUpeDUL64MgiG8X6D1/GL1zl6WfRMhaba0OhzFteKuTq5zAma
         M2nA==
X-Gm-Message-State: AOAM531+zb8PtlLt57DdCWzWjnTLvOB4b+lbNwDyGo8Ue6SZD1x2qCI+
	lSYJJzPh6JZ3gq3q/g5+V3sWD72kXRQ1qbiB
X-Google-Smtp-Source: 
 ABdhPJzV1LFL77zYaxYx53BFPSqLIdpx54M9+nNsReWYkPqEhR3UI5gqD2AudAV0g215dhlB/ScvBQ==
X-Received: by 2002:adf:e18f:0:b0:204:444:dd0d with SMTP id
 az15-20020adfe18f000000b002040444dd0dmr1636805wrb.678.1647703686417;
        Sat, 19 Mar 2022 08:28:06 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:3ad7:b7e1:8044:d0f5])
        by smtp.gmail.com with ESMTPSA id
 l126-20020a1c2584000000b00387d4f35651sm12659726wml.10.2022.03.19.08.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 08:28:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <foss+yocto@0leil.net>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/2] set_versions: Various improvements
Date: Sat, 19 Mar 2022 15:28:03 +0000
Message-Id: <20220319152803.1110539-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220319152803.1110539-1-richard.purdie@linuxfoundation.org>
References: <20220319152803.1110539-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 19 Mar 2022 15:28:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2646

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
 documentation/set_versions.py | 119 +++++++++++++++++++++++++---------
 1 file changed, 89 insertions(+), 30 deletions(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index 4cdea8f42..392a48d18 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -12,10 +12,16 @@
 import subprocess
 import collections
 import sys
+import os
+import itertools
+
+ourversion = None
+if len(sys.argv) == 2:
+    ourversion = sys.argv[1]
 
 activereleases = ["honister", "hardknott", "dunfell"]
-devbranch = "kirkstone"
 #devbranch = "langdale"
+devbranch = "kirkstone"
 ltsseries = ["kirkstone", "dunfell"]
 
 release_series = collections.OrderedDict()
@@ -25,6 +31,27 @@ release_series["honister"] = "3.4"
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
 
 bitbake_mapping = {
     "langdale" : "2.2",
@@ -36,13 +63,14 @@ bitbake_mapping = {
 }
 
 # 3.4 onwards doesn't have poky version
+# Early 3.4 does do reference it though
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
@@ -69,31 +97,38 @@ if ourversion:
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
+        if i in bitbake_mapping:
+            bitbakeversion = bitbake_mapping[branch]
     else:
         sys.exit("Unknown series for branch %s" % branch)
 
@@ -111,8 +146,8 @@ else:
         docconfver = ourversion
 
 series = [k for k in release_series]
-previousseries = series[series.index(ourseries)+1:]
-lastlts = [k for k in previousseries if k in ltsseries]
+previousseries = series[series.index(ourseries)+1:] or [""]
+lastlts = [k for k in previousseries if k in ltsseries] or "dunfell"
 
 print("Version calculated to be %s" % ourversion)
 print("Release series calculated to be %s" % ourseries)
@@ -130,21 +165,40 @@ replacements = {
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
@@ -155,10 +209,15 @@ with open("sphinx-static/switchers.js.in", "r") as r, open("sphinx-static/switch
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


