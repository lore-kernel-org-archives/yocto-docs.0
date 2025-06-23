Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D61C7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 12:43:09 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.18669.1750682589401702980
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Jun 2025 05:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D/k9j7Xa;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a54700a463so2250738f8f.1
        for <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 05:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750682588; x=1751287388; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+qC1EEaay8hFTPEhETGaA43T7yNcyVQN5sRN1ccVz0=;
        b=D/k9j7Xa6f6yV5hd7GSdXINCKTYBg/aGTJJaWBSP86F+t1XDgHPncCGUtg+TJ9Wl4X
         /Ecfoi2j5BgNI2eePNfAYAUG6roLGxGBJ1oDfiJczRb3h/awaSmuQhKmz7ZFXVTUfwMu
         L4HR1rdWel362CmzhK5UUR6ylXC/mgxycD0hBePTjNPrJQLWWqj27MQNatU4bQ5NJG3r
         srabI3jDulek28B24t7pFwX1JqCMVzwLQu5jdns4DO9nzuKGVNJUBtxJleEvCeGFz67L
         K0KsnpDAwyBd4Z/dOYjgVGeMSPkmAgH/XYKEmseVvQuZhzjIPzo93574JpoYGAL1Ah+k
         SYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750682588; x=1751287388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B+qC1EEaay8hFTPEhETGaA43T7yNcyVQN5sRN1ccVz0=;
        b=UGV4mlXe533QlA73+zA7XW8xyI9QrGL/epKJYWePZ2BK7OIIGfRmsS9wEL43HGVfk+
         on+ALB7v7twa00zbupK6MrcIvdXu9QbEhPVesfKSh1pZSKEq8xXepSA37zX8XcG0Rlrj
         2TfH0rv8HU7f25vGS6GO3IUDUsxmCDaRV//2tMn4YY+ekaxdtEajfp3soJ3SF6iCzgPj
         OFeHLo9NpATCD1Uvbeq9efTh6LEKzcYfB7QljHQc3m5y1aL1oWVSNa5xNTo4ZeEt/YkH
         VUMO22w4Lg8Kkvne9rZ27DB983SIBibqxJ37FqpXcwNaSQ2sYJFbvMlGpzGM6c7XablZ
         dKJA==
X-Gm-Message-State: AOJu0YyLHifk4R3zxZhv2HA70tN7zZ3ZO8OowQi4asUvlryiBkZOV+pS
	vkRv6YJ9dCsyRyCFT5tqo49sHcEoZOnAh/hpWdfSTKDpWU0/olEzwskT0CN/mA==
X-Gm-Gg: ASbGncttKBPjs02Ml5f6Qye70mxDAkZaOvVCF69Rphu+GLAqGmcHepjn8/W5rcjX7vi
	pydmtSgt3jTOfQ4X1Kr07zZDlTJzCVNcQBJiZvuXQ0TZW1XhGGcTz9ueqes1qimjk6HewSLrSYS
	XmN+UuyEr9sTuUBF92tKswPyWQ+M/3/pXo3/Jrcf843WpD1Torjv+PFXLZ63agEvjV9W5uOMHdn
	ZDRpO5U1kT1sXjNIX2eMi2vjhmz/wMtHlpbE8gRaBMAkOGMhWtXYoFR5wWD0BfttQ5cjTO6wl0h
	ksDAx1R8jwCXE3kPeXZLvn4AuCWlpLMKDE3IXZMN3erDNkjXxBXYs01C8A6dZ7ef99/nhGfddEz
	MQNw5odko0AmY1NIdd9KDnH19klMwkCEiZw==
X-Google-Smtp-Source: AGHT+IF0jfTh8WxI2mkHPdGzDCguBEW8V4XIUVv3XihiBlVApzQdCnMlwALwvp/eUBtWxASUnsQ++Q==
X-Received: by 2002:a05:6000:2002:b0:3a3:70ab:b274 with SMTP id ffacd0b85a97d-3a6d27a6dbbmr9718768f8f.12.1750682587638;
        Mon, 23 Jun 2025 05:43:07 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1190b00sm9157170f8f.87.2025.06.23.05.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 05:43:07 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/6] ref-manual: correct references to WORKDIR to account for recent do_unpack changes
Date: Mon, 23 Jun 2025 14:42:56 +0200
Message-Id: <20250623124257.1544615-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250623124257.1544615-1-alex.kanavin@gmail.com>
References: <20250623124257.1544615-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 12:43:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7148

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 documentation/ref-manual/structure.rst |  2 +-
 documentation/ref-manual/variables.rst | 16 +++-------------
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index 2190f5b90e5..d6dbb294018 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -611,7 +611,7 @@ example, consider ``linux-yocto-kernel-3.0`` on the machine ``qemux86``
 built within the Yocto Project. For this package, a work directory of
 ``tmp/work/qemux86-poky-linux/linux-yocto/3.0+git1+<.....>``, referred
 to as the :term:`WORKDIR`, is created. Within this directory, the source is
-unpacked to ``linux-qemux86-standard-build`` and then patched by Quilt.
+unpacked to ``sources/linux-qemux86-standard-build`` and then patched by Quilt.
 (See the ":ref:`dev-manual/quilt:using quilt in your workflow`" section in
 the Yocto Project Development Tasks Manual for more information.) Within
 the ``linux-qemux86-standard-build`` directory, standard Quilt
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index c6ae3fb8bcc..7fe152c57e3 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -265,7 +265,7 @@ system and gives an overview of their function and contents.
       build process. By default, this directory is the same as the
       :term:`S` directory, which is defined as::
 
-         S = "${WORKDIR}/${BP}"
+         S = "${UNPACKDIR}/${BP}"
 
       You can separate the (:term:`S`) directory and the directory pointed to
       by the :term:`B` variable. Most Autotools-based recipes support
@@ -8039,7 +8039,7 @@ system and gives an overview of their function and contents.
    :term:`S`
       The location in the :term:`Build Directory` where
       unpacked recipe source code resides. By default, this directory is
-      ``${``\ :term:`WORKDIR`\ ``}/${``\ :term:`BPN`\ ``}-${``\ :term:`PV`\ ``}``,
+      ``${``\ :term:`UNPACKDIR`\ ``}/${``\ :term:`BPN`\ ``}-${``\ :term:`PV`\ ``}``,
       where ``${BPN}`` is the base recipe name and ``${PV}`` is the recipe
       version. If the source tarball extracts the code to a directory named
       anything other than ``${BPN}-${PV}``, or if the source code is
@@ -8052,19 +8052,10 @@ system and gives an overview of their function and contents.
       ``poky/build``. In this case, the work directory the build system
       uses to keep the unpacked recipe for ``db`` is the following::
 
-         poky/build/tmp/work/qemux86-poky-linux/db/5.1.19-r3/db-5.1.19
+         poky/build/tmp/work/qemux86-poky-linux/db/5.1.19-r3/sources/db-5.1.19
 
       The unpacked source code resides in the ``db-5.1.19`` folder.
 
-      This next example assumes a Git repository. By default, Git
-      repositories are cloned to ``${WORKDIR}/git`` during
-      :ref:`ref-tasks-fetch`. Since this path is different
-      from the default value of :term:`S`, you must set it specifically so the
-      source can be located::
-
-         SRC_URI = "git://path/to/repo.git;branch=main"
-         S = "${WORKDIR}/git"
-
    :term:`SANITY_REQUIRED_UTILITIES`
       Specifies a list of command-line utilities that should be checked for
       during the initial sanity checking process when running BitBake. If
@@ -8439,7 +8430,6 @@ system and gives an overview of their function and contents.
       sources are fetched from a Git repository and ``setup.py`` is in a
       ``python/pythonmodule`` subdirectory, you would have this::
 
-         S = "${WORKDIR}/git"
          SETUPTOOLS_SETUP_PATH = "${S}/python/pythonmodule"
 
    :term:`SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS`
-- 
2.39.5


