Return-Path: <aurelien@hackers.camp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 917F7D3943A
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 14:42:35 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17380.1775140946558389822
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Apr 2026 07:42:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: aurelien.desbrieres@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43cf5f6d2eeso57717f8f.0
        for <docs@lists.yoctoproject.org>; Thu, 02 Apr 2026 07:42:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775140945; x=1775745745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FVdi2KhOCT02mv5wIzpPT/kE5XGYVPCNxmjAcFpJ9hI=;
        b=AdVYIsijShPXNm2cE9X+wf6XrnXOml7YvVNFeCt3vVQAV79Fu9iYpwhqEEgpNLKoSE
         +tLQJ3/mDmnR3zKeYtQCZ4y7LLcAoumgY7znCIEz7UI9tIXH9NWlsL1ht3b84lmgMwug
         oCy3YWMal76de39Lc455nhyVlw7hqKLdxtHI0nyyRTdUuiX2D6k/S6fJleKDUSpyrwQq
         bThZN+Q6TesH3hWAvBKeqa8A1BKigknhsz0NvHt6S+KAuCY9j0BByNav0xSUdOblEce/
         0q14/lYHcuizLW+PPiR5FFha4U1K9YHymo132wjGi9PnaBaSoETXuyerwufpnvx3no+E
         PRZg==
X-Gm-Message-State: AOJu0Yy93XMOq8KLlf1gZLhYuqFK2eEn1uxIRck/as9Q/UmP79WiNN43
	79uQaOOQ33OVHCbImOHyjXgl3m6hRTLAfPMts9hR9Pf/5THc/pEEA/rFul2RxxwD
X-Gm-Gg: AeBDietwoUBBwpQPL603fF4Ccj0zeTzINNldQiHTadgFxavRPy2RVGXHyr3KPwCIxDQ
	V33GAb4QPgad/Gz9A7LCTD4rDuZW8WEEGLnurFhddbRf6lIg1joNZ3TWDAhb/eOk2eayCAckJC6
	3dja26YICQTOtoPrloK7QXLAxVUPYNQgiysU2MdlpYmQVzQi22DuaqmDK0GLXEqRQStRORaSohC
	yOpOtsGLcHtxihwFg0LPUkVARM0Qip8LE91JhMqYMMMhPZrPGgIgnt/+N9ZEAHi+NKpRG1LVItK
	nAPne8QcDkGylBotbwayCv5+1Sl31B8M9wwA1vPc+zw0WHe1C0+3MMiml44ymZ+Z0aCluA2OHkg
	ajr8V4Jvm15LjRE9vjeYfz/+efPSUJ4FhRcNWoMm3qEB2ephn0mtQS02m43oYLhP4EeaDPk0MBc
	Dk7pvf3E2hTD2rqtIswuG4IcWzQuDJl7qbgwbaUAZm2fMBPSW+FfyuOS/A8/IbjLk4
X-Received: by 2002:a05:6000:2d88:b0:43b:a156:568d with SMTP id ffacd0b85a97d-43d150edea8mr4975227f8f.4.1775140944476;
        Thu, 02 Apr 2026 07:42:24 -0700 (PDT)
Received: from device-64.home ([2a01:cb1c:784:2f00:604:f02e:5d85:348b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f843dsm8065653f8f.37.2026.04.02.07.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:42:24 -0700 (PDT)
From: Aurelien DESBRIERES <aurelien@hackers.camp>
To: docs@lists.yoctoproject.org
Cc: Aurelien DESBRIERES <aurelien@hackers.camp>
Subject: [PATCH 1/1] ref-manual: system-requirements: add Gentoo package list
Date: Thu,  2 Apr 2026 18:42:18 +0200
Message-ID: <20260402164218.210974-2-aurelien@hackers.camp>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260402164218.210974-1-aurelien@hackers.camp>
References: <20260402164218.210974-1-aurelien@hackers.camp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Apr 2026 14:42:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9171

The documentation lacked a Gentoo section under 'Required Packages
for the Build Host'. Several third-party guides reference incorrect
Gentoo package atoms (e.g. dev-util/chrpath, app-text/chrpath,
dev-util/cpio) which do not exist in the Gentoo Portage tree.

Add a Gentoo-specific section with verified package atoms:
- app-admin/chrpath  (not dev-util/chrpath)
- app-arch/cpio      (not dev-util/cpio)
- dev-build/cmake    (not dev-util/cmake)

Also note Python version compatibility: python:3.11 or python:3.12
should be preferred over 3.13 for Scarthgap/Nanbield compatibility.

Gentoo is noted as unsupported but the information helps users on
this distribution avoid common pitfalls.

Signed-off-by: Aurelien DESBRIERES <aurelien@hackers.camp>
---
 .../ref-manual/system-requirements.rst        | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index b427e2c64..4bacc7b2a 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -361,6 +361,48 @@ previous step):
 
    $ export PATH="${PATH}:${textooldir}/tl/bin/x86_64-linux"
 
+Gentoo Packages
+~~~~~~~~~~~~~~~
+
+Here are the packages needed to build an image on a headless system
+with a supported Gentoo Linux distribution:
+
+.. code-block:: shell
+
+   emerge -av \
+     dev-vcs/git \
+     dev-lang/python:3.11 \
+     dev-python/pip \
+     dev-util/diffstat \
+     app-admin/chrpath \
+     sys-apps/texinfo \
+     dev-libs/glib \
+     sys-apps/file \
+     app-arch/xz-utils \
+     sys-libs/zlib \
+     dev-build/cmake \
+     dev-lang/perl \
+     app-misc/screen \
+     app-shells/bash \
+     sys-process/lsof \
+     app-arch/cpio \
+     app-arch/tar \
+     sys-apps/util-linux \
+     sys-apps/gawk \
+     dev-vcs/git \
+     net-misc/socat \
+     sys-apps/lsof
+
+.. note::
+
+   Gentoo is not an officially supported distribution. Package names
+   were verified against the Gentoo Portage tree. Note that
+   ``chrpath`` is found under ``app-admin/chrpath`` (not
+   ``dev-util/chrpath``), and ``cpio`` under ``app-arch/cpio`` (not
+   ``dev-util/cpio``). For Python version compatibility with Yocto
+   releases, prefer ``dev-lang/python:3.11`` or ``dev-lang/python:3.12``
+   over 3.13.
+
 .. _system-requirements-buildtools:
 
 Required Git, tar, Python, make and gcc Versions
-- 
2.52.0


