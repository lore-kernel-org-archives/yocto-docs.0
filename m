Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 764B8C433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 10:20:02 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.7428.1648030801172667754
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 03:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OddUmsZ/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id j18so1394723wrd.6
        for <docs@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 03:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=I/5Z0zidLD0WptEDzr0/TF/xojB1lkY8HqTSxOeZvG8=;
        b=OddUmsZ/pnAybF///gJjA1zwuNVHcCpPX1OWB7w4cJQDeB40K4940qfrMDejKf1RdE
         8KGqWq6ryLGFL6UMhNTObD68HbAwalVZrrQnZ5H6LBasM4gRgYmm3YYqXQkKg+eeYeV0
         L6L8kbikq2222KRVgFKa0wUVryW9VvrG03bIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I/5Z0zidLD0WptEDzr0/TF/xojB1lkY8HqTSxOeZvG8=;
        b=6eIbxiT/p7lIaODcRBqJ8rHNqyHs1Ig5cw3LslYnby2gnYRRVC8ztri6btyv5mQNOe
         Z6EC6plOVSPMo2qWD0Zx/CQOo46XWbwfhXE9GY9PC/KzjqCnwMotgdQq1+1dRCAuCHt+
         iMg4n8pQOzFT8QdZwosVVgdUJ5YlT7kVELjQySw/L8pgBdMvF0AOjRKL2ei+YMpMZLGa
         DMu5E+Z2nPcoZdb0tC0sU8g6lqpBXrSRzFaqJnPrmpV93qe5LLsHKQVcLO594wvYj+i6
         aowdytjIgvMdmHnBsIsWcT3JFLgQO2vQ7+BMeBw9D84VQZB9ig5pjjA5KP6nFI9R3c49
         v0ag==
X-Gm-Message-State: AOAM532Rjd9gpSnGqNtCNR0g9yEamaoMiPDMb/oHvefxNSdEHUEvefaw
	3kMatiC8hQG6RenvTcW42jKupO4PVQ+IDzvl
X-Google-Smtp-Source: 
 ABdhPJzAPEXAQD9I2iMlkx1d5BQ7c2NdoHyroOd1t/zkS/JrASJyFmU1rkl05LLeTSY4SIu8PPZUfQ==
X-Received: by 2002:a05:6000:168e:b0:204:fe5:a55 with SMTP id
 y14-20020a056000168e00b002040fe50a55mr12405170wrd.453.1648030799192;
        Wed, 23 Mar 2022 03:19:59 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:aaba:716e:9c38:ad87])
        by smtp.gmail.com with ESMTPSA id
 x3-20020a5d6b43000000b001e317fb86ecsm18171336wrw.57.2022.03.23.03.19.58
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 03:19:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH 2/5] conf.py/set_versions/poky.yaml: Set version in conf.py
 from poky.yaml
Date: Wed, 23 Mar 2022 10:19:54 +0000
Message-Id: <20220323101957.1263785-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220323101957.1263785-1-richard.purdie@linuxfoundation.org>
References: <20220323101957.1263785-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Mar 2022 10:20:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2697

Allow conf.py to read the versions it needs from poky.yaml and have
set_versions.py write this out. This means we don't have to change as
many files when making new releases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/conf.py         | 22 ++++++++++++++++++++--
 documentation/poky.yaml.in    |  2 ++
 documentation/set_versions.py | 20 ++++++++++++++++++++
 3 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 3015892d2..a5d7c0cd8 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -15,9 +15,27 @@
 import os
 import sys
 import datetime
+try:
+    import yaml
+except ImportError:
+    sys.stderr.write("The Yocto Project Sphinx documentation requires PyYAML.\
+    \nPlease make sure to install pyyaml python package.\n")
+    sys.exit(1)
 
-current_version = "dev"
-bitbake_version = "" # Leave empty for development branch
+# current_version = "dev"
+# bitbake_version = "" # Leave empty for development branch
+# Obtain versions from poky.yaml instead
+with open("poky.yaml") as data:
+    buff = data.read()
+    subst_vars = yaml.safe_load(buff)
+    if "DOCCONF_VERSION" not in subst_vars:
+        sys.stderr.write("Please set DOCCONF_VERSION in poky.yaml")
+        sys.exit(1)
+    current_version = subst_vars["DOCCONF_VERSION"]
+    if "BITBAKE_SERIES" not in subst_vars:
+        sys.stderr.write("Please set BITBAKE_SERIES in poky.yaml")
+        sys.exit(1)
+    bitbake_version = subst_vars["BITBAKE_SERIES"]
 
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
index d48b8b74c..4ee28d094 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -30,9 +30,20 @@ release_series["hardknott"] = "3.3"
 release_series["gatesgarth"] = "3.2"
 release_series["dunfell"] = "3.1"
 
+#    "langdale" : "2.2",
+bitbake_mapping = {
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
@@ -50,10 +61,12 @@ if ourversion:
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
@@ -73,8 +86,11 @@ else:
         print("Nearest release branch esimtated to be %s" % branch)
     if branch == "master":
         ourseries = devbranch
+        docconfver = "dev"
+        bitbakeversion = ""
     elif branch in release_series:
         ourseries = branch
+        bitbakeversion = bitbake_mapping[branch]
     else:
         sys.exit("Unknown series for branch %s" % branch)
 
@@ -88,6 +104,8 @@ else:
         ourversion = previoustags[-1] + ".999"
     else:
         ourversion = release_series[ourseries] + ".999"
+    if not docconfver:
+        docconfver = ourversion
 
 series = [k for k in release_series]
 previousseries = series[series.index(ourseries)+1:]
@@ -104,6 +122,8 @@ replacements = {
     "DISTRO_NAME_NO_CAP_LTS" : lastlts[0],
     "YOCTO_DOC_VERSION" : ourversion,
     "DISTRO_REL_TAG" : "yocto-" + ourversion,
+    "DOCCONF_VERSION" : docconfver,
+    "BITBAKE_SERIES" : bitbakeversion,
 }
 
 with open("poky.yaml.in", "r") as r, open("poky.yaml", "w") as w:
-- 
2.32.0


