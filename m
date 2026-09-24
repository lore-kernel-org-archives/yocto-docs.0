Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF625C98324
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 17:29:08 +0000 (UTC)
Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3794.1790270945348239830
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 10:29:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iar15L9F;
 spf=pass (domain: gmail.com, ip: 74.125.227.41, mailfrom: twoerner@gmail.com)
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-78a53fe85easo23290137.1
        for <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 10:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790270944; x=1790875744; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nn6bBgY2JbzuzZekJC2r7V4Mvh/zZ1NzrWiQGXHOKbU=;
        b=iar15L9FR66yIXZHSHdXihi6YDiVhecsZ7Se0J6HclQ89oGZxMjAE6jW8BMeaorgcf
         MN5WEdfySM5tamTqdIMTUql20Zk+3+HgEIDviTV3jwxZ1tyhMXdVNXH4CKUyGmLoOY/r
         d+vyyPNucUedoiHosTkmdu1mTniOqHx5loqflsgKf9VfUee9UK3I3L16ZhTgKqAsIffy
         b48w2EeQj3PVv02iY+dVOGyuRYdu+elBiZu7lZir7GQSTnJ6NGM41AXqdqwL0jNe9hwm
         p7+HN6YHZnReCIz/7wUfxiOhg4fXLhgiBqzo3LktOUG9G4NoQXnJqlklgZXpg9PgCu0O
         gMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270944; x=1790875744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nn6bBgY2JbzuzZekJC2r7V4Mvh/zZ1NzrWiQGXHOKbU=;
        b=qJmN2qWSs3IqCajgnVUgNrYAs0C7t7emfzc+AVzjRNkvJKFkitDnNplZ7/nahBXnEh
         2qXzlO28hGNbA0qm7O+bLc1RSaANNZ5gtOa8dqLNiyEuusqR9rFgNjMclhmAILcJjSYG
         IuVNZ+T5+2/MIIi+VLYdNoAeqI5QF5eJl9/OtEJVqTC/87UXpuabSh3ZEvmWWwedZ8Yc
         o+MmM9VrIZh4Ap6XGp471jGGcJqhyyuF6mJ0XU/zHiTQH2iIcNLMcENPDMz0vtJvHAgt
         VOyxO751JfVAwqlMuy8ZBuahj3PfMUArNO1N0IXeF84SZfdeiF2lC9yWm5vDRCnWmzh/
         28Dw==
X-Gm-Message-State: AFuF++l9+9UYrFjMFnfCU08zqLeExrhQQ0z27HlaB0TlGZ8rR8nkKFsM
	fqJ880Oynsfja5phnbrxttDwt+tQDQPlXEacspFx/RFT6oNt+ys+xILJdxvQCQ==
X-Gm-Gg: AYBFou1KDty1H7n76HoMTG7iVqi1ZkM2/J4GySB23AxqIYkS6XQ2fXIumHLQiK8Sn1E
	hs7g7DktGxYY6IN/wBKKg6eaiqT6CKhUBkQFb8BgvLHh7+zVRDcA9DVrMxy1gjQOj0eARLCxTAQ
	Oao8tiriA3pg8b0vaLW4nTgYZczM59HbJygKbSaTWlG1/as2Gpr0RiXd5TlYN8DDNOs0uI3luPZ
	6gYGRoS5tXrg2NkBuFk7GEyVI7MIwFzu1MCuSoZBBaeVqBTGhcFWXRttfHG/lGC77R+4blK4V6R
	tWlUwgacIdKC08x46+DIeRZllOGBnHlMdO1E6d7lQkL2QWFqHv8+9As+GoNfYYUrdfju4VA+r7S
	f5FDXL+wDjdUQCSf1fXptcm3ipGC3C0MenjkwGZCFO2h1X6MugsE6pRHGmCe8OY99SxCpfKgU6Y
	ObMEFbi+h253+SSRJpOv1EZegbpAs26ni52/AAYCnxpO3kvMTdQtiMGW9Pr1uZnjLH0uYs99ta0
	LhSn+36iHBiQkb6yOc+8MOvjfQmD15KIrxEzjw08w==
X-Received: by 2002:a05:6102:4b1a:b0:7a7:5355:7fb6 with SMTP id ada2fe7eead31-7af1e4f8b12mr1303814137.24.1790270944062;
        Thu, 24 Sep 2026 10:29:04 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98530725838sm1797974241.0.2026.09.24.10.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:29:02 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
Subject: [PATCH v3 04/10] docs: write an elided passage as a comment
Date: Thu, 24 Sep 2026 13:28:47 -0400
Message-ID: <20260924172853.2665062-5-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260924172853.2665062-1-twoerner@gmail.com>
References: <20260924172853.2665062-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 17:29:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10627

Several examples stand in for code they leave out with a bare "..." or a
column of dots on a line of their own. Neither is valid in the language
around it, so the example cannot say what language it is without also
saying something false about itself.

Use a comment instead, in whatever language the example is written in,
and say in it what was left out. The ellipsis on its own raises a
question - what is missing here, and does it matter? - that a few words
can answer at no cost to the reader.

AI-Generated: codex/claude-opus 5 (xhigh)
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v3:
- none

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
index 6e67156bedc5..3de61cab08d6 100644
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


