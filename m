Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F43C982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 18:33:07 +0000 (UTC)
Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2908.1790101980725945448
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 11:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rysP2KHg;
 spf=pass (domain: gmail.com, ip: 74.125.230.204, mailfrom: twoerner@gmail.com)
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb766bfd3so1545541cf.0
        for <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 11:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790101980; x=1790706780; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YBN0/5c8sVeTVvBh/8WefsFyLOuyL+8kekGqSfEl1Vc=;
        b=rysP2KHgQc+UGHIwJM46a98i5aVjvYIYc3sgv3CI4aiJpi5tWDPEcp828bYCCL9A+T
         QqUAN4XBpQi6LGZh8xowpEyxzvGFHBATXtr+Q50d4XmrdsI3Mz6BMkuVhwuxON9vW6ae
         L2AueF3/4BajoooMwHai7LcFgbok+rIKtYA1uGyV06+1Rh1akPn8qg6/a/468CFj3xvq
         fvdQmv9P320dsmdvXSj2o24zXyHI8b1A8gHXU+FJfSQrbZ8XYalc7JFQGZcTjyO3URC6
         SM9E5r5whAWEsE47MFK+jV2fneN0hEKXg7+MaaihgtfYlL5oIDMy+F/EhruU+noJbFBs
         mLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101980; x=1790706780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YBN0/5c8sVeTVvBh/8WefsFyLOuyL+8kekGqSfEl1Vc=;
        b=1WFkIc2JUPs54vCco3BKFMHs9H27eBpUpbQPp1ZDE5mcF9NU40sCO+bpZtB1/92nBN
         jKUO635s0LEnqb4GZ2l0PV8Xytm2/e7hKiM7yEgfww/lTFhhogQsWQdRhAUpHe0Nmv4/
         R4GTxoq3Ba4E3yLw9rnHeQiUNK0dN+bx6BQ4h9HTnzcylnfytJZ991r86IRcgTTfEcqH
         /8dBVboTFs09jiVKCa6eSOIAcjyVp85ZYPKoIgpbQP5RG9rssCDrCjCbwh3BcPfI9wes
         0lHUIitTBAQMdMfJJhWCB/y7CBa+heybXs88Hdcr87agWkq/x4Z4L4wc6wBcKwy5dylI
         iyQQ==
X-Gm-Message-State: AFuF++nSkaB7b1xwH/f18xdSJOjkOjvv8YlTqhF+LRtnIFWcdN/HdcHM
	sCa1fyRXD0aCyklyZY/7qKZ+Ylezc14QdvHJ35oCwzoiC5mYqK8fQjFvB0S6KA==
X-Gm-Gg: AYBFou23k/Nvj89++T/zeY8LfIBZ/hIDjzggiI6hkDQqoh9PEoW6Od4ZWrGDLLT9hgs
	wVhnFDTAfNdxE/MBhW2C0DhmHhEqwilJwPEX37wajNJR5RELdJJgtw4VihqMVRtk67AALZcMyVx
	yhP/eOwVwqN3JMgQmM4bJauSUb1OXC45qkYY2bbVH97zih8mVYayVQJclOM1lqh8rsAIBXHxN++
	/ZuKfiQYcAvJU5H73so/ei9p9b3yN0e3PbmsMTsnfpXIC5ChUdDemwSUB988thYXlXQDAd/rkkB
	D/8agAWBDHqgStxRvSby592FbB1iE0mMsyFE3zjxA/+RXVk5Bcjhhb6YoT5DAqE4bdhhVf54uMB
	2eDNAF8f+eldvRNdE73AYRCEqk6ZVRJXGjsfoP2RIircjbVzHi7k1KAG6tpCgrH3DTgPgZa5pjZ
	hIZHbVq/H7rKOy8+HONAP/pC9eM4+opH3Bdjs368bycrwPGotpdek5XLNHJELwacH3Y7OGBKNlo
	EWgJLNcm0NngL0M4cHpOXVzb0oJx8bOLMNieKS9Pq2OdNEzS5c=
X-Received: by 2002:ac8:7f8f:0:b0:532:b327:fae7 with SMTP id d75a77b69052e-532ead2a8cemr6174731cf.62.1790101979559;
        Tue, 22 Sep 2026 11:32:59 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb3396f6sm3112821cf.19.2026.09.22.11.32.57
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:32:58 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v2 4/8] docs: write an elided passage as a comment
Date: Tue, 22 Sep 2026 14:32:45 -0400
Message-ID: <20260922183249.2433345-5-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260922183249.2433345-1-twoerner@gmail.com>
References: <20260922183249.2433345-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 18:33:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10593

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
changes in v2:
- rebased on master-next; no other change
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


