Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF464C54EE9
	for <webhook@archiver.kernel.org>; Sun, 11 Sep 2022 17:26:26 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.662.1662917186036678379
 for <docs@lists.yoctoproject.org>;
 Sun, 11 Sep 2022 10:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=npZP9jpq;
 spf=pass (domain: gmail.com, ip: 209.85.128.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id az6so5611688wmb.4
        for <docs@lists.yoctoproject.org>;
 Sun, 11 Sep 2022 10:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=lHhu6F2Nexs+lofwQF8LxpRLU0SzsGjp6LoB1cK+Z70=;
        b=npZP9jpqSTTVCmhQHcY2jVb1Ix9MTNwLqjkYeQIYhN9ydDJp7T/rI8vW5V5L8rVj6a
         Yk29beObNdmP1MkhvW9uZdz8wVfK/KsefqIsqVaAQLm8UZKlX3IYXpKAHtuprV5J9Iyb
         BBeKgyfcP/fHzx8rJP3cAyUPxfP5oK6t7Z2J1I9i7EjaaxLBfylzYMt/WQRn3UAZGw0P
         18mutCGkPguW8B2Pj79FJgfsHpPuf5mKmkDps0QxCct9rIA3kuVKlHgBBD4uUkzJS8nJ
         aSliCAVWEe4g6j8JX+xpWiD0dsLF4I4thtT31aKTn+qwoFM60BWXZ/8AUgRE4sA7x3hT
         ohmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=lHhu6F2Nexs+lofwQF8LxpRLU0SzsGjp6LoB1cK+Z70=;
        b=4JUP1SiAq8nTQ0I0wv6AoL006G1pWhMoQuXDhr9PHursdiB8o6zFILklZxngO2D6fA
         SvQMT/lxknODu30pTMdtute+CPmIkOVPVNr+jDlZv+GKxd3div+LY8yYtvFY2y1iMvl7
         En8qX5P7zQDjxMuydkvMhlJPxPmIo5YgfzIDG9ibzNbx6AZlcDlrjk9p8b8p+Nw8qSmt
         +NDa2EalmAALr/brQdlO0D8Gt8dVsV3PM2n2//78paNIgUDcFzhmxzNYgxhv2XvcuRzB
         lVGt5JgbfdlgtrTqAPPLhbzLxdNUqwFL61C8orOOz9arOXHOSd+Ij7XyKPgxvPSHI5LD
         p4Xw==
X-Gm-Message-State: ACgBeo19Tmf7tES6qLmXknxb8akt4DeV6ABn3NLIYBsihTwbwvPXDyAp
	+y3Uqv4hANnJWtNPBXjST5uoLMdapao=
X-Google-Smtp-Source: 
 AA6agR4FKz5HPqanfH9v4THMDOzrrQKX9QWs/tP5JyeGVJkvMoSIbOvh8u97UxvAQ12Pl4HlysLK+w==
X-Received: by 2002:a05:600c:5248:b0:3b3:24cb:fde with SMTP id
 fc8-20020a05600c524800b003b324cb0fdemr11334780wmb.80.1662917184138;
        Sun, 11 Sep 2022 10:26:24 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 g5-20020a5d4885000000b00228de58ae2bsm5280395wrq.12.2022.09.11.10.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 10:26:22 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/5] ref-manual: correct the location of default configuration
 template
Date: Sun, 11 Sep 2022 19:26:04 +0200
Message-Id: <20220911172608.2542076-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 11 Sep 2022 17:26:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3147

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 documentation/ref-manual/structure.rst | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index bdcffc194..6c6f52e79 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -189,7 +189,7 @@ Directory named ``mybuilds/`` that is outside of the :term:`Source Directory`::
    $ source oe-init-build-env ~/mybuilds
 
 The OpenEmbedded build system uses the template configuration files, which
-are found by default in the ``meta-poky/conf/`` directory in the Source
+are found by default in the ``meta-poky/conf/templates/default`` directory in the Source
 Directory. See the
 ":ref:`dev-manual/common-tasks:creating a custom template configuration directory`"
 section in the Yocto Project Development Tasks Manual for more
@@ -261,15 +261,15 @@ OpenEmbedded build system creates it from ``local.conf.sample`` when you
 :ref:`structure-core-script`.
 
 The source ``local.conf.sample`` file used depends on the
-:term:`TEMPLATECONF` script variable, which defaults to ``meta-poky/conf/``
+:term:`TEMPLATECONF` script variable, which defaults to ``meta-poky/conf/templates/default``
 when you are building from the Yocto Project development environment,
-and to ``meta/conf/`` when you are building from the OpenEmbedded-Core
+and to ``meta/conf/templates/default`` when you are building from the OpenEmbedded-Core
 environment. Because the script variable points to the source of the
 ``local.conf.sample`` file, this implies that you can configure your
 build environment from any layer by setting the variable in the
 top-level build environment setup script as follows::
 
-   TEMPLATECONF=your_layer/conf
+   TEMPLATECONF=your_layer/conf/templates/your_template_name
 
 Once the build process gets the sample
 file, it uses ``sed`` to substitute final
@@ -281,7 +281,7 @@ file, it uses ``sed`` to substitute final
    You can see how the :term:`TEMPLATECONF` variable is used by looking at the
    ``scripts/oe-setup-builddir`` script in the :term:`Source Directory`.
    You can find the Yocto Project version of the ``local.conf.sample`` file in
-   the ``meta-poky/conf`` directory.
+   the ``meta-poky/conf/templates/default`` directory.
 
 .. _structure-build-conf-bblayers.conf:
 
@@ -301,14 +301,14 @@ you ``source`` the top-level build environment setup script (i.e.
 
 As with the ``local.conf`` file, the source ``bblayers.conf.sample``
 file used depends on the :term:`TEMPLATECONF` script variable, which
-defaults to ``meta-poky/conf/`` when you are building from the Yocto
-Project development environment, and to ``meta/conf/`` when you are
+defaults to ``meta-poky/conf/templates/default`` when you are building from the Yocto
+Project development environment, and to ``meta/conf/templates/default`` when you are
 building from the OpenEmbedded-Core environment. Because the script
 variable points to the source of the ``bblayers.conf.sample`` file, this
 implies that you can base your build from any layer by setting the
 variable in the top-level build environment setup script as follows::
 
-   TEMPLATECONF=your_layer/conf
+   TEMPLATECONF=your_layer/conf/templates/your_template_name
 
 Once the build process gets the sample file, it uses ``sed`` to substitute final
 ``${``\ :term:`OEROOT`\ ``}`` values for all ``##OEROOT##`` values.
@@ -317,7 +317,7 @@ Once the build process gets the sample file, it uses ``sed`` to substitute final
 
    You can see how the :term:`TEMPLATECONF` variable is defined by the ``scripts/oe-setup-builddir``
    script in the :term:`Source Directory`. You can find the Yocto Project
-   version of the ``bblayers.conf.sample`` file in the ``meta-poky/conf/``
+   version of the ``bblayers.conf.sample`` file in the ``meta-poky/conf/templates/default``
    directory.
 
 .. _structure-build-conf-sanity_info:
-- 
2.30.2


