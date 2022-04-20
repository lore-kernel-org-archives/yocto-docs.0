Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 864F8C4743C
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:07 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.6394.1650454180921405377
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 04:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DV22eTcA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id e21so1817137wrc.8
        for <docs@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 04:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZVrBczOGBAhPKsKDyQyBX9y83cSCZBLRgIR2Hr/legw=;
        b=DV22eTcAMoys7mjaeQShq7j73S+25tV88cO6DtqCuUgi4AXroFJQsfrN+CXd//jKxW
         REHFplbuMrzKXFkdIgANvJNw/53m7JMxDDZwFCL8sGAfnr1CPQXcWLpqtydIXB1suXw7
         b5KpEtMKKEoUJKAh76aCkVpr3VvUyLohXpL0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZVrBczOGBAhPKsKDyQyBX9y83cSCZBLRgIR2Hr/legw=;
        b=IKJbHDdLWt7TG9jg242cYYXOhIpHDmVInzUuRL6+eNMEpd0Kk+1wGBME+RdN7x5GGf
         L4TSEfYNtAcCcDGqHGWgjAL4d0y7htpbrGb9Ifw79jpwaYTSbDhj6G8lHvhxthoSypUr
         iJN3ONB1ELLauPWRKBtfj6uQIFXNdbaqzzzjmT0llxWRXNLc+new29+rZKyzuvH3i7ZC
         DlKDyVFGv18UVGSFvwzfOD1MXbmI2lkVywFa1EUyiQwJ8+26Fp8LoEdbc2XubM2RuD5s
         DNjb1gAUkiYORg6zgzgtq+kpRW1xTbRstlXNGvWq9rOGQLLoQ5Dx76p4U6BZke8E5jeT
         YwLg==
X-Gm-Message-State: AOAM5336muXazYysFopnL6VkXiOGtBebHTDAyTYxr4QPhG2IK+PaL8gQ
	CBnLZ4objQZD0vOWLLJShw29+qAjs7B/Mg==
X-Google-Smtp-Source: 
 ABdhPJy4JjGppN5WW6P50ucEXzWaPV50awVYjgrMmM6ItEx0FVYpkSMKGAMZ1/67Zx+NM00rpzRXnA==
X-Received: by 2002:a05:6000:713:b0:20a:92f1:c057 with SMTP id
 bs19-20020a056000071300b0020a92f1c057mr11331566wrb.241.1650454178914;
        Wed, 20 Apr 2022 04:29:38 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9745:8b8f:81da:af07])
        by smtp.gmail.com with ESMTPSA id
 g13-20020a5d64ed000000b0020a9e488976sm6350240wri.25.2022.04.20.04.29.38
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 04:29:38 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH][gatesgarth] conf.py/poky.yaml: Move version information to
 poky.yaml and read in conf.py
Date: Wed, 20 Apr 2022 12:29:34 +0100
Message-Id: <20220420112936.2523983-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220420112936.2523983-1-richard.purdie@linuxfoundation.org>
References: <20220420112936.2523983-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Apr 2022 16:46:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2800

Merge in the changes from master allowing conf.py to use information from
poky.yaml. This allows the head version mapped to X.999 on the website to
have the version information displayed clearly and correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/conf.py   | 21 ++++++++++++++++++++-
 documentation/poky.yaml |  2 ++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 1efd63ca1..fe27e3e0d 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -15,8 +15,27 @@
 import os
 import sys
 import datetime
+try:
+    import yaml
+except ImportError:
+    sys.stderr.write("The Yocto Project Sphinx documentation requires PyYAML.\
+    \nPlease make sure to install pyyaml python package.\n")
+    sys.exit(1)
 
-current_version = "3.2.4"
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
index 189f7bec6..fb567a11d 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -5,6 +5,8 @@ DISTRO_NAME_NO_CAP_MINUS_ONE : "dunfell"
 YOCTO_DOC_VERSION : "3.2.4"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.1.7"
 DISTRO_REL_TAG : "yocto-3.2.4"
+DOCCONF_VERSION : "3.2.4"
+BITBAKE_SERIES : "1.48"
 POKYVERSION : "24.0.4"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
-- 
2.32.0


