Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCFDC433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 12:00:13 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.8636.1647604812301205944
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 05:00:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bWtd3Jdy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id d7so11424110wrb.7
        for <docs@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 05:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sZIvazBRF1NHDVabkORpb8HgCQUXCYnfsy1h2bNpnfg=;
        b=bWtd3JdyuXr1pCm+mEHwZ7ZEtRnZA2nq7nSF2V7aICImO/FEGsLCm1LzQzZO1XaA+s
         nadrPZJ02Sr3cJof4NOsm0LlSmr8QfSmE3IU819mKFXlIY+7+/funbFEqP9KM1fKepM5
         jKs++UJo0EmWBx4baydQGMvN4PvpiQfZVuwaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sZIvazBRF1NHDVabkORpb8HgCQUXCYnfsy1h2bNpnfg=;
        b=a3eIri704GZP9XP0eROOC6DOsikGw0+4TVR62IavuZC057MrkfYbKxYOJZBYGEHwX5
         f+OgZLB800D1TKa5Krrpk5b8aObnVYnmkFQGwPEQbI9PXzZndYHxEX20gJUtXehJ0N44
         I2oGxMr6tnpIEFTpyp+Hcd7ywVMzSibv+aPPARvU7CUcepVMNNoQbKMElpzKk0lQFwJB
         FHN/XrP2+22kVo2DsWN7Nzt4c+XGOM6zxFUGjZqUqfnkqEiXslmy4KhByajl/lhk+OP5
         tfIoLBSAjI2IHClp1zR//cM6M67OexAUksRVM0+GMPzXDIdlGyZI2Hd9OV0dPKejXPZI
         e6sg==
X-Gm-Message-State: AOAM532EfXn7fp1dYpbxmmi8OZZUr0ZagA5Coc0it8jEQhxEPOjs0ymR
	tIrHCvQumBqOvhdJqV2xRelIwLhOQWUAuS0r
X-Google-Smtp-Source: 
 ABdhPJwtCWcvNtvIoIp2E+PYOMPaPWCH2J+bQmZDXR+bbmDh+v2P/QDqC5UtB6BxnzO/wpMgzb9sww==
X-Received: by 2002:a05:6000:1d82:b0:203:e5cc:c19b with SMTP id
 bk2-20020a0560001d8200b00203e5ccc19bmr7624811wrb.553.1647604810145;
        Fri, 18 Mar 2022 05:00:10 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:ac92:797e:3dcd:ed37])
        by smtp.gmail.com with ESMTPSA id
 c11-20020a05600c0a4b00b0037c91e085ddsm11759729wmq.40.2022.03.18.05.00.09
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Mar 2022 05:00:09 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] poky.yaml: Drop POKYVERSION and YOCTO_POKY references
Date: Fri, 18 Mar 2022 12:00:08 +0000
Message-Id: <20220318120008.1061207-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Mar 2022 12:00:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2626

We don't publish tarballs using this version any more, it has been
removed everywhere. Remove the obsolete references in the docs,
adapting references accordingly. The tarballs now are just created
with their sha256 checksum which we don't want or need to reference
in the docs.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/dev-manual/start.rst                 |  4 +---
 .../overview-manual/development-environment.rst    |  2 +-
 documentation/poky.yaml                            |  2 --
 documentation/ref-manual/terms.rst                 | 14 +++++++-------
 4 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index 701d3cf4d..96fabac1a 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -647,9 +647,7 @@ Follow these steps to locate and download a particular tarball:
 
 3. *Find the Tarball:* Drill down to find the associated tarball. For
    example, click on ``yocto-&DISTRO;`` to view files associated with the
-   Yocto Project &DISTRO; release (e.g.
-   ``&YOCTO_POKY;.tar.bz2``, which is the
-   released Poky tarball).
+   Yocto Project &DISTRO; release.
 
 4. *Download the Tarball:* Click the tarball to download and save a
    snapshot of the given component.
diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
index fc193f313..9c9c8e87a 100644
--- a/documentation/overview-manual/development-environment.rst
+++ b/documentation/overview-manual/development-environment.rst
@@ -461,7 +461,7 @@ and clicking on the ``[...]`` link beneath the "Tag" heading.
 
 Some key tags for the ``poky`` repository are ``jethro-14.0.3``,
 ``morty-16.0.1``, ``pyro-17.0.0``, and
-``&DISTRO_NAME_NO_CAP;-&POKYVERSION;``. These tags represent Yocto Project
+``&DISTRO_NAME_NO_CAP;-&DISTRO;``. These tags represent Yocto Project
 releases.
 
 When you create a local copy of the Git repository, you also have access
diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 4f4f3e3a9..c8a890c40 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -6,8 +6,6 @@ DISTRO_NAME_NO_CAP_LTS : "dunfell"
 YOCTO_DOC_VERSION : "3.4.2"
 YOCTO_DOC_VERSION_MINUS_ONE : "3.3.5"
 DISTRO_REL_TAG : "yocto-3.4.2"
-POKYVERSION : "26.0.2"
-YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
 YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
 YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index 3f18d3404..cba514c34 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -88,11 +88,11 @@ universal, the list includes them just in case:
          -  Provide a directory path and specifically name the Build
             Directory. Any intermediate folders in the pathname must exist.
             This next example creates a Build Directory named
-            ``YP-&POKYVERSION;`` within the existing directory ``mybuilds``:
+            ``YP-&DISTRO;`` within the existing directory ``mybuilds``:
 
             .. code-block:: shell
 
-               $ source poky/oe-init-build-env mybuilds/YP-&POKYVERSION;
+               $ source poky/oe-init-build-env mybuilds/YP-&DISTRO;
 
       .. note::
 
@@ -357,13 +357,13 @@ universal, the list includes them just in case:
      repository results in a local Git repository whose top-level folder
      is also named "poky".
 
-     While it is not recommended that you use tarball expansion to set up
+     While it is not recommended that you use tarball extraction to set up
      the Source Directory, if you do, the top-level directory name of the
      Source Directory is derived from the Yocto Project release tarball.
-     For example, downloading and unpacking
-     :yocto_dl:`/releases/yocto/&DISTRO_REL_TAG;/&YOCTO_POKY;.tar.bz2`
-     results in a Source Directory whose root folder is named
-     ``&YOCTO_POKY;``.
+     For example, downloading and unpacking poky tarballs from
+     :yocto_dl:`/releases/yocto/&DISTRO_REL_TAG;/`
+     results in a Source Directory whose root folder is named poky.
+
 
      It is important to understand the differences between the Source
      Directory created by unpacking a released tarball as compared to
-- 
2.32.0


