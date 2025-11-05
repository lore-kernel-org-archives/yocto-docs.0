Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA771CCFA0D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:27:50 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2588.1762385261998839507
 for <docs@lists.yoctoproject.org>;
 Wed, 05 Nov 2025 15:27:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0IZtWvCc;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso1720095e9.1
        for <docs@lists.yoctoproject.org>; Wed, 05 Nov 2025 15:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1762385260; x=1762990060; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7/3xRkzlnFSArUplThiRA/xp6DMYuc5rwUuyGP+BpIM=;
        b=0IZtWvCcDqmEDdcoPZ17YFiyiUqKuuzBa81Czg3ZIOHk4HfJRgrMWCADuqJw85mAyQ
         xBwu7mZd7L73WnInYW542dhnWD7TPH6CphVOioFym8gJB4M6JVAWB0zAsKVO7RgT8bgm
         kd7LIVqVLTuVggI2kX6sWgPRmnlmj/YgNAXhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762385260; x=1762990060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7/3xRkzlnFSArUplThiRA/xp6DMYuc5rwUuyGP+BpIM=;
        b=Zn2YQ4BdJQBkuuWMF1vHYBIBGbnj5Lzhw4D1U2XIjkl6KoECw1wPBI4W7Chy+l9Hwl
         GQYXt+sqx8/zT9ditRPhPyVraq/RviQNT2CiF4+ASkyT/CuEURhjJVJkULW3COaBfmnv
         1UNLfdhIcoMvRr9Pb95PKB4fuxQPSCqMes6c/UKitN/LkqLjudxKEiPukXBDfYlNBLyx
         9lMpnECmcxYo2l7+rN26RfhvhwZwCpzvIxpvktGQhYU9dKf3mvMLuyK2+DlOqTYMIbwi
         jJOidDq34fKM5gK7VfPaF50wlNOUzxAlFwhm6szYTxT8IbTSLpdEZp7sR5IEQMQjmpHW
         nQXg==
X-Gm-Message-State: AOJu0YwiqqMBh2eLbnyezlysAnDKQTcf/G1cfJOIAv/+7ak4UT4U6Cjq
	+arlfGl2Bhk3MoO1KniRGzB5P07XK5guMEVM38GPD3BTNaXPCRWosVudVcR6jnMN5KM=
X-Gm-Gg: ASbGncvlmoE/51zfSMDsSgFyIUTEmWq3SgzjFUAgLszDgWQ3688Ee6ZltHu1ur+fMd6
	HA8DjyOFSLguJe8p0gVKSJZCIOB+JQU95VEnr5joEGyfEBjKaPY1jnzwIA+wB32uVsnyYxZT4Z/
	qbqmJRioZOrGjRhy07D7eADO9Vh8YqL1wmM/nSrT1MWzIa/lHhQlA9pegG8OubLZhqYNzL49O7i
	GgJuEa2f53QxZYKGqDMxr1vats/2Z4FT6y8mw5qRwgxt6KyX+ah6Oc6Hj3sIn4rCAQdX0e1KvJy
	LIXVclub/x0zcIVKcb20Z/xupaTetjiNsO/RLkx947Soo5savchMeHkyGHVTVMFKiltP/nXzfOU
	lPAXtaPQFQ/Vwz/tUFGDnMVkT2uRkklXvnauo+0L8C+bNNcpNWFHjB2bEzm9X3OXYQXjOGe2Nv8
	Yf+ghnIMy+mQTlfS8522oT1odJBdQE3oKt2l8BsxE07vgpTrybJTynxB03f6rPLy/IUYOG6jQmG
	m1j2jVdN48=
X-Google-Smtp-Source: AGHT+IGwh3uAlWLJ7yc2Fm7oHtCjbAsbLrcW67+VuYZXBp2kDa7afQGbUvhD1tR9+x3syev6BUleQQ==
X-Received: by 2002:a05:6000:290b:b0:427:492:79e5 with SMTP id ffacd0b85a97d-429e32e45fcmr3283058f8f.21.1762385260335;
        Wed, 05 Nov 2025 15:27:40 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb49baaasm1381734f8f.38.2025.11.05.15.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 15:27:40 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: bitbake-devel@lists.openembedded.org
Cc: Yocto Docs ML <docs@lists.yoctoproject.org>,
	Yoann Congal <yoann.congal@smile.fr>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [master-next][PATCH] bitbake-user-manual-environment-setup: Document "{THISDIR}" in bb-layers
Date: Thu,  6 Nov 2025 00:27:18 +0100
Message-Id: <20251105232718.2801446-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 05 Nov 2025 23:27:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7992

From: Yoann Congal <yoann.congal@smile.fr>

A "bb-layers" element can either:
* start with "{THISDIR}/meta-xxx", then "meta-xxx" is found relative to
  the configuration file,
* or not, the layer is found where bitbake-setup has cloned
  the layer from the "sources" list (usually a layers/ directory)

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Cc: Antonin Godard <antonin.godard@bootlin.com>
---
 .../bitbake-user-manual-environment-setup.rst                  | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
index ad8143711..d9b7492b9 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
@@ -593,6 +593,9 @@ These files are written in the JSON file format and are stored in a
       variables to include in :term:`BB_ENV_PASSTHROUGH_ADDITIONS`.
 
    -  ``bb-layers`` (*optional*): Layers to add to the ``bblayers.conf`` file.
+      If the path starts by ``{THISDIR}/``, it will be relative to the directory
+      containing the configuration file. If not, it will be relative to the
+      directory used by ``bitbake-setup`` to store the sources.
       This cannot be used in conjunction with the ``oe-template`` option.
 
    -  ``oe-template`` (*optional*, OpenEmbedded specific): OpenEmbedded template

