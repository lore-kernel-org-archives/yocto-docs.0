Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA2EC4453F
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 18:49:02 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7365.1784746138479999437
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Jul 2026 11:48:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=A8gCwPGr;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7e9ecb1e13cso9864946a34.3
        for <docs@lists.yoctoproject.org>; Wed, 22 Jul 2026 11:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784746137; x=1785350937; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gZ4CpHNYg8QSD40EeVR838g0B6UoxiIdMU7F2jUKqgc=;
        b=A8gCwPGr5i1i2+lhrDgNfsa2gu3UPlcYvOXZ4JMi6JX8U6d/mnB3BZi9lCnPnST4hF
         Y+0y+xMYI2TFN0Zidjq9haNFT3xv64sBIhuRaLLCK4m6ovQ/fV39NmuDhUFj42vmbdP3
         negmOZDIDBRmKdf7d6JYBaRl5aF74569DKAwF+nU/syYVqQUboZhd6tpvuidiIjJbjEM
         ezPHdvDnLvB9dsi2PABY8mG8ZZMnE9PhVsAhP5LJJYUpsclcwba1kpzG2uEapkX0kWhr
         GJ42lr7klsAWMYpqJUY6oJ9kuG0eSWRifnKQJSYC746NxSpO25QA4IcgcwrPGP9Yrgro
         Jx8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784746137; x=1785350937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gZ4CpHNYg8QSD40EeVR838g0B6UoxiIdMU7F2jUKqgc=;
        b=TF1LyfXVjmmRGE6dkcrw/88gZBBvK3Nkyi42lTat+srrgvdzfcBPyNOQBVSKU0jyN4
         r3Hud5RYnMRm0XVNiEpKDZFgAhBy5NyNYt1kcu8i7pUdZ2Qj9yt3d8H7rdBE2wTVGNHQ
         MVRaODktMH8CAs7DwgBg7vGflZ1uQTuNdY5Wj6eiObKEIabEwcJ16ofUDIBFss1Ctw9P
         qGTUcRWHkzQWpAAkL7PMO30VLHojL1cU7ooJeXt9q7cg6sVEf+Nyz1V30iA1LaIjh1pJ
         2t5vhEZL8VtDUW9H+EzCm97ITVasKvYERlH4/HnvimJVmY7ytX55fpzo1GgImo2tUr1z
         Zz8A==
X-Gm-Message-State: AOJu0YxLLhf9ynN68g9Z0MG1H9C7W8qvSEDylcAzQ/c3w0Xfkwojf0C+
	VXKkyzn/t88baXwH0MYkrWv/GWlJiWayQAlj5wxNwQAoDc/QbOFaSA+8ebpU/g==
X-Gm-Gg: AR+sD12xGGbpyN2nE7rkKlxDchlrkNbQDAN/TIU0E6eMrtcDKIfxCdd7QtbtxYmRJJw
	XnQvTcQiZOtfrmupelxgd584YKCsesGfmz9goSveVR5INV1tuSGP8Jm35riqfx7aE9SX+JkmxJa
	SkRdrTaFpmgltIfg7rC2o3MObDL+kIM6eBJMlaNRazVmaaxFV0cgliDicsSoAcmnEOfsqv1WFdt
	MAPpJDpSQzBwIwlcm1JWj8GLHXuNDpNhWiX478bwTPFF2DmzAJ5RHQAuSALpYYR+Hw8m8XWbTUz
	o+LpacIKD49GiCZvpwqNd8y3lkIrDH0sTf/3lAP6/B6AvXjPyzSzInx2jHyuWfk+On9UyMW3PzU
	/uXsdU+WuOCMyp+g1XsQ2v/4JeU2ua1QTOFdivJEZ3VD3uVWsLpOxpb5IIsSTX4cU7kEKHfpLaI
	M=
X-Received: by 2002:a05:6830:6185:b0:7e7:aac:4cc9 with SMTP id 46e09a7af769-7ee43eac6c1mr39980a34.3.1784746137583;
        Wed, 22 Jul 2026 11:48:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::aa5e])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ee29db283dsm1917210a34.3.2026.07.22.11.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 11:48:56 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [docs][PATCH] variables: Update variable documentation for SPDX license expressions
Date: Wed, 22 Jul 2026 12:48:53 -0600
Message-ID: <20260722184853.188733-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Jul 2026 18:49:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10115

Updates the documentation for the variables affected by the transition
to using SPDX license expressions

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 documentation/ref-manual/variables.rst | 46 ++++++++++++++------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 394797ca3..599ef6f2e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4806,6 +4806,12 @@ system and gives an overview of their function and contents.
       - ``GPL-3.0*``: ``GPL-3.0-only``, ``GPL-3.0-or-later``
       - ``LGPL-3.0*``: ``LGPL-3.0-only``, ``LGPL-3.0-or-later``
 
+      If a license in :term:`LICENSE` has an exception listed using the
+      ``WITH`` operator, the license will still match this variable and the
+      license will not be allowed. To explicitly allow an SPDX license
+      exception to a license, the exception must be listed in
+      :term:`INCOMPATIBLE_LICENSE_EXCEPTIONS`
+
       .. note::
 
          This functionality is only regularly tested using the following
@@ -4819,12 +4825,12 @@ system and gives an overview of their function and contents.
          are required to produce a functional system image.
 
    :term:`INCOMPATIBLE_LICENSE_EXCEPTIONS`
-      Specifies a space-separated list of package and license pairs that
-      are allowed to be used even if the license is specified in
-      :term:`INCOMPATIBLE_LICENSE`. The package and license pairs are
-      separated using a colon. Example::
+      Specifies a space-separated list of package and SPDX license or SPDX
+      license exception pairs that are allowed to be used even if the license
+      is specified in :term:`INCOMPATIBLE_LICENSE`. The package and license
+      pairs are separated using a colon. Example::
 
-         INCOMPATIBLE_LICENSE_EXCEPTIONS = "gdbserver:GPL-3.0-only gdbserver:LGPL-3.0-only"
+         INCOMPATIBLE_LICENSE_EXCEPTIONS = "gdbserver:GPL-3.0-only gdbserver:LGPL-3.0-only gdbserver:GCC-exception-3.1"
 
    :term:`INHERIT`
       Causes the named class or classes to be inherited globally. Anonymous
@@ -5945,27 +5951,24 @@ system and gives an overview of their function and contents.
 
    :term:`LICENSE`
       This is a required field in an OpenEmbedded recipe file, and should
-      contain a list of source licenses for the recipe. Follow these rules:
-
-      -  Do not use spaces within individual license names.
+      contain a :term:`SPDX License Expression` that describes the source
+      license(s) for the recipe. Keep in mind a few rules:
 
-      -  Separate license names using \| (pipe) when there is a choice
-         between licenses.
+      -  Separate license name using ``OR`` when there is a choice between
+         licenses
 
-      -  Separate license names using & (ampersand) when there are
-         multiple licenses for different parts of the source.
+      -  Separate license names using ``AND`` when multiple licenses apply to
+         different parts of the source code
 
-      -  You can use spaces between license names.
+      -  All licenses must be valid SPDX License Identifiers
 
-      -  For standard licenses, use the names of the files in
-         ``meta/files/common-licenses/`` or the
-         :term:`SPDXLICENSEMAP` flag names defined in
-         ``meta/conf/licenses.conf``.
+      -  Any License that does not come from the SPDX License list
+         must be prefixed with ``LicenseRef-``.
 
       Here are some examples::
 
-         LICENSE = "LGPL-2.1-only | GPL-3.0-only"
-         LICENSE = "MPL-1.0 & LGPL-2.1-only"
+         LICENSE = "LGPL-2.1-only OR GPL-3.0-only"
+         LICENSE = "MPL-1.0 AND LGPL-2.1-only"
          LICENSE = "GPL-2.0-or-later"
 
       The first example is from the
@@ -5981,15 +5984,14 @@ system and gives an overview of their function and contents.
       but has accompanying documentation licensed under the GNU Free
       Documentation License 1.2 could be specified as follows::
 
-         LICENSE = "GFDL-1.2 & GPL-2.0-only"
+         LICENSE = "GFDL-1.2 AND GPL-2.0-only"
          LICENSE:${PN} = "GPL-2.0.only"
          LICENSE:${PN}-doc = "GFDL-1.2"
 
       .. note::
 
          A recipe's :term:`LICENSE` value must be accompanied by an associated
-         :term:`LIC_FILES_CHKSUM` value, except in the special case where
-         the :term:`LICENSE` value is set to "CLOSED".
+         :term:`LIC_FILES_CHKSUM` value.
 
    :term:`LICENSE_CREATE_PACKAGE`
       Setting :term:`LICENSE_CREATE_PACKAGE` to "1" causes the OpenEmbedded
-- 
2.54.0


