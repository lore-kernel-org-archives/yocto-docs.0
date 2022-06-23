Return-Path: <aatrapps@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD316C43334
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 13:16:08 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web12.7171.1655990165870788523
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Jun 2022 06:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L1KLo5MZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.174,
 mailfrom: aatrapps@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id v6so4095731qkh.2
        for <docs@lists.yoctoproject.org>;
 Thu, 23 Jun 2022 06:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qiPiatfPWEwGufsjVSehMUW9iFF8jvE1QXpTUkvHJG4=;
        b=L1KLo5MZKjHGRfHOC4GC0+cV2novbIdAQDdKPtsw/BuySb5BT8vPcLuzFA/vRu21t1
         +D9J39JtCKT3Klr3WGUzpPSOtfpreKwcvf6J28oqcUdmcGqOewGE0rvtJX99zX6BWLtb
         dLT2ScNnL8jfG2T/MVsfB8TswMgH9T5+/0ofAnnVq2MgY46ttFSliu5jJmiKebdhZLz/
         DNpPtk3xaMHn+Q/qqRQGtXT1IXsWpgVdZdI7dgAcK6WMvnnMt/uFzDqj1wuRGwKKLFRa
         2J4HLglwVQiMeiBANOhT5XR7+aG+Uo4AJF9/R+7mwcvBcpwLX8xhTkhqpKaFhUQ1uPh2
         lv8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qiPiatfPWEwGufsjVSehMUW9iFF8jvE1QXpTUkvHJG4=;
        b=bCoM3nRW9ut5YbCwXtAeZOpkFKIUlSgTTs7+4XHa4s+Q5ELYs8IxpQuZnAPKe+F46C
         IiWftT8yGzMSMDrTluf3xVhRuzlz+4eoEy4VYvaCgauW9fYci/gAuD1S55NdJ2pF7XEN
         v2CrVTQoJJZd5oXIHDx96V31Vy1INiyEfp6ezOXVxSBwV7n8eNIMEbIIqodrLBvGdHYR
         6cEJDN6SvjLlSaVdVhjWSMHYNXx/Y9HxsufXgxsEiTZz0Q/XN8Jsvj4u1N4sljyjBgIl
         V2b8R7nhlbrZ0UeXTgl7nPXGoOuWhU8qf7i+bg6tABOtyyls/uAFkp75WKEjwabMRjlW
         unZQ==
X-Gm-Message-State: AJIora+iazOBkFSfTEh1SyiWfeSQjV0HakjAE/glcSPhSmzuL4Bv6avv
	MeVwNz9U8j9FyWFlSQGaIrG7/5aeukQ=
X-Google-Smtp-Source: 
 AGRyM1te0E2QJ/kDHKDVzOK4M1BLHvjz1KRZ+OvOI5jgD0JjAmBqXGnpTAFgbdixal+F3WnL+kgxFw==
X-Received: by 2002:a05:620a:2805:b0:67d:5c7e:c43a with SMTP id
 f5-20020a05620a280500b0067d5c7ec43amr6419569qkp.84.1655990164617;
        Thu, 23 Jun 2022 06:16:04 -0700 (PDT)
Received: from localhost.localdomain (ool-4578ffd8.dyn.optonline.net.
 [69.120.255.216])
        by smtp.gmail.com with ESMTPSA id
 f11-20020a05620a408b00b006a37c908d33sm18953334qko.28.2022.06.23.06.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 06:16:04 -0700 (PDT)
From: Aatir Manzur <aatrapps@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Aatir Manzur <aatrapps@gmail.com>
Subject: [PATCH] docs: make DISTRO_FEATURES examples more explicit
Date: Thu, 23 Jun 2022 09:15:43 -0400
Message-Id: <20220623131543.46899-1-aatrapps@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Jun 2022 13:16:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3026

Make DISTRO_FEATURES example more explicit by specifying
that DISTRO_FEATURES alone can't select build configurations,
and need mechanisms like PACKAGECONFIG setup to take care of
selecting build configurations.

Signed-off-by Aatir Manzur <aatrapps@gmail.com>
---
 documentation/ref-manual/features.rst  | 4 +++-
 documentation/ref-manual/variables.rst | 5 ++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index a8d0dac99..6f9edf1a1 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -100,7 +100,9 @@ packages, and they can go beyond simply controlling the installation of
 a package or packages. In most cases, the presence or absence of a
 feature translates to the appropriate option supplied to the configure
 script during the :ref:`ref-tasks-configure` task for
-the recipes that optionally support the feature.
+the recipes that optionally support the feature. Appropriate options
+must be supplied, and enabling/disabling :term `PACKAGECONFIG` for the
+concerned packages is one way of supplying such options.
 
 Some distro features are also machine features. These select features
 make sense to be controlled both at the machine and distribution
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 28267101d..48bdf3810 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1873,7 +1873,10 @@ system and gives an overview of their function and contents.
       optionally support the feature. For example, specifying "x11" in
       :term:`DISTRO_FEATURES`, causes every piece of software built for the
       target that can optionally support X11 to have its X11 support
-      enabled.
+      enabled. Note: just enabling :term: `DISTRO_FEATURES` alone doesn't
+      enable feature support for packages, mechanisms such as making
+      :term `PACKAGECONFIG` track :iterm: `DISTRO_FEATURES` are used
+      to enable/disbale package features.
 
       Two more examples are Bluetooth and NFS support. For a more complete
       list of features that ships with the Yocto Project and that you can
-- 
2.31.0


