Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF63AC77B78
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 22:35:22 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.36016.1683153319257334550
 for <docs@lists.yoctoproject.org>;
 Wed, 03 May 2023 15:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=gDvyGh3s;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.215.177, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-52c6504974dso1099848a12.2
        for <docs@lists.yoctoproject.org>; Wed, 03 May 2023 15:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683153318; x=1685745318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jj5tKRiYi6Ze3Qs7j6fqqsPIkxU1WvxrKsGPhWo6cjE=;
        b=gDvyGh3ssgmBkPZa+cIgnOl6KXk742+jBN36Q4MtGKP1QaZZX233RonDEyU+gTV6D8
         gTIl6QRsmB7uKAS6T/CH3GfSYQRo2blQTGT0DSYv2uFFDMfmsuxGpuXdCq+1kebLuHmo
         Vl7FSwfTuelJLg6fDypJ4DNNCXM5EFEeRvRik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683153318; x=1685745318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jj5tKRiYi6Ze3Qs7j6fqqsPIkxU1WvxrKsGPhWo6cjE=;
        b=GMqdzhw28CT2yUT3MtFLw2UlKE1dFrk34EfQAuEHEdZW3YU7UJBTL5uPFd+ygJ9rS5
         yDKK4KZOpK54Qt5wR94HxwMKRWqxRu88itOx8x+i1klPTbHl3RHTBkdRcJHkkpfgd9FT
         R0IEdKtL3G2JnbSVxJK/N11+D9BS2sNph9/hUY7x7t3CVFIV0IeYiiBYsGDCX7YSG2Ke
         i90WNPQW5EnToabQPipSNiyJcOuMaxpUR+XFKFwW+3V/+WvBFXlKlUxoVw5oeLYGwk2M
         4daTI5m2ZXrOVjo8cYVVGpCo4VFqQFvM0WTSa5xhg+pj79TAUr+hSLbKnZ3YBBb5wrLk
         ZKdg==
X-Gm-Message-State: AC+VfDyZ52y4XYLu7Bb1uoLBM9MkGbQiLwpcjkWZ/97+9usp32wuv+FI
	xQZHQXwAtd55992yff6CI1DfvqKCoNXyUUmIEVY=
X-Google-Smtp-Source: ACHHUZ4DUaONf+if92sLPrJI8Lg9Pm5m8Y9Lrq6UgrrftcvPS/Iinu2bD8Drtr1Hb8zWIqZsLlz3mQ==
X-Received: by 2002:a17:90a:7c09:b0:24d:e937:6670 with SMTP id v9-20020a17090a7c0900b0024de9376670mr105412pjf.19.1683153317825;
        Wed, 03 May 2023 15:35:17 -0700 (PDT)
Received: from halstead-B660M-DS3H-AX-DDR4.chateau ([97.115.159.33])
        by smtp.gmail.com with ESMTPSA id v10-20020a17090a520a00b0023fcece8067sm9896643pjh.2.2023.05.03.15.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 15:35:17 -0700 (PDT)
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Cc: richard.purdie@linuxfoundation.org,
	michael.opdenacker@bootlin.com,
	Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [PATCH] docs: add support for mickledore (4.2) release
Date: Wed,  3 May 2023 15:34:56 -0700
Message-Id: <20230503223456.23985-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 May 2023 22:35:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3904

This adds support for the Mickledore (4.2) release and update the
current dev branch to Nanbield.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 documentation/poky.yaml.in    | 12 ++++++------
 documentation/set_versions.py |  6 ++++--
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 1c072c1d0..b2b6a6330 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -1,10 +1,10 @@
-DISTRO : "4.1"
-DISTRO_NAME_NO_CAP : "langdale"
-DISTRO_NAME : "Langdale"
-DISTRO_NAME_NO_CAP_MINUS_ONE : "kirkstone"
+DISTRO : "4.2"
+DISTRO_NAME_NO_CAP : "mickledore"
+DISTRO_NAME : "Mickledore"
+DISTRO_NAME_NO_CAP_MINUS_ONE : "langdale"
 DISTRO_NAME_NO_CAP_LTS : "kirkstone"
-YOCTO_DOC_VERSION : "4.1"
-DISTRO_REL_TAG : "yocto-4.1"
+YOCTO_DOC_VERSION : "4.2"
+DISTRO_REL_TAG : "yocto-4.2"
 DOCCONF_VERSION : "dev"
 BITBAKE_SERIES : ""
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index efaebe43b..354dabe61 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -26,8 +26,8 @@ ourversion = None
 if len(sys.argv) == 2:
     ourversion = sys.argv[1]
 
-activereleases = ["langdale", "kirkstone", "dunfell"]
-devbranch = "mickledore"
+activereleases = ["mickledore", "kirkstone", "dunfell"]
+devbranch = "nanbield"
 ltsseries = ["kirkstone", "dunfell"]
 
 # used by run-docs-builds to get the default page
@@ -36,6 +36,7 @@ if ourversion == "getlatest":
     sys.exit(0)
 
 release_series = collections.OrderedDict()
+release_series["nanbield"] = "4.3"
 release_series["mickledore"] = "4.2"
 release_series["langdale"] = "4.1"
 release_series["kirkstone"] = "4.0"
@@ -66,6 +67,7 @@ release_series["laverne"] = "0.9"
 
 
 bitbake_mapping = {
+    "nanbield" : "2.6",
     "mickledore" : "2.4",
     "langdale" : "2.2",
     "kirkstone" : "2.0",
-- 
2.34.1


