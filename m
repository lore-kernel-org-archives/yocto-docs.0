Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8025C433F5
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 15:39:04 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.10517.1642088343840583836
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Jan 2022 07:39:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZOq2Wmd1;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 rj2-20020a17090b3e8200b001b1944bad25so11504774pjb.5
        for <docs@lists.yoctoproject.org>;
 Thu, 13 Jan 2022 07:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qra5qHC6ExRoJpJI/mbtNrKcp2g+AbxAkOMQYspYBBo=;
        b=ZOq2Wmd10kEYVJOuPCw3Woz54yQNVSLr3NhibTVHwB1FSzIh5SMwO7TAJhKNwRf+8f
         PBAWOzGAs0xAxA5NJveSqOV318gf7a7zbMJ7OBtnekr4QdGqXZNicH5FyL2top5t5Dgh
         MmCquD+HdKARMtupGb/lYoxF8jLkpnHqkyl73/8PT9C1e57swbpWqzLdtKIS8s11TxGj
         iDSpyLpH0J30ePym5NW6d9vWQTo77Hy5+AtEEofpVv6cy6kVqGyvEKka9AdCiUCJQ3Ih
         Wfn4O/4LLIQ2JKAkYH5BgcBkeHCCrRaDFiNEnWZ2JrghjJ1vVDuMhmkcgHVzAtJ80kYK
         mXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qra5qHC6ExRoJpJI/mbtNrKcp2g+AbxAkOMQYspYBBo=;
        b=eNC9c58EMjTh9VNmlL5f4FM03TEN9o1lupQR24b3/iB//zLOy9+RpdtkV8CLsdmwVf
         MTJ20rf9+Iut+OFe5p4eqJv+lfTmzLY4+Nz0dj92kmqPSJ/KCvyefb9FUuLgNKXCic66
         9uZ2cSNy06c9HY6rhyLxWywMIVpCPjqWXLEssf3B8lHxw5P8IueOg3QwJDtf/i4PnVTU
         W//Osuv8bT9PlHmIwhmalpWx7MWAeKDRd97nxJi7x8lnimUuAx2yY/fcsJ93/Knv8IE6
         IyRFgnTSynIJou15BHC0v2LtRgdQ4Q9Ln9ZhfvoqwJSzHcRo//0dweJy/5U2Pyomjnz+
         mP0g==
X-Gm-Message-State: AOAM533m6NNLPOMTbkjgLvkh3JQ/q57SfYmBU6Dqawu2XDhI4CjbVlCj
	KACWfq3LGsc8XFfw5Snczgp3ew2wBjs=
X-Google-Smtp-Source: 
 ABdhPJzcnEe04JPGtMKT2Ime0/5BSIXGYRCeBD1d5CX/Ap+mhu409Z3Iryr8Jo2D0rwWoPTGja/WXw==
X-Received: by 2002:a17:90b:4a90:: with SMTP id
 lp16mr11857427pjb.39.1642088342690;
        Thu, 13 Jan 2022 07:39:02 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:bf73:e59:4f56:2dd4])
        by smtp.gmail.com with ESMTPSA id
 q12sm3278507pfk.136.2022.01.13.07.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 07:39:02 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2 1/3] ref-manual/variables.rst: add SETUPTOOLS_SETUP_PATH
Date: Thu, 13 Jan 2022 07:38:41 -0800
Message-Id: <20220113153843.2544066-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Jan 2022 15:39:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2406

Add SETUPTOOLS_SETUP_PATH for setuptools3 class.

Deprecate DISTUTILS_SETUP_PATH and drop mention of ref-classes-setuptools3 as
that class has moved to new variable.

[YOCTO #14610]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v2:
  - fix whitespace error

 documentation/ref-manual/variables.rst | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index be496161b..7c2f74a39 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1985,8 +1985,7 @@ system and gives an overview of their function and contents.
 
    :term:`DISTUTILS_SETUP_PATH`
       When used by recipes that inherit the
-      :ref:`distutils3 <ref-classes-distutils3>` or
-      :ref:`setuptools3 <ref-classes-setuptools3>` class, this variable should
+      :ref:`distutils3 <ref-classes-distutils3>` class, this variable should
       be used to specify the directory in which the ``setup.py`` file is
       located if it is not at the root of the source tree (as specified by
       :term:`S`). For example, in a recipe where the sources are fetched from
@@ -1996,6 +1995,13 @@ system and gives an overview of their function and contents.
          S = "${WORKDIR}/git"
          DISTUTILS_SETUP_PATH = "${S}/python/pythonmodule"
 
+      .. note::
+
+         ``distutils`` has been deprecated in Python 3.10 and will be removed
+         in Python 3.12. For this reason, the use of :ref:`distutils3 <ref-classes-distutils3>`
+         is deprecated. Instead use :ref:`setuptools3 <ref-classes-setuptools3>` and the
+         :term:`SETUPTOOLS_SETUP_PATH` variable.
+
    :term:`DL_DIR`
       The central download directory used by the build process to store
       downloads. By default, :term:`DL_DIR` gets files suitable for mirroring
@@ -6841,6 +6847,18 @@ system and gives an overview of their function and contents.
 
          EXTRA_IMAGE_FEATURES += "read-only-rootfs"
 
+   :term:`SETUPTOOLS_SETUP_PATH`
+      When used by recipes that inherit the
+      :ref:`setuptools3 <ref-classes-setuptools3>` class, this variable should
+      be used to specify the directory in which the ``setup.py`` file is
+      located if it is not at the root of the source tree (as specified by
+      :term:`S`). For example, in a recipe where the sources are fetched from
+      a Git repository and ``setup.py`` is in a ``python/pythonmodule``
+      subdirectory, you would have this::
+
+         S = "${WORKDIR}/git"
+         SETUPTOOLS_SETUP_PATH = "${S}/python/pythonmodule"
+
    :term:`SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS`
       A list of recipe dependencies that should not be used to determine
       signatures of tasks from one recipe when they depend on tasks from
-- 
2.30.2


