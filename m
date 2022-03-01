Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB9FCC433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 16:36:23 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.10243.1646152583629588984
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Mar 2022 08:36:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K2HYdmcV;
 spf=pass (domain: gmail.com, ip: 209.85.214.173,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id c9so13928331pll.0
        for <docs@lists.yoctoproject.org>;
 Tue, 01 Mar 2022 08:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ADTaAUk//mqeZKiSJBzDe19mcROrGAeqJufepJv5Qjw=;
        b=K2HYdmcVbg6ZiHL2AMJzH2KV1Y/Bwj8vx0XUB3T3VffLyVyDjAjB4KAMV5MVLRWCmT
         lLxNwLOwyUcaF6Anupw6yqbqb1dxx8+RJzckOhHgpzaQGoZfxtqay+eKx45WTcZwQfbY
         BhPR328Ry0YCNENXcsaku3Ydh+QuRlqhPzyvu4qOrntfEJ2DYZF/yeyNfUOupdva/8HF
         n+0nyI8Ka5gznMGHm1HqB6kT1q1cRg9Fznc2mhOZeRRwxCqEpRuVuf2raL83I1KUJ5Nk
         N5GOxsvMnzSgsGOyG0SEkms+TBgHb4LztVvB67NdhraWjDRQPQUrXsOF+kC3WYme+Xdh
         1ncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ADTaAUk//mqeZKiSJBzDe19mcROrGAeqJufepJv5Qjw=;
        b=7Ktp3mNHbsF3l7G85Yq6NVD1EKqJtb4slI1q9GBNbQuyTI9wJPnhWhnGoBmfQwdKZf
         e0/LZkscrqeDTZElSb/6mS88s8XUBRw3ef7xhDY6toufDdc5DZWN/UQ3d/bAqLtJlHBO
         K8OlEQOPQq9Trn/hMAfCQIWogHSHw9htrBVIKWJtmv5qanT9dPnF6GVJhK6bCDlq7nj5
         Xto0Veu3M2XCYzVcx4/yelxEyL63AF/3xogO/9og4W7sjapcvDeDa/BHJmi6UHSVIE1F
         gnesTzchOylhRkOSIEVIloHD6lNTYjMSrk5ROZcOOC0VuEeOp72aL3HbtBSQcvHAArqs
         bdyA==
X-Gm-Message-State: AOAM531vwJi90fHB892BnN0ixqWsGPEmG1w8DWT1hRE4OOOqcMWeVM/p
	eidOcU1tkuyzrzkh93X9DHpmKI4kcBk=
X-Google-Smtp-Source: 
 ABdhPJwZsclijcb3mGTbOK9pMf/xzOxOumlLiqYpL9r5cFnCLxW5wVeH6NRU67kRgRqT18ghW72kiw==
X-Received: by 2002:a17:902:bb02:b0:151:56a8:f80b with SMTP id
 im2-20020a170902bb0200b0015156a8f80bmr14672981plb.30.1646152582672;
        Tue, 01 Mar 2022 08:36:22 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:b4e2:b3d2:f012:52ea])
        by smtp.gmail.com with ESMTPSA id
 j11-20020a63230b000000b00372a08b584asm13450461pgj.47.2022.03.01.08.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 08:36:22 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2 1/5] docs: ref-manual: drop distutils from variables
Date: Tue,  1 Mar 2022 08:36:13 -0800
Message-Id: <20220301163617.1543257-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Mar 2022 16:36:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2517

The distutils*.bbclasses have been moved to meta-python, so remove
mention of them from ref-manual/variables.rst

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 documentation/ref-manual/variables.rst | 29 ++------------------------
 1 file changed, 2 insertions(+), 27 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index ecb2b60c7..03470cebf 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1982,25 +1982,6 @@ system and gives an overview of their function and contents.
       is included in the default value of
       :term:`OVERRIDES`.
 
-   :term:`DISTUTILS_SETUP_PATH`
-      When used by recipes that inherit the
-      :ref:`distutils3 <ref-classes-distutils3>` class, this variable should
-      be used to specify the directory in which the ``setup.py`` file is
-      located if it is not at the root of the source tree (as specified by
-      :term:`S`). For example, in a recipe where the sources are fetched from
-      a Git repository and ``setup.py`` is in a ``python/pythonmodule``
-      subdirectory, you would have this::
-
-         S = "${WORKDIR}/git"
-         DISTUTILS_SETUP_PATH = "${S}/python/pythonmodule"
-
-      .. note::
-
-         ``distutils`` has been deprecated in Python 3.10 and will be removed
-         in Python 3.12. For this reason, the use of :ref:`distutils3 <ref-classes-distutils3>`
-         is deprecated. Instead use :ref:`setuptools3 <ref-classes-setuptools3>` and the
-         :term:`SETUPTOOLS_SETUP_PATH` variable.
-
    :term:`DL_DIR`
       The central download directory used by the build process to store
       downloads. By default, :term:`DL_DIR` gets files suitable for mirroring
@@ -6023,8 +6004,7 @@ system and gives an overview of their function and contents.
 
    :term:`PYTHON_ABI`
       When used by recipes that inherit the
-      :ref:`distutils3 <ref-classes-distutils3>`,
-      :ref:`setuptools3 <ref-classes-setuptools3>` classes, denotes the
+      :ref:`setuptools3 <ref-classes-setuptools3>` class, denotes the
       Application Binary Interface (ABI) currently in use for Python. By
       default, the ABI is "m". You do not have to set this variable as the
       OpenEmbedded build system sets it for you.
@@ -6033,14 +6013,9 @@ system and gives an overview of their function and contents.
       names used when installing the Python headers and libraries in
       sysroot (e.g. ``.../python3.3m/...``).
 
-      Recipes that inherit the :ref:`distutils3 <ref-classes-distutils3>` class during cross-builds also
-      use this variable to locate the headers and libraries of the
-      appropriate Python that the extension is targeting.
-
    :term:`PYTHON_PN`
       When used by recipes that inherit the
-      `distutils3 <ref-classes-distutils3>`,
-      :ref:`setuptools3 <ref-classes-setuptools3>` classes, specifies the
+      :ref:`setuptools3 <ref-classes-setuptools3>` classe, specifies the
       major Python version being built. For Python 3.x, :term:`PYTHON_PN` would
       be "python3". You do not have to set this variable as the
       OpenEmbedded build system automatically sets it for you.
-- 
2.30.2


