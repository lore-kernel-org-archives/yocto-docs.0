Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 612A1C98304
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 02:03:54 +0000 (UTC)
Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1333.1790042631991824023
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Sep 2026 19:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RXYOVpfW;
 spf=pass (domain: gmail.com, ip: 74.125.230.234, mailfrom: twoerner@gmail.com)
Received: by mail-qk2-f42.google.com with SMTP id af79cd13be357-93bef17c191so167909185a.2
        for <docs@lists.yoctoproject.org>; Mon, 21 Sep 2026 19:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042631; x=1790647431; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UgLOZfLZ9kJaW/QubwBhs+3U/m1XkLXmijduVo+E4NU=;
        b=RXYOVpfW6EsWUgyUYNyL9L+jul16ckUDqIfra5ZMZxwn/mzEm7F7e94Ph+LYlnFXFA
         i17lauf+h6pJoZKruKZ8ZUy4Cc3mdG6fQLs0vkWCXghB6JSJR7eMZRpH2EbpW7vGxeZl
         5O2/9Be5OJP48nSJUXi3FWVcDBGsNnkdc6SSF+HNtaHkLwgRpZHjZM7WSZmJAaKqhcL1
         knbgxmh+wMazPWJ3FLwRa/E3mOCEfbulHzBm5+MElLGhK37vG0fUTn42XH+iEdLLVbGY
         xN7vC0v8SViiAE6UjkLVeTziJmscF1L8u7lISV+VbNJY9B2D9kQREbngjAFe4T9FrMMp
         /meg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042631; x=1790647431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UgLOZfLZ9kJaW/QubwBhs+3U/m1XkLXmijduVo+E4NU=;
        b=MtN1/7L+B6RaYb/cVxy3qYeyCJIcL5KDXwP/wuDm5+2zdgdCoKEOVWUNdyclbZrie8
         Oga4y1z5vRfacJow0OpRTzJ3BjhrH9FEthbWXXysXh6UWQMYGawpT9RULr3a3wUeMzP6
         S4EXPzBk+RnErjMryZUbj/TWwIa9XDbNG+2N2xgFqebvVkZ78mF8T+IPbfqB5fo+9yp1
         TGFshHJeMkv0xAqiZW3ww/4UGSHq6LPZYImzaT+BUT04ZGKF7oEaJk1KPytsozvJK9Be
         jI9Nt7enk63jSb8so61lY3zZkmDbVch8wgzADpTgfLxqkdod35JiVn7bY1JqxbmujMrs
         18sQ==
X-Gm-Message-State: AFuF++lF1Ydzh6izadB3IAQUMIIbYpLPisPHgotpfUdhZoe/jU7TdqIi
	aibQVFGnx4+5UN5oEfCAmeCxZxOXGg0uBAGx4dzw38E2KeEYLtdf0MEGbnsj3g==
X-Gm-Gg: AYBFou3LqmMSy7bZNetceCnRtVLtS5ncS6J6M80IJ0gfHmSJBhcGZwVNnHxM85xlIMk
	UWXtZAhWk1P9dHcPMmJ8tqaedB67X57NuHOpEpTsyr6zj5qtl0jIWauJxVmVZT2diXfhUx/FKDy
	k8boH4n/0no0pgSoTEnt4AeZlcvGxt+jUt30j2D1iXw89YV5PonxP1xSAPSqAevJmnouzOT6OP1
	QTv203b9Rtq/yLJOmySQzOkgNrBubF2oI51ClslTfD469h0vkgBHZAxEfW0Oa6SjFRVXuMGS0gu
	YSf8eblx4JIBobDNkVDb8+aZmFHT8FHAgAiYkJCbMPTaLFrlKvF3Nr4TC5ecdgEqzlFIJR8OLD6
	fAk0C1ZRAYc1PW13FSgY1ne+CI3JShWXidGyJ6CXy4SEiPuMi7pFThWm7BQf8a6M9/hdnvUx3hn
	55csgkYhbrjsA9kJ+tRuCVRoPXOZYkXKZp3uB5JBdqHDz9DVGjifs5eppK9IBXW6W4krRt9WR0/
	2c5iVgpoj7MOH66MH5NXyfC6rvGDzP9J108AGfP
X-Received: by 2002:a05:620a:27d4:b0:938:ff8e:cd0b with SMTP id af79cd13be357-93c15d7639fmr347655985a.18.1790042630843;
        Mon, 21 Sep 2026 19:03:50 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c1d253165sm16817185a.46.2026.09.21.19.03.49
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:03:49 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 04/10] docs: write an elided passage as a comment
Date: Mon, 21 Sep 2026 22:03:33 -0400
Message-ID: <20260922020339.481929-5-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260922020339.481929-1-twoerner@gmail.com>
References: <20260922020339.481929-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 02:03:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10563

Several examples stand in for code they leave out with a bare "..." or a
column of dots on a line of their own. Neither is valid in the language
around it, so the example cannot say what language it is without also
saying something false about itself.

Use a comment instead, in whatever language the example is written in,
and say in it what was left out. The ellipsis on its own raises a
question - what is missing here, and does it matter? - that a few words
can answer at no cost to the reader.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/bsp-manual/bsp.rst                 |  4 +---
 documentation/kernel-dev/common.rst              | 14 +++++++-------
 documentation/migration-guides/migration-3.2.rst |  2 +-
 documentation/overview-manual/concepts.rst       |  2 +-
 4 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/documentation/bsp-manual/bsp.rst b/documentation/bsp-manual/bsp.rst
index dd613326942a..93af13f789d1 100644
--- a/documentation/bsp-manual/bsp.rst
+++ b/documentation/bsp-manual/bsp.rst
@@ -561,9 +561,7 @@ statements from the Raspberry Pi ``conf/layer.conf`` file::
 
    # Additional license directories.
    LICENSE_PATH += "${LAYERDIR}/files/custom-licenses"
-   .
-   .
-   .
+   # ... and so on for the rest of the file ...
 
 This file simply makes :term:`BitBake` aware of the recipes and configuration
 directories. The file must exist so that the OpenEmbedded build system can
diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 17b7dbac928f..555aadc76a6c 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -681,9 +681,9 @@ the ":ref:`kernel-dev/common:getting ready to develop using ``devtool```" Sectio
              printk("*************************************\n");
 
              if (per_cpu(cpu_loops_per_jiffy, this_cpu)) {
-                   .
-                   .
-                   .
+                   /*
+                    * ... remaining code unchanged ...
+                    */
 
 #. *Build the Updated Kernel Source:* To build the updated kernel
    source, use ``devtool``::
@@ -817,9 +817,9 @@ Section.
              printk("*************************************\n");
 
              if (per_cpu(cpu_loops_per_jiffy, this_cpu)) {
-                   .
-                   .
-                   .
+                   /*
+                    * ... remaining code unchanged ...
+                    */
 
 #. *Stage and Commit Your Changes:* Use standard Git commands to stage
    and commit the changes you just made::
@@ -1598,7 +1598,7 @@ looks much like the one provided with the ``hello-mod`` template::
 
    modules_install:
         $(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install
-   ...
+   # ... remaining rules ...
 
 The important point to note here is the :term:`KERNEL_SRC` variable. The
 :ref:`ref-classes-module` class sets this variable and the :term:`KERNEL_PATH`
diff --git a/documentation/migration-guides/migration-3.2.rst b/documentation/migration-guides/migration-3.2.rst
index 5cb958e75047..a037e6f51c53 100644
--- a/documentation/migration-guides/migration-3.2.rst
+++ b/documentation/migration-guides/migration-3.2.rst
@@ -100,7 +100,7 @@ This also applies when conditionally adding packages to :term:`PACKAGES` where
 those packages have dependencies, for example (from the ``alsa-plugins`` recipe)::
 
     PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pulseaudio', 'alsa-plugins-pulseaudio-conf', '', d)}"
-    ...
+    # ... elsewhere in the same recipe ...
     RDEPENDS_${PN}-pulseaudio-conf += "\
             ${MLPREFIX}libasound-module-conf-pulse \
             ${MLPREFIX}libasound-module-ctl-pulse \
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 3bf672c78387..1e9c6d3a6f0b 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -2193,7 +2193,7 @@ accomplished using fakeroot.
    ``virtual/fakeroot-native:do_populate_sysroot``, giving the following::
 
       fakeroot do_mytask () {
-          ...
+          # ... steps to perform task here ...
       }
       do_mytask[depends] += "virtual/fakeroot-native:do_populate_sysroot"
 
-- 
2.50.0.173.g8b6f19ccfc3a


