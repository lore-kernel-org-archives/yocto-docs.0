Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D118C4743F
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:07 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web08.6540.1650454181845785859
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 04:29:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DDRet7e+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id
 l3-20020a05600c1d0300b0038ff89c938bso2301040wms.0
        for <docs@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 04:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Yw4E8RutfRtfY75prCNrMYdOiUH5yUEo5tSwtHxJj/4=;
        b=DDRet7e+QDgPAx6cru/T4uFKQgCyhheg/NtKKNis8l+0RLp1uF7Aj3/Bk3Wot2rwDK
         SxAlwwXBkpf+6oDsEXE1PwUlDjx+vCEILmje7OEEhEsimzmtoCovm3tIIyzGTfqcG4zi
         f94CFu8KXo3bE/j8LZVCpJA3y7Fl08HaBzSzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yw4E8RutfRtfY75prCNrMYdOiUH5yUEo5tSwtHxJj/4=;
        b=m5M0P4Pc7JsuVHfU1qpJ5Lr06ygIuJgLknEheqsxArfsM/ZBcL02ywBatefzcWdGxC
         8QqykEpluToBdB3z0/Y7/geXeYOKKOyeOk24Nj4OKt3G4sbs4zM0dM4FSWzWdzXztRIZ
         jJgs/KkQJc/wZ/YfuE6jgirxgEIIj3mXEgWW/7morSXV/2F2bKazhKGLHzonQwkEmAzX
         LdXYv5B8aBZSAisNu3MHGNcwX2+P9ptqH/HWLVPqsp7lkw/zWicyNQhgL53/1UgXd7dX
         45Bqko6zJesi5PjR8OuJVFqkvbgwBBchU+lbJWxlbscsvy2TyC1vTI950v22hTeCmVMQ
         rhMw==
X-Gm-Message-State: AOAM531kPVmF+M8TsGB016KU2NEsso3a8RDIJyy5wFJPPrJcq16QRdCT
	s/33YGrfuinmrwogo/2fhysasS0JpNN9+Q==
X-Google-Smtp-Source: 
 ABdhPJx+gRQAbk4ixbptpVKYwBYHycySazdszd4OcvM+MczfwUMQffqFS3rnTeaHBtpBnietRlY+WA==
X-Received: by 2002:a1c:2543:0:b0:391:7aa1:7925 with SMTP id
 l64-20020a1c2543000000b003917aa17925mr3131550wml.75.1650454179997;
        Wed, 20 Apr 2022 04:29:39 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9745:8b8f:81da:af07])
        by smtp.gmail.com with ESMTPSA id
 g13-20020a5d64ed000000b0020a9e488976sm6350240wri.25.2022.04.20.04.29.38
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 04:29:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH][hardknott] conf.py/poky.yaml: Move version information to
 poky.yaml and read in conf.py
Date: Wed, 20 Apr 2022 12:29:35 +0100
Message-Id: <20220420112936.2523983-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220420112936.2523983-1-richard.purdie@linuxfoundation.org>
References: <20220420112936.2523983-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Apr 2022 16:46:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2801

Merge in the changes from master allowing conf.py to use information from
poky.yaml. This allows the head version mapped to X.999 on the website to
have the version information displayed clearly and correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/conf.py   | 22 ++++++++++++++++++++--
 documentation/poky.yaml |  2 ++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index e7c2e502f..d2478ae00 100644
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
 
-current_version = "3.3.6"
-bitbake_version = "1.50"
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
index 769a981b6..d57b4d710 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -6,6 +6,8 @@ DISTRO_NAME_NO_CAP_LTS : "gatesgarth"
 YOCTO_DOC_VERSION : "3.3.6"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.2.4"
 DISTRO_REL_TAG : "yocto-3.3.6"
+DOCCONF_VERSION : "3.3.6"
+BITBAKE_SERIES : "1.50"
 POKYVERSION : "25.0.6"
 YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
-- 
2.32.0


