Return-Path: <aatrapps@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D85E9C43334
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 17:37:24 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.120.1656005835177002039
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Jun 2022 10:37:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H7FonVcZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: aatrapps@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id p31so488367qvp.5
        for <docs@lists.yoctoproject.org>;
 Thu, 23 Jun 2022 10:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zP5GFEjHWODFNjFI/lmrOZFNvpxDGFpGgisJc1ZhRxk=;
        b=H7FonVcZv039gvKkoxKf15Oetz1+WZangHC80N63vlByAfLj1s8KYRj12B3J+3KRYV
         +3M+cLZ1b9LcvmReXZesiIZfr69jRm1/il0BeExlAXoaBv+8PKUk2rxGl6b149ogwpbu
         FE04pyu+0qkORQIqxNbXt8kmE16lDfmooQ5M3DxnKO/+fLh2xJ9j1LhtOtSRywRkY42W
         7quLNNVCJaFI0AXM9Tx11bwTYVByqle+Nk0DH3s8aXp8NS68Fj/N0pj22Xybk6QGcKJx
         3bYe5PTELi7T6Q6tgDKe2rouKJWy5brC+bVZSb3Rj02xYi1wAtqZAron6H6aIsoUyXM4
         vQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zP5GFEjHWODFNjFI/lmrOZFNvpxDGFpGgisJc1ZhRxk=;
        b=8NZkyYr7TEXrqeP/+j/dzY5xHig02gVWnHgOEXn8QXwvc9Rx8o+zxZ+PLUugwdg9JL
         ryQzZVBhnX5KImi0RF1lFEzwTow3xgMBd8rLTD/XjyDTkls2K0JsFvq8vZyrRD9+NCZ8
         xEW4m3XDtuSi6XWZG3QZ4cXLM23gZAuh/pE09cZLcMETeNvaRdoBR8w58U6IghcsuKDY
         W4zPPsyz9y8re+MNuItuE/v8hukL1uoOCkoBN2Tmt4lk+vTZfYwIffvXzh9dyEldlXgW
         QtIOSLRAw8d1GwlLWgP8EPvVSvUK/3OSe9wdou2ZxTHxZuBvD7b9XT5jf8IzXYsfQ93c
         vCMw==
X-Gm-Message-State: AJIora/Y84QloXijKQZntloWzASVNes5b71sBV2V0vN+OYBMEDvsUmFq
	KNwmJTtVH4t7BDLpMAkfaz/BIahljP0=
X-Google-Smtp-Source: 
 AGRyM1sS1DVfFaREOAJuVMHJRY4uAu+FrEYVIieNJ//SupnvSWs2ILLrwsEcUIUc+2NBzJtcbBQVMQ==
X-Received: by 2002:a05:6214:c63:b0:470:8e17:1d87 with SMTP id
 t3-20020a0562140c6300b004708e171d87mr2131177qvj.105.1656005834135;
        Thu, 23 Jun 2022 10:37:14 -0700 (PDT)
Received: from localhost.localdomain (ool-4578ffd8.dyn.optonline.net.
 [69.120.255.216])
        by smtp.gmail.com with ESMTPSA id
 g19-20020ac85813000000b00307aed25fc7sm17292336qtg.31.2022.06.23.10.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 10:37:13 -0700 (PDT)
From: Aatir Manzur <aatrapps@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Aatir Manzur <aatrapps@gmail.com>
Subject: [PATCH] docs: make DISTRO_FEATURES description more explicit
Date: Thu, 23 Jun 2022 13:37:10 -0400
Message-Id: <20220623173710.12957-1-aatrapps@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Jun 2022 17:37:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3028

Make DISTRO_FEATURES description more explicit by specifying
that DISTRO_FEATURES alone can't select build configurations,
and need mechanisms like PACKAGECONFIG setup to take care of
selecting build configurations.

Signed-off-by Aatir Manzur <aatrapps@gmail.com>
---
 documentation/ref-manual/features.rst  | 4 +++-
 documentation/ref-manual/variables.rst | 5 ++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index a8d0dac99..17521ac2a 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -100,7 +100,9 @@ packages, and they can go beyond simply controlling the installation of
 a package or packages. In most cases, the presence or absence of a
 feature translates to the appropriate option supplied to the configure
 script during the :ref:`ref-tasks-configure` task for
-the recipes that optionally support the feature.
+the recipes that optionally support the feature. Appropriate options
+must be supplied, and enabling/disabling :term:`PACKAGECONFIG` for the
+concerned packages is one way of supplying such options.
 
 Some distro features are also machine features. These select features
 make sense to be controlled both at the machine and distribution
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 28267101d..8f7b01c12 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1873,7 +1873,10 @@ system and gives an overview of their function and contents.
       optionally support the feature. For example, specifying "x11" in
       :term:`DISTRO_FEATURES`, causes every piece of software built for the
       target that can optionally support X11 to have its X11 support
-      enabled.
+      enabled. Note: just enabling :term: `DISTRO_FEATURES` alone doesn't
+      enable feature support for packages, mechanisms such as making
+      :term:`PACKAGECONFIG` track :term:`DISTRO_FEATURES` are used
+      to enable/disbale package features.
 
       Two more examples are Bluetooth and NFS support. For a more complete
       list of features that ships with the Yocto Project and that you can
-- 
2.31.0


