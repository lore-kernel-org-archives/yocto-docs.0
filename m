Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76CBEC4332F
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 17:45:02 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.392.1647884700762098847
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Mar 2022 10:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ijFHNMPY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id n35so7407352wms.5
        for <docs@lists.yoctoproject.org>;
 Mon, 21 Mar 2022 10:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KRomAwlh6xdoIh3onIO8IVhFAVhcKPFuxZcPXW0CFT4=;
        b=ijFHNMPYi/DbckPrUULhTOZPzpomvgtymK3SI1UcFyKNRYrzqbM7xQCY1im8sAPD5g
         sHo2DXR7sMMwFi9wuIZICc4cnTxVTndoywyL7TxgbV+y2RiKo12pss0Vqgw4FC09QDx1
         5CrFnQOWKOuLEEyTF99b7XxWGy1ygezY82oRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KRomAwlh6xdoIh3onIO8IVhFAVhcKPFuxZcPXW0CFT4=;
        b=uXhpuj2vxMQxjzIUslzUzGb9VdyAs1c7rautTAPv6pVjLKpAG+bm8JrbVT90YaNTF5
         kpnxRe1kG8iZgoajsjrRuc+2efG23Ti6aRNsYtvKdxGBvMyo1Z9wx8zS7U2NCVAOkevi
         tnWYs7A5LSUhihaa3yacHDgjIHXZC9Hn2F6oOvF8r20xD1AHG9Ku8x8SH/EaBnr6UWlt
         6oYFgo6d8Ac+/X/Z4mKiC7ou4I/ucDPCuhzZD9x8Gp2kFyKxQxWvQMkfmiNpIg+kqXxa
         ONHKXGnBXZrEm3Q8dAsCmYAepzqYEuKQ/BBsgPk7InfCk1OQ5wRhp9CRLzUG/bV3FWCL
         0VQg==
X-Gm-Message-State: AOAM531ty32pnQmFeuX7tSS0dCkXeERnotOEYjYUPm7HCqkcoyw9rmJt
	8oo8Qn2CPDbSRvHCHQuQyzp1kwAUMz3pW8xF
X-Google-Smtp-Source: 
 ABdhPJxKPW0H/Hi2AM3EUy7L5aiD5sp7trqBrXmf8tr3EnkFFCd2FXqLdFN1sl1oo5eTGTtzLvtVzg==
X-Received: by 2002:a05:600c:1f17:b0:38b:b2b3:9faa with SMTP id
 bd23-20020a05600c1f1700b0038bb2b39faamr206158wmb.190.1647884698941;
        Mon, 21 Mar 2022 10:44:58 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7422:13d5:6a39:d39])
        by smtp.gmail.com with ESMTPSA id
 n22-20020a05600c4f9600b0038c6ec42c38sm151849wmq.6.2022.03.21.10.44.57
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 10:44:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH 2/5] conf.py/set_versions/poky.yaml: Set version in conf.py
 from poky.yaml
Date: Mon, 21 Mar 2022 17:44:52 +0000
Message-Id: <20220321174455.1189669-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220321174455.1189669-1-richard.purdie@linuxfoundation.org>
References: <20220321174455.1189669-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 21 Mar 2022 17:45:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2665

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
index 266ccf464..a4bfaf1bf 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -25,9 +25,20 @@ release_series["hardknott"] = "3.3"
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
@@ -45,10 +56,12 @@ if ourversion:
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
@@ -68,8 +81,11 @@ else:
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
 
@@ -83,6 +99,8 @@ else:
         ourversion = previoustags[-1] + ".999"
     else:
         ourversion = release_series[ourseries] + ".999"
+    if not docconfver:
+        docconfver = ourversion
 
 series = [k for k in release_series]
 previousseries = series[series.index(ourseries)+1:]
@@ -99,6 +117,8 @@ replacements = {
     "DISTRO_NAME_NO_CAP_LTS" : lastlts[0],
     "YOCTO_DOC_VERSION" : ourversion,
     "DISTRO_REL_TAG" : "yocto-" + ourversion,
+    "DOCCONF_VERSION" : docconfver,
+    "BITBAKE_SERIES" : bitbakeversion,
 }
 
 with open("poky.yaml.in", "r") as r, open("poky.yaml", "w") as w:
-- 
2.32.0


