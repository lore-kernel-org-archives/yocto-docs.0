Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 911B0C4743E
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:07 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.6504.1650454182812564906
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 04:29:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MkXkJUlX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id u3so1844679wrg.3
        for <docs@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 04:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JQIMHM/5s6hJlhYGUGx7v7Q1Hj+RAJXVKmf62jxchzA=;
        b=MkXkJUlXq47xKQMfgqSJ4Kkq2rk/76pCgXxcY0b3cUJp4IX8aukMtHPTnPxBL28VyY
         OChQ//2MMM2FJZrw4IPRT+WFlk3f+Ao/RS2vW9DqEK+ARs1U00J5kz1uJ5yjXSEOGe6v
         luiY9Ii7awn9tbetK2w2oR3HZ5EstiTihkU8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JQIMHM/5s6hJlhYGUGx7v7Q1Hj+RAJXVKmf62jxchzA=;
        b=FI/lfaddfrxQqK9yA71M45nZRX+rz5tixuwNstzxBWg/8hNUySax6URW7coo/30YY8
         4iOknJphhF3b69KWIIwcUuQsD1bccrCgl0fFoL/4pljLk+NxqTBR4Kg92/2Ax7W5yjp0
         CMfCmK0eZ0TtrcC1gPEUsJf4Zx5mwLVk9dXvEDrvkImizgRmYpSBwdMyBPGg5GVlmkyV
         /b7a4nqF9+hAgOQ2TtYFms8GwR4mrDnsljh9QcACl0wPht30/VGi9Xy+q1B/leXh5lOv
         KVWSu+PKvv/1hPrTUpQ4ENFvozDarTaSTc6LPIDUs25J/SvJBZXjTyQba3S8krLV5WyW
         GAww==
X-Gm-Message-State: AOAM530qUS1R2ewN0nWTH/HjVFDYmTvCVYVxEjCrcJkVRXjr/8pIrq4k
	ho6FVasXWVXY/NliVXrLFh1vzU2IDsntag==
X-Google-Smtp-Source: 
 ABdhPJwZ4XsCOe4GZPzA9pwQl8q4VEji85XVYF5K7VWOACFv7bxZ0LGGVJUsMcSyqICrLqo56Mv19w==
X-Received: by 2002:a5d:584a:0:b0:20a:b2a6:9916 with SMTP id
 i10-20020a5d584a000000b0020ab2a69916mr1082108wrf.85.1650454180945;
        Wed, 20 Apr 2022 04:29:40 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9745:8b8f:81da:af07])
        by smtp.gmail.com with ESMTPSA id
 g13-20020a5d64ed000000b0020a9e488976sm6350240wri.25.2022.04.20.04.29.40
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 04:29:40 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH][honister] conf.py/poky.yaml: Move version information to
 poky.yaml and read in conf.py
Date: Wed, 20 Apr 2022 12:29:36 +0100
Message-Id: <20220420112936.2523983-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220420112936.2523983-1-richard.purdie@linuxfoundation.org>
References: <20220420112936.2523983-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Apr 2022 16:46:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2802

Merge in the changes from master allowing conf.py to use information from
poky.yaml. This allows the head version mapped to X.999 on the website to
have the version information displayed clearly and correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/conf.py   | 22 ++++++++++++++++++++--
 documentation/poky.yaml |  2 ++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index bef6fbfa4..22d0dd604 100644
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
 
-current_version = "3.4.3"
-bitbake_version = "1.52"
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
index 9398fd5cb..d8ee000c0 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -6,6 +6,8 @@ DISTRO_NAME_NO_CAP_LTS : "dunfell"
 YOCTO_DOC_VERSION : "3.4.3"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.3.5"
 DISTRO_REL_TAG : "yocto-3.4.3"
+DOCCONF_VERSION : "3.4.3"
+BITBAKE_SERIES : "1.52"
 POKYVERSION : "26.0.3"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
-- 
2.32.0


