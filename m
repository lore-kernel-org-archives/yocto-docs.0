Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82262C3A5A7
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:07 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.6393.1650454180575278277
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 04:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UnJSSowq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id bv16so1812836wrb.9
        for <docs@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 04:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RuooeL+N4Rvk2TVprjl4c+/1MW/Mu8A+y67kwpOboKY=;
        b=UnJSSowq4VaAE+ijbum1BnoleWK8S9XiM6d3WjtLRjlwip2MUb4uvU7fsOdS3gJ1+t
         J0nDGG1CzfwFa5p8z29oaShgi3+iJ6DLulq0SaOrMP0iKdUc5zlrfqOsoEI3SIHYdIDi
         13cnxiy3sljzcH76/3jLvMYdAL8UanC4GpbWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RuooeL+N4Rvk2TVprjl4c+/1MW/Mu8A+y67kwpOboKY=;
        b=F9HyiGjShDw08rIiJhlZdHlxMh5XOEut+AXEPOcr5AItPhVODNilgwjwKQ2G2QqCDz
         pwv5DQDpVe+UAEP0XNoBb09uxVaZI1BkAIVPqqegWphjJM8JbvxknrHHtpc+qruhtMXK
         RN6KxFgFCuVcZC6fBjRlyjiT/WakxOepI0WE8GYiq5ObdJicelGfG7iPKFCxFwmwi7Eq
         me7HZT+iI5kGSN4dnZ1y32kf/8uXBQbKnzj88fE02VW6Ht4mvimvb08eqhCJyJMKTQHd
         4hHhXACPATWA5ZDuSBgcnjJ4U/QBBZtpGLo7U2/NdOY1s/woe9FyLqUBu/4MimpvLC3g
         uvTQ==
X-Gm-Message-State: AOAM533Z9n9V8Vqni5MjT7CspZoPXDtHuLnilSoA4P+ppkFELhOR0XPc
	rZQw7lrbdyl0ezzTM9hNbrq2qmJ4HE2bxg==
X-Google-Smtp-Source: 
 ABdhPJxsgREnhJS+DvtpBX0/rAzQ4sYZ78vJ9gbhiv6fYprvz2jadtxDQMFEIvwP6EvrIpuuP2ddBA==
X-Received: by 2002:adf:d1e2:0:b0:20a:91fa:822 with SMTP id
 g2-20020adfd1e2000000b0020a91fa0822mr12387652wrd.349.1650454178140;
        Wed, 20 Apr 2022 04:29:38 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9745:8b8f:81da:af07])
        by smtp.gmail.com with ESMTPSA id
 g13-20020a5d64ed000000b0020a9e488976sm6350240wri.25.2022.04.20.04.29.37
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 04:29:37 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH][dunfell] conf.py/poky.yaml: Move version information to
 poky.yaml and read in conf.py
Date: Wed, 20 Apr 2022 12:29:33 +0100
Message-Id: <20220420112936.2523983-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Apr 2022 16:46:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2799

Merge in the changes from master allowing conf.py to use information from
poky.yaml. This allows the head version mapped to X.999 on the website to
have the version information displayed clearly and correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/conf.py   | 22 ++++++++++++++++++++--
 documentation/poky.yaml |  2 ++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 4df8f55d1..df67a5cdf 100644
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
 
-current_version = "3.1.15"
-bitbake_version = "1.46"
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
diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index e0f8166f7..edc23f8aa 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -5,6 +5,8 @@ DISTRO_NAME_NO_CAP_MINUS_ONE : "zeus"
 YOCTO_DOC_VERSION : "3.1.15"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.0.4"
 DISTRO_REL_TAG : "yocto-3.1.15"
+DOCCONF_VERSION : "3.1.15"
+BITBAKE_SERIES : "1.46"
 POKYVERSION : "23.0.15"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
-- 
2.32.0


