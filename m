Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D29C61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:43:08 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.18397.1700656977914312101
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Nov 2023 04:42:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k5L2d3yH;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9fd0059a967so157805866b.1
        for <docs@lists.yoctoproject.org>; Wed, 22 Nov 2023 04:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700656976; x=1701261776; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Q4nEpsf44nEYLpbMlq9LU0RUEkygPw+1LtgDw6mGpA=;
        b=k5L2d3yH7FRwXj+m0iZutUkl6zeGB+r+QhrKoCe092142tfF5bt2GfNl+jBNEh0dyC
         BbQqvNdLySaUJidmiQPuU108CQ/iJYVg1heq8npzl869w8b5yoEucJDAKIR6EfkO24yh
         ZufyDJimTNrcoS5xK2tR6b3Vgdx6YK1aLrxP+B1m0QJQmtTgrzCwU+4ZzdglTlXGd1rm
         Opw+o2RdrDtOFo/f5sNNEQD6t+f+T2p6O9eObSjLSn1PpeYLRdnXGcyxhshi4hVYofui
         CK2oPHwgRr19G7/MK90yL4ch62iNZ8choFHsJUN1KFRBMPAW2ZgHnfRlAQYmU7ITfls3
         h4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700656976; x=1701261776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Q4nEpsf44nEYLpbMlq9LU0RUEkygPw+1LtgDw6mGpA=;
        b=b2xS8GvVd1em919Lof9c+z/SToUHE+uUJHS1fnBsiSBy78hYXo1l/sugNQ3sP+sFvf
         dEvbrqwXGVOYQe97JtHJtGD37XcdB+TS+DBXJn0KFWQOE/DyNcmgXhiBFXx9I04Zrk4m
         8aME0RmaoHYvgfuI5K3mCy5Ln6i/khqQ4E1lA/fr00ELsElufu9x88zk5ObLZticG/mI
         PSMygViM9Q7SOxWKsRwvRuhUEU4A5UIoxKJrmlYOAg4Djbvvtt8RmKtPK99itdlDe+N/
         inrsftzBJn7zUUm+lGm9y2qBEjpa8WS7m2H93FpKnp1kO4As/9KYZOo+YdLh3be8euJT
         sxpA==
X-Gm-Message-State: AOJu0YzjH4tago9r0aI4ZAEL7o/pdf2ikeFsuuMTON4tdtlk6HOHGozo
	2BVeWQOvO7H2F2cWvOu/THOW8FL7qKM=
X-Google-Smtp-Source: AGHT+IEAT3HBUAI/Q1HXItWqMoHIl1mfAyFqxAJTcpkqnkpyQzCnVUWdoidaLoK+pqNwC3/WzxfhnA==
X-Received: by 2002:a17:906:5188:b0:9ff:9209:4bde with SMTP id y8-20020a170906518800b009ff92094bdemr1911496ejk.1.1700656975972;
        Wed, 22 Nov 2023 04:42:55 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x6-20020a1709064bc600b009a193a5acffsm6606683ejv.121.2023.11.22.04.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 04:42:55 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [kirkstone][PATCH] sdk-manual: extensible.rst: remove instructions for using SDK functionality directly in a yocto build
Date: Wed, 22 Nov 2023 13:42:48 +0100
Message-Id: <20231122124248.3820970-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Nov 2023 12:43:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4642

This was not actually backported to kirkstone (and isn't going to be)
but the documentation for the feature erroneously did make its way
from master into kirkstone.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 documentation/sdk-manual/extensible.rst | 63 +------------------------
 1 file changed, 1 insertion(+), 62 deletions(-)

diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 355c6cb0e..7edb3eb4b 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -41,44 +41,6 @@ functionality.
 Installing the Extensible SDK
 =============================
 
-Two ways to install the Extensible SDK
---------------------------------------
-
-Extensible SDK can be installed in two different ways, and both have
-their own pros and cons:
-
-#. *Setting up the Extensible SDK environment directly in a Yocto build*. This
-   avoids having to produce, test, distribute and maintain separate SDK
-   installer archives, which can get very large. There is only one environment
-   for the regular Yocto build and the SDK and less code paths where things can
-   go not according to plan. It's easier to update the SDK: it simply means
-   updating the Yocto layers with git fetch or layer management tooling. The
-   SDK extensibility is better than in the second option: just run ``bitbake``
-   again to add more things to the sysroot, or add layers if even more things
-   are required.
-
-#. *Setting up the Extensible SDK from a standalone installer*. This has the
-   benefit of having a single, self-contained archive that includes all the
-   needed binary artifacts. So nothing needs to be rebuilt, and there is no
-   need to provide a well-functioning binary artefact cache over the network
-   for developers with underpowered laptops.
-
-Setting up the Extensible SDK environment directly in a Yocto build
--------------------------------------------------------------------
-
-#. Set up all the needed layers and a Yocto :term:`Build Directory`, e.g. a regular Yocto
-   build where ``bitbake`` can be executed.
-
-#. Run::
-
-      $ bitbake meta-ide-support
-      $ bitbake -c populate_sysroot gtk+3
-      # or any other target or native item that the application developer would need
-      $ bitbake build-sysroots
-
-Setting up the Extensible SDK from a standalone installer
----------------------------------------------------------
-
 The first thing you need to do is install the SDK on your :term:`Build
 Host` by running the ``*.sh`` installation script.
 
@@ -172,12 +134,7 @@ Running the Extensible SDK Environment Setup Script
 ===================================================
 
 Once you have the SDK installed, you must run the SDK environment setup
-script before you can actually use the SDK.
-
-When using a SDK directly in a Yocto build, you will find the script in
-``tmp/deploy/images/qemux86-64/`` in your :term:`Build Directory`.
-
-When using a standalone SDK installer, this setup script resides in
+script before you can actually use the SDK. This setup script resides in
 the directory you chose when you installed the SDK, which is either the
 default ``poky_sdk`` directory or the directory you chose during
 installation.
@@ -195,11 +152,6 @@ script is for an IA-based target machine using i586 tuning::
    SDK environment now set up; additionally you may now run devtool to perform development tasks.
    Run devtool --help for further details.
 
-When using the environment script directly in a Yocto build, it can
-be run similarly::
-
-   $ source tmp/deploy/images/qemux86-64/environment-setup-core2-64-poky-linux
-
 Running the setup script defines many environment variables needed in order to
 use the SDK (e.g. ``PATH``, :term:`CC`, :term:`LD`, and so forth). If you want
 to see all the environment variables the script exports, examine the
@@ -1219,19 +1171,6 @@ You can use the following command to find out::
 Once you know the recipe
 (i.e. ``mesa`` in this example), you can install it.
 
-When using the extensible SDK directly in a Yocto build
--------------------------------------------------------
-
-In this scenario, the Yocto build tooling, e.g. ``bitbake``
-is directly accessible to build additional items, and it
-can simply be executed directly::
-
-   $ bitbake mesa
-   $ bitbake build-sysroots
-
-When using a standalone installer for the Extensible SDK
---------------------------------------------------------
-
 ::
 
    $ devtool sdk-install mesa
-- 
2.39.2


