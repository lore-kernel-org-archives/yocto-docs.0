Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716F5C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 14:17:28 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.10265.1647613047271875951
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 07:17:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K9LqjkHn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id b19so11912003wrh.11
        for <docs@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 07:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kAyfiCCWABce3nrwvE9Uvsopj7S+nI5/olFvPdWWaIc=;
        b=K9LqjkHn5QH7v3f+Q5SKrAPZDF3hq8waLkOU4KKn/OMeRSEsnlEPXFg98hWAhrzvhp
         Yfia6dOTb/Rk+s36DRKXzqvzcpUx7U+ugKE5lQflzbv98VntJunswNP1Uwl1cNSIo1QA
         nXelwqCufll3vEqpr5GgkenLbtYN+ggJCDJs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kAyfiCCWABce3nrwvE9Uvsopj7S+nI5/olFvPdWWaIc=;
        b=V0EiHO7Ivla6co+xTf3BXWaDOTHohJKm8SlZwXsI4xnlVBv3Mq8tcd0D5LubXN58SM
         wUZmQ5zmSwsvpn9r990/AzqxnFHgYcvicV8iiZumbaXbfaKCnmHuyJOew6bEV633UcXT
         vvdtRCI1SC48Lv8tMEmCD/LGsrzUIxQFV6JsPglWETdfiumtkqIxYlxuIsCfrM6aJ6cV
         1UhEQKnsEZeTgZ6vQa23ItYYz263wdeseVeZLvXDWoYxVGwD2H8T4xbN08dVDehyaamL
         E0VQO2bsR5VwG4+UzS8XyVixjRRtC+Ne53pG/xDlgWmtRhoyK5RfC7Rtg6NzV5J15ufA
         am4Q==
X-Gm-Message-State: AOAM532t8MvX9zCF+JVoC+wkDkmScz81jejvIsn2HiHwoLZB9hnGqXwn
	9feRgMouQ7C263gszlZvtVqEmwngHINzLos9
X-Google-Smtp-Source: 
 ABdhPJyLI4/TmL0EzZPxW44x2R7fGCWqnQULWvrJZr6FlUA+LKJTzF21yBl25tGDNutLUrIrXWriiQ==
X-Received: by 2002:a05:6000:1a88:b0:203:8de9:47cc with SMTP id
 f8-20020a0560001a8800b002038de947ccmr8076681wry.182.1647613045298;
        Fri, 18 Mar 2022 07:17:25 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:ac92:797e:3dcd:ed37])
        by smtp.gmail.com with ESMTPSA id
 u7-20020a5d6da7000000b00203d9d1875bsm7213873wrs.73.2022.03.18.07.17.24
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Mar 2022 07:17:24 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] conf.py/set_versions/poky.yaml: Set version in conf.py from
 poky.yaml
Date: Fri, 18 Mar 2022 14:17:19 +0000
Message-Id: <20220318141719.1068821-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Mar 2022 14:17:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2629

Allow conf.py to read the versions it needs from poky.yaml and have
set_versions.py write this out. This means we don't have to change as
many files when making new releases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/conf.py         | 11 +++++++++--
 documentation/poky.yaml.in    |  2 ++
 documentation/set_versions.py | 22 +++++++++++++++++++++-
 3 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 3015892d2..4bbe9b574 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -16,8 +16,15 @@ import os
 import sys
 import datetime
 
-current_version = "dev"
-bitbake_version = "" # Leave empty for development branch
+# current_version = "dev"
+# bitbake_version = "" # Leave empty for development branch
+# Obtain versions from poky.yaml instead
+with open("poky.yaml") as data:
+    for line in data.readlines():
+        if line.startswith("DOCCONF_VERSION"):
+            current_version = line.split(":")[1].strip().replace('"', '')
+        if line.startswith("BITBAKE_SERIES"):
+            bitbake_version = line.split(":")[1].strip().replace('"', '')
 
 # String used in sidebar
 version = 'Version: ' + current_version
diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 89a059ef1..a346b7623 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -5,6 +5,8 @@ DISTRO_NAME_NO_CAP_MINUS_ONE : "hardknott"
 DISTRO_NAME_NO_CAP_LTS : "dunfell"
 YOCTO_DOC_VERSION : "3.4.2"
 DISTRO_REL_TAG : "yocto-3.4.2"
+DOCCONF_VERSION : "dev"
+BITBAKE_SERIES : ""
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
 YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index cdcfd6bb0..a8c0980a7 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -25,9 +25,20 @@ release_series["hardknott"] = "3.3"
 release_series["gatesgarth"] = "3.2"
 release_series["dunfell"] = "3.1"
 
+bitbake_mapping = {
+    "langdale" : "2.2",
+    "kirkstone" : "2.0",
+    "honister" : "1.52",
+    "hardknott" : "1.50",
+    "gatesgarth" : "1.48",
+    "dunfell" : "1.46",
+}
+
 ourversion = None
 ourseries = None
 ourbranch = None
+bitbakeversion = None
+docconfver = None
 
 # Test tags exist and inform the user to fetch if not
 try:
@@ -45,18 +56,23 @@ if ourversion:
     # We're a tagged release
     components = ourversion.split(".")
     baseversion = components[0] + "." + components[1]
+    docconfver = ourversion
     for i in release_series:
         if release_series[i] == baseversion:
             ourseries = i
             ourbranch = i
+            bitbakeversion = bitbake_mapping[i]
 else:
     # We're floating on a branch
     branch = subprocess.run(["git", "branch", "--show-current"], capture_output=True, text=True).stdout.strip()
     ourbranch = branch
-    if branch == "master":
+    if branch == "master" or branch == "master-next":
         ourseries = devbranch
+        docconfver = "dev"
+        bitbakeversion = ""
     elif branch in release_series:
         ourseries = branch
+        bitbakeversion = bitbake_mapping[branch]
     else:
         sys.exit("Unknown series for branch %s" % branch)
 
@@ -70,6 +86,8 @@ else:
         ourversion = previoustags[-1] + ".999"
     else:
         ourversion = release_series[ourseries] + ".999"
+    if not docconfver:
+        docconfver = ourversion
 
 series = [k for k in release_series]
 previousseries = series[series.index(ourseries)+1:]
@@ -86,6 +104,8 @@ replacements = {
     "DISTRO_NAME_NO_CAP_LTS" : lastlts[0],
     "YOCTO_DOC_VERSION" : ourversion,
     "DISTRO_REL_TAG" : "yocto-" + ourversion,
+    "DOCCONF_VERSION" : docconfver,
+    "BITBAKE_VERSION" : bitbakeversion,
 }
 
 with open("poky.yaml.in", "r") as r, open("poky.yaml", "w") as w:
-- 
2.32.0


