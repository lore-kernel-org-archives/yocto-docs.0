Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D07DECEDDB7
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 15:25:01 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.19558.1728487497884251890
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 08:24:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=h+24NSUi;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B621240019;
	Wed,  9 Oct 2024 15:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728487496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4FQVPfzhlYE36evvP+IlmgTTnO6RvzO1HEiiRqat5ho=;
	b=h+24NSUi9lbcw2UqxlqyRC4qKsghYcVNfoVSXfHX4ruOfkzyVEzhlrb3fRUDuIT9iTXGNx
	5WF2D/XsKw5rYdy7n6uJSDRWIuRtbpLiaZPsAt3dci+rixTF7n6MI6U0JhUjbfGnGvfjI6
	PtRa0CGdtJY5UWXfN+tcq1ww2cSgPAF4nESPqFB6TsiGe3j+nCbTSRNu5Xi2ypE+fb4HOf
	4CUV4QVBX/McWo0Do/C0rPbZKt0YcWqlamY8+fKuWM2oOh71k12rQlBPdz2kqD9sSuboQ/
	SSgULS/nZ/U9RfCdIsKwMIFzegd2gr31rzPb5M5oT8ULHUmbDU0rcdwz+n/Oiw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 09 Oct 2024 17:24:19 +0200
Subject: [PATCH v2 11/16] ref-manual: add missing OPKGBUILDCMD variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-release-note-5-1-v2-11-7d484f7e7b6f@bootlin.com>
References: <20241009-release-note-5-1-v2-0-7d484f7e7b6f@bootlin.com>
In-Reply-To: <20241009-release-note-5-1-v2-0-7d484f7e7b6f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Paul Eggleton <paul.eggleton@microsoft.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1075;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=UDz7d+v+rTZqExTkeGAOhFjWE3wnLqASW25e6r1/tGc=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnBqBEQ7ug7M/XQWsHclbuB1Gg7gyjOPGJzjI+2
 pd+u+2AdJKJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZwagRAAKCRDRgEFAKaOo
 NtwrD/4nZP+wMbuj3hJYgnoQ+rh8DdElocSk8pyYMReOfzVgLa+JZ63eGYhmELpPN1dnh0ZGjVj
 tMcXI1u0pw0l401w7CcWpgP/dy0KomxNETCsiPPEvqipOb4Tt9NlPBBZx/vziCM3vrXuNbOKrbG
 G2EXAx0H6q9amnHlqqayDTVioxronvgyIiKKnDZdumPgCbHGMmLYWcEQn5XZzr2rlmNoxcYstWo
 mA29feODQN4ZEXiT3EdHSX1Ant1vd8YkUutsSkwa9uLMu+U8P5s1BWFMAXHJHBHcuA0/VoHdS9N
 9GeLTLUXtckq1SIDUZTy3Mx4DWDMGjg7RRMVQzkso+hWmiqParS77uIw/QK+ZLlTNI79n+lcskj
 p1d49xy70VCOudQwYBV1ChLYNjHggXMgQXv6h3c9JSFpqDJOWpclRdmUvyKfBAG4FHlwwpLN1eA
 2AH0CCXSlWBs53aGD4im+nUv9U4c7wQHL65Fi6wmgPjrNu2Ew9PhTus1Xb5x+hPoyODFgeQDA0f
 cids6rwbSOwyVM9BUku7EvSu322vljOi2VX25vN6Dis3tO1/Nhp1a2EZ0nURTgEkDASVqB7XCXr
 RIhS3xUdaOZQk5sco8qzk4ZDTO9pFheGccxk+ZGomCeCjW4p5NX/PO62BAgNUhA46vqOYjBSxZj
 mstiri2HfD2Ypjg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 15:25:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5440

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 8907572e6..72781d93b 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5761,6 +5761,13 @@ system and gives an overview of their function and contents.
    :term:`OPKG_MAKE_INDEX_EXTRA_PARAMS`
       Specifies extra parameters for the ``opkg-make-index`` command.
 
+   :term:`OPKGBUILDCMD`
+      The variable :term:`OPKGBUILDCMD` specifies the command used to build opkg
+      package when using the :ref:`ref-classes-package_ipk` class. It is defined
+      in :ref:`ref-classes-package_ipk` as::
+
+          OPKGBUILDCMD ??= 'opkg-build -Z zstd -a "${ZSTD_DEFAULTS}"'
+
    :term:`OVERLAYFS_ETC_DEVICE`
       When the :ref:`ref-classes-overlayfs-etc` class is
       inherited, specifies the device to be mounted for the read/write

-- 
2.46.0


