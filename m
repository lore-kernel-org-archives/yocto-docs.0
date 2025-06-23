Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0355C7EE2A
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 12:42:19 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.18621.1750682534767500403
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Jun 2025 05:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WHIDBbJp;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ad89ee255easo754556566b.3
        for <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 05:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750682533; x=1751287333; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Og2dFLay9wmO9V2nMeozqN4YZhYgoNYHVdrfecZnWjo=;
        b=WHIDBbJpo6a4XDHwBliElWmEh0wxEZv0ufmdpU+F3AultHkBEu+X+ZhmtCrerGuvk1
         d8twUIIN43Nf4EcMNHv1sjt1LkeVwqmniVd2nNmcMMwmDwtVYFu3bJGxkPAA1xqX8eYt
         mf2ydz8xBuUimtGMtIvYDd3hIopHP8wZBambponVXUdTU+VgqhRuF2++W+ZZPDXWM4GX
         ZxVBWPiLK1rDuPNUbDH1SMGqMES/QBVu5cL8G5Zd3kdGKXi6WIl9W4eCbqnbzu5Ya1eC
         wxquO3wUfdNgXtmTL16gRUUrT3rWXvOjUjd6TA3iK3TeSoaF3PYYMNcqCRYHCvS/Uvp+
         f5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750682533; x=1751287333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Og2dFLay9wmO9V2nMeozqN4YZhYgoNYHVdrfecZnWjo=;
        b=Z1wkxsoVTVhb4be4Lr4bJzpFIEvyErooa5JlnLAaRm3k1RAjxaP7znyIDb0Cs1VgrN
         0tZq3EcfO8cy0VxkbPrhvtevLLjWDK72FNPYEF85+ZdyEAx48yv15wNARPuex9K9QjLW
         rujXACgICrp00oH3W8pFHvznCPqHIpYDh6bYs6nA/l2WEvwN1diAgyFBjNCZLtOGoh5C
         Z0tQMjJcUI4ULJMW7aFMJ+s4b6jFfcPVntBH2o81X22O82g3G6gnt6s9kaOCQDiKH8k2
         utIl64Tam9GQhQs6C+0tiV3O78FJQBEGhUh59ZWPSnSJ5U436ILNntKBLG7Hp7kuEc0T
         5nRA==
X-Forwarded-Encrypted: i=1; AJvYcCWMbE49XZe5KGfwrjdvGpLiLpWtQCQIorBJOZv+gt1WLsJ1JVg7ccrnm1YOPY5R/z5CCkvm@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yy2Cd/8sdCspwlpm0nXCpDzjoRBldHDljYGMNGQP3RQ37x0suLi
	6Q6PhmPi7OWVB8SFADPHw7oTkcU0+YXOh/fkk/pE5H20nL1uGyLDJTaF
X-Gm-Gg: ASbGnctKI4aLUqE9auCPMJ/tpL1iyqNS6MP5sYwM+WWP65kYuM60R6lkMLfKRb10s2m
	AqLZ4e8JsVmcYBRNRf0A5ZPaUIUz6Rik4Ue/HQHJIZkZgbqMIVGgRao9nKFIinTf5STd2nSY3ax
	MaN3ZYnf25OaDC/U5HM9tMq5EYk+PyzCRVTwqC0auPsvFUS7BW3FUl9PDbbQLnZRmIKjJm7jJ3t
	RaHe/oe0mSTWEQFEw1DZKHX3uPiUagslx3Vjbb5kAwyEYbx7knVVcco7QM1FMycY8gR74bIXLpH
	Z8bTk4qJu2G3u4v7577jsySlejS0HlR+zDhEdsaMqW03v9oPqf1EA2l4P76JarB1W2WdmzfCDfW
	QgG5Am9MBoKT8+YxvEs5xrC4=
X-Google-Smtp-Source: AGHT+IHAiIV/zjm2rSBaW0jOBJZjyJjZm5rmt2TunbttnUeZXiEARwpst5s8OM3UTBfu4A0W5nGxqA==
X-Received: by 2002:a17:906:c14c:b0:ad8:a41a:3cd2 with SMTP id a640c23a62f3a-ae057d4eb93mr1163927166b.16.1750682532665;
        Mon, 23 Jun 2025 05:42:12 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053e801ccsm701809566b.7.2025.06.23.05.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 05:42:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: bibake-devel@lists.openembedded.org,
	docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] bitbake-user-manual: correctly reference UNPACKDIR when describing unpacking
Date: Mon, 23 Jun 2025 14:42:07 +0200
Message-Id: <20250623124207.1544570-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 12:42:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7144

From: Alexander Kanavin <alex@linutronix.de>

Also, drop an obsolete S = WORKDIR/git note.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../bitbake-user-manual-fetching.rst          | 21 +++++++------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/bitbake/doc/bitbake-user-manual/bitbake-user-manual-fetching.rst b/bitbake/doc/bitbake-user-manual/bitbake-user-manual-fetching.rst
index eac3cbdfb59..a2c2432db1f 100644
--- a/bitbake/doc/bitbake-user-manual/bitbake-user-manual-fetching.rst
+++ b/bitbake/doc/bitbake-user-manual/bitbake-user-manual-fetching.rst
@@ -39,10 +39,10 @@ variable and then calls the ``download`` method to download the files.
 
 The instantiation of the fetch class is usually followed by::
 
-   rootdir = l.getVar('WORKDIR')
+   rootdir = l.getVar('UNPACKDIR')
    fetcher.unpack(rootdir)
 
-This code unpacks the downloaded files to the specified by ``WORKDIR``.
+This code unpacks the downloaded files to the specified by ``UNPACKDIR``.
 
 .. note::
 
@@ -51,7 +51,7 @@ This code unpacks the downloaded files to the specified by ``WORKDIR``.
    examine the OpenEmbedded class file ``base.bbclass``
    .
 
-The :term:`SRC_URI` and ``WORKDIR`` variables are not hardcoded into the
+The :term:`SRC_URI` and ``UNPACKDIR`` variables are not hardcoded into the
 fetcher, since those fetcher methods can be (and are) called with
 different variable names. In OpenEmbedded for example, the shared state
 (sstate) code uses the fetch module to fetch the sstate files.
@@ -461,13 +461,6 @@ Here are some example URLs::
    SRC_URI = "git://github.com/asciidoc/asciidoc-py;protocol=https;branch=main"
    SRC_URI = "git://git@gitlab.freedesktop.org/mesa/mesa.git;branch=main;protocol=ssh;..."
 
-.. note::
-
-   When using ``git`` as the fetcher of the main source code of your software,
-   ``S`` should be set accordingly::
-
-       S = "${WORKDIR}/git"
-
 .. note::
 
    Specifying passwords directly in ``git://`` urls is not supported.
@@ -598,7 +591,7 @@ and port, username, and password, and fetches the Head Revision::
    SRC_URI = "p4://example-depot/main/source/..."
    SRCREV = "${AUTOREV}"
    PV = "p4-${SRCPV}"
-   S = "${WORKDIR}/p4"
+   S = "${UNPACKDIR}/p4"
 
 Here is an example that specifies the server URL and port, username, and
 password, and fetches a Revision based on a Label::
@@ -607,15 +600,15 @@ password, and fetches a Revision based on a Label::
    SRC_URI = "p4://user:passwd@example-depot/main/source/..."
    SRCREV = "release-1.0"
    PV = "p4-${SRCPV}"
-   S = "${WORKDIR}/p4"
+   S = "${UNPACKDIR}/p4"
 
 .. note::
 
-   You should always set S to "${WORKDIR}/p4" in your recipe.
+   You should always set S to "${UNPACKDIR}/p4" in your recipe.
 
 By default, the fetcher strips the depot location from the local file paths. In
 the above example, the content of ``example-depot/main/source/`` will be placed
-in ``${WORKDIR}/p4``.  For situations where preserving parts of the remote depot
+in ``${UNPACKDIR}/p4``.  For situations where preserving parts of the remote depot
 paths locally is desirable, the fetcher supports two parameters:
 
 - *"module":*
-- 
2.39.5


