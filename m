Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7F9CD6E7C
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 11:58:28 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6435.1780660705178254139
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 04:58:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ILAwvb46;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-91563382bcfso214454185a.0
        for <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 04:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780660704; x=1781265504; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Zof53U15WqG+/LzbK2nFsJrNr8riFApHgkAIrBaCPk=;
        b=ILAwvb46iCd64qtJLCKVTA4XaXovgmY4DhX0c3UsBETE9uP1jGKMfWW+/KMJMfLpba
         XeOGCY1JojjVR7q7jte2r028RzkmgSHPomIbnvJXpHi8kAsxj5mO5auF71spfLQCQ1BX
         kQbRxKcB1l5VFBO9OaPLx/U/yqYSgXGf6acYGWmOCc5e3v4nQYmFsVFCN5i4waju1ctN
         IcxNp1M28UXvkZDH+4Hor8cjeRl5MfO19saJ3VXivUw9LkPVc+fBUQjbrRZonEuuPKci
         vQfQpP31Qkh8z98ndOeUPhcxh8BNRf3iC2hAGqcQGhnToRkVaYOoGQj9U3omjkWxTXHE
         ZWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780660704; x=1781265504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Zof53U15WqG+/LzbK2nFsJrNr8riFApHgkAIrBaCPk=;
        b=TLRW6HpbrjIN6g6wFucP+ECTNMTW9z0X20y0oWrVbLBaH+6oa3jyGN5E1bBA647swg
         0F3Nc52GU9OPVo8gbn/txcGrdQFxUrtr7L3KERvp8EekPoZDB1zLgGK8N9dC68Gyef93
         Jv41v9r8in1o/oUfDQDB/uSoeGP/I/qmff35HTqjGUX52rO9Ov351VkxjZidl40MN9U4
         DAfA0zEjdTRUlNHNIJ/EWuYZTAfQXFvmmaiRqleP+JoK3PJl1M9ru9LtXczjMu/eKt1v
         zUFLtLEcr7d8pV4Jn8cMUY2wXq3A1I8kh5eeDl9nlUum+uHiHj/RFn66lim05HHGN9HH
         1fOg==
X-Gm-Message-State: AOJu0Yzc8xuLnGNmyDZ0t4JhRkeWz1KD1dntMRY2Vi/XFrf12OA9JuUd
	qTEkNX42LBNXTSHRhWQz1LH1rEOIw1zuUuecny0XgfOVrqRC2ciBALaum7JnVxNh
X-Gm-Gg: Acq92OHdMhxboz8/v4MDrbT7DpK5ppEZYKuMDYtxBYBKa7y2ujtPz04IFeH+x05WKP0
	rEWWuVABrhmdP+/9ofz4/Z7I6poK5XveWqTRxSvCUScKcfD2emmEw0u6p9xQOZ20vHnFQyec0kq
	51lIHsWgQ36syx+nlnyj8B7AOD0A8YiEh15KBcwXFyCQWN8PPhGlFTA547t0bbiq6+O2lrAKHHw
	UhEZHBbZuBsK7lsZnZ60NtEo+8yOIHaDjwssMu2JAVFxE6WDCDTxuTEne1M1Nqv07XAlVCFC/T3
	sb12mXTAVtdeGSUpa7oq54ahKZsim0ITxdolBnR03HgiFyiAzRHKHFcYjCULK8N4m9ex2kJ/f/1
	ibzeUZnkiQ+4cF0ApMGI8FHBapd9lSnEKu2GPdDsj+RqCVlarkloGBT509Oo6wbJElpkmymP2UI
	jOY9O/MqsSbPVSHhjq7wxfwdS6zLouDITISrMvcbYjzqDCj5+3NEKeYhZFP37f3XZ17B8GmzUTb
	QCacKs8yoTWhJbhzMI4r9O0YoK37CNcKHAo1xj1xNU+94GL4XMeSqmsw52+q1M3vVplIQ8Rt8ZO
	Pn/tvsbJotI3MB6ecKW0F11IXu5fuQZ0CRceqyJbFQqa0OwKu1eJFyE=
X-Received: by 2002:a05:620a:f0d:b0:915:931e:5e8c with SMTP id af79cd13be357-915a9c7584dmr631028985a.7.1780660703945;
        Fri, 05 Jun 2026 04:58:23 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a009fe7sm861597185a.8.2026.06.05.04.58.22
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:58:23 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: docs@lists.yoctoproject.org
Subject: [docs][PATCH] kernel-dev: document patch handling for discovered BSP descriptions
Date: Fri,  5 Jun 2026 07:58:16 -0400
Message-ID: <20260605115821.2909728-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 11:58:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9587

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Users adding a recipe-space BSP commonly list their machine ``.scc``
directly on SRC_URI as a ``file://*.scc`` fragment. That fragment is
processed in both the configuration and patch phases, so any ``patch``
directives it (or the arch/bsp descriptions it includes) reference are
applied to the kernel source. When the branch being built already
contains those commits, do_patch fails -- a confusing result with no
documentation explaining it.

The kernel tools only inhibit patch application for the *discovered*
BSP description (the one located via KMACHINE/LINUX_KERNEL_TYPE), on the
assumption that its commits are already in the branch's history. Nothing
in the manual states this, nor that delivering the description as a
type=kmeta directory is what makes it discoverable rather than a plain
fragment.

Document the discovered-BSP patch-skip behavior, show the KMACHINE +
type=kmeta form required to trigger it, and describe the
KMETA_EXTERNAL_BSP opt-in for genuinely out-of-tree BSPs whose patches
must still be applied.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Hi all,

This is my first direct patch to the docuentation after all these
years.

So I'm sure I've got something wrong!

Cheers,

Bruce

 documentation/kernel-dev/advanced.rst | 58 +++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/documentation/kernel-dev/advanced.rst b/documentation/kernel-dev/advanced.rst
index 97cb66322..12473cbb3 100644
--- a/documentation/kernel-dev/advanced.rst
+++ b/documentation/kernel-dev/advanced.rst
@@ -719,6 +719,18 @@ form from your kernel append file::
        file://myplatform;type=kmeta;destsuffix=myplatform \
        "
 
+The ``type=kmeta`` attribute is significant: it adds the directory to the
+kernel Metadata that the tools search to *discover* the BSP description
+matching :term:`KMACHINE` and ``LINUX_KERNEL_TYPE``. A ``.scc`` file listed
+directly on :term:`SRC_URI` (for example ``file://myplatform.scc``) is instead
+treated as a configuration fragment and is processed in both the configuration
+and the patch phases. Any ``patch`` directives that such a fragment references,
+or that are reached through files it ``include``\ s (such as an ``arch/`` or
+``bsp/`` description), are then applied to the kernel source and will fail if
+those patches are already present in the branch. See the
+":ref:`kernel-dev/advanced:patch application for bsp descriptions`" section for
+the reasoning behind this.
+
 Metadata Outside the Recipe-Space
 ---------------------------------
 
@@ -750,6 +762,52 @@ wish to use. Changing the data in these branches and not updating the
 :term:`SRCREV` statements to match will cause the build to fetch an older
 commit.
 
+Patch Application for BSP Descriptions
+--------------------------------------
+
+During the build, the kernel tools search the kernel Metadata for the BSP
+description that most closely matches the :term:`KMACHINE` and
+``LINUX_KERNEL_TYPE`` values passed in from the recipe, and use the first
+description they find that matches both. This is referred to as the
+*discovered* BSP description.
+
+For a discovered BSP description, the tools deliberately do **not** apply the
+``patch`` directives reachable from it, either directly or through any files it
+``include``\ s. The kernel source branch you are building (:term:`KBRANCH`) is
+assumed to already contain those commits as part of its history, so re-applying
+them would fail. Configuration fragments (``kconf`` directives) are always
+applied. In other words, a discovered BSP contributes *configuration*, not
+*patches*.
+
+This is why a recipe-space BSP description must be delivered as a
+``type=kmeta`` directory rather than as an individual ``file://*.scc`` entry on
+:term:`SRC_URI` (see the
+":ref:`kernel-dev/advanced:recipe-space metadata`" section). To have your
+description discovered, place it in a ``type=kmeta`` directory and set
+:term:`KMACHINE` so the tools locate it::
+
+   KMACHINE:myplatform ?= "myplatform"
+
+   SRC_URI:append:myplatform = " \
+       file://myplatform;type=kmeta;destsuffix=myplatform \
+       "
+
+Here, the ``myplatform`` directory contains the BSP description (for example
+``myplatform-standard.scc``, beginning with ``define KMACHINE myplatform`` and
+``define KTYPE standard``). Because the description is discovered rather than
+supplied as a fragment, its ``patch`` directives, and those of everything it
+``include``\ s, are inhibited, while its configuration is still applied.
+
+If your BSP genuinely lives outside the kernel source history (the branch you
+build does **not** already contain the BSP commits, and the patches *must* be
+applied), the BSP description can opt back in to patch application by adding the
+following directive to the description itself::
+
+   define KMETA_EXTERNAL_BSP t
+
+With that directive present, the discovered BSP description is also injected
+into the patch phase and its ``patch`` directives are applied.
+
 Organizing Your Source
 ======================
 
-- 
2.43.0


