Return-Path: <bijak.dawid@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB37AFDEE2B
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 16:49:54 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2196.1776962988816200785
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Apr 2026 09:49:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qOYGTpYh;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: bijak.dawid@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso49866605e9.2
        for <docs@lists.yoctoproject.org>; Thu, 23 Apr 2026 09:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776962987; x=1777567787; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8WYmgpa7BgLcjs2r+dTxTOB0VuhkJdz8E3ik2k08RIE=;
        b=qOYGTpYhjtdjpoBD2QhB/J1NWzli+lWgxs3iqu0ZUwA3+tixFsoPHCyl9X6VXLtuni
         52nr5Y3JczMHlsHj8bY8wXATcP7oQGF0GnEXZU4DkY2Ddml871RGFM0sEtPxpuGa7Oq9
         bwV9/cOXhxHlG2X0bsSs071pbi/ThnBhBRcrfDseDeKCbSOvLUREFOVMFRr9Irqp1ZRI
         o4oWdTsKmg7kUSd3YQ4l4dFP7c0cF4dAjWiJU6CPax3qT08XZp04q+IT2UC+Tb7jSL+D
         Giv2EE8tWxFLTGsabXuE4BXZ5LCM5Pzgv/40TPIEaFa17OXL5RM4gpjvB2l7tPByE2E4
         PM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776962987; x=1777567787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8WYmgpa7BgLcjs2r+dTxTOB0VuhkJdz8E3ik2k08RIE=;
        b=T3IgSiXWqHp4RAR4DCWW21LmZJB/G/5eg85WtRR5D4Q9FAMenkuWExLDfYitSuOuIG
         OPGKssCufRz/NR0nMEBqtnsbxjeg9UJWa8p2YOHuButLU/0RyMRUflzl6K8sQXyQNhlZ
         zL/EK1UcIBUJxR1mTAUbsXPxzbAVJywl88wIeovrj2LZ4O1CS/MCojIGuZrRVx0MBoVj
         V3pcAPcZuaKytdLWSetFRP0bqWptMCxLRxQIUXL1TunhTHbQ/xO+4nyoVm66d4KdlT48
         nTdTOuaIt3nIPGLAMj1w7BbO10sDGf/Vcrs9gu6ZvQosHElU+OrCg+zRoRSA/j10kyIC
         /OCA==
X-Gm-Message-State: AOJu0YyJQWeMRTeu4KRmzVSL6CPpJVbUuqpqyQWwHKceP2+I/oFNdyfV
	t6c1EChECGwN0YlNQA+Oq4npB1pc3ek/NDP5369uzUSH9g08iB8zku32C4rL75iVDs0=
X-Gm-Gg: AeBDievXtG4JNOl/E5XFLJzFbpdsZh3LMr7bMfQNTZcauerSgkOtf2wn5ZixJ+ECcWt
	O3+/WrvjGGaz0ifeES7ayiRY/rlnSnnbhAbAYZONrMPl0JpvAbkBTnLbm41W4JVcsR8ChVHaTq4
	ndDHGKPfWdg/NqtKOdIFrADqql2j2pNjbksGyaFSWIffy/yK4jnvS7dU4xQwVBAZvdADpLL8gbL
	wMgEbvLfQxjfdk8I0BZyG/QNDJHiTlZdUPfSo06EkKi0isZnJOQWD9ILB7l6ZnFOwuADwMXCKUG
	TzSBFVPC7BlpGBsmQlhTQp3ptaEeWya4feXPpuBKDn84Ha/8ltT6swOgczTJZl9LsViBgQqxQ93
	rHL4WnLPpWJMl6y9U9y2I26nXhswJcSuUh9YLSE82gjpzOlCJeDFHGPcg5A6zVncNboX0N3tZ4W
	wloTYnmGepAwP0won9OHrqt3Rp7B7Qy/McE71xahGIVbp35SiSfAchPJ69QKfiKNnOr+UH+QGlh
	VRMm8sNUCulYhK7J0pDMT/IMCFy4K5j+RvBPZ5in2xF36ig6TzoFFpCElNtbkMO
X-Received: by 2002:a05:600c:5297:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-488fb74a431mr448652725e9.8.1776962986728;
        Thu, 23 Apr 2026 09:49:46 -0700 (PDT)
Received: from thinkpad.fritz.box ([2a02:8070:d188:380:546f:58e1:d510:ae3f])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48a59816b71sm89671965e9.1.2026.04.23.09.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 09:49:46 -0700 (PDT)
From: Dawid Bijak <bijak.dawid@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Dawid Bijak <bijak.dawid@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2] overview-manual/concepts.rst: fix do_prepare_recipe_sysroot task description
Date: Thu, 23 Apr 2026 18:49:25 +0200
Message-ID: <20260423164925.13326-1-bijak.dawid@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Apr 2026 16:49:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9335

The description incorrectly stated that the sysroots are set up for
use during the packaging phase. In fact, do_prepare_recipe_sysroot
runs before do_configure, and the sysroots are consumed by
do_configure and do_compile.

Refer to do_configure and do_compile as the tasks that consume
prepared sysroots. Briefly describe the role of each sysroot.
Link do_configure, do_compile, and do_populate_sysroot via
:ref: to ease navigation.

Suggested-by: Alexander Kanavin <alex.kanavin@gmail.com>
Suggested-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Dawid Bijak <bijak.dawid@gmail.com>

---

changes in v2:
- incorporate suggestions from v1 (thanks)
- link other do_* tasks via :ref: to keep the list consistent and ease the
  navigation
- link to v1: https://lore.kernel.org/all/20260422185404.14111-1-bijak.dawid@gmail.com/

Signed-off-by: Dawid Bijak <bijak.dawid@gmail.com>
---
 documentation/overview-manual/concepts.rst | 29 ++++++++++++----------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 1faa790f3..ec5babe4c 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -779,17 +779,20 @@ to a holding area (staged) in preparation for packaging:
 This step in the build process consists of the following tasks:
 
 -  :ref:`ref-tasks-prepare_recipe_sysroot`:
-   This task sets up the two sysroots in
-   ``${``\ :term:`WORKDIR`\ ``}``
-   (i.e. ``recipe-sysroot`` and ``recipe-sysroot-native``) so that
-   during the packaging phase the sysroots can contain the contents of
-   the
-   :ref:`ref-tasks-populate_sysroot`
-   tasks of the recipes on which the recipe containing the tasks
-   depends. A sysroot exists for both the target and for the native
-   binaries, which run on the host system.
-
--  *do_configure*: This task configures the source by enabling and
+   This task sets up the two sysroots in the ``${``\ :term:`WORKDIR`\ ``}`` (i.e.
+   ``recipe-sysroot`` and ``recipe-sysroot-native``) so that the subsequent tasks
+   of the recipe (notably :ref:`ref-tasks-configure` and :ref:`ref-tasks-compile`)
+   can access the libraries, headers, and similar files built by the recipes on
+   which it depends.
+
+   -  ``recipe-sysroot``: contains target libraries, and associated headers and
+      other data needed to cross-build software from its sources
+
+   -  ``recipe-sysroot-native``: contains host-native executables with their libraries
+      and other data, so that they can be run directly on the build host when
+      that is required by the build process
+
+-  :ref:`ref-tasks-configure`: This task configures the source by enabling and
    disabling any build-time and configuration options for the software
    being built. Configurations can come from the recipe itself as well
    as from an inherited class. Additionally, the software itself might
@@ -808,7 +811,7 @@ This step in the build process consists of the following tasks:
    class, see the :ref:`ref-classes-autotools` class
    :oe_git:`here </openembedded-core/tree/meta/classes-recipe/autotools.bbclass>`.
 
--  *do_compile*: Once a configuration task has been satisfied,
+-  :ref:`ref-tasks-compile`: Once a configuration task has been satisfied,
    BitBake compiles the source using the
    :ref:`ref-tasks-compile` task.
    Compilation occurs in the directory pointed to by the
@@ -816,7 +819,7 @@ This step in the build process consists of the following tasks:
    :term:`B` directory is, by default, the same as the
    :term:`S` directory.
 
--  *do_install*: After compilation completes, BitBake executes the
+-  :ref:`ref-tasks-install`: After compilation completes, BitBake executes the
    :ref:`ref-tasks-install` task.
    This task copies files from the :term:`B` directory and places them in a
    holding area pointed to by the :term:`D`
-- 
2.48.1


