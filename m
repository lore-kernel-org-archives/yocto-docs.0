Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F2CDE78488
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:24 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123745.1766593943925703645
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:32:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xe5JFyGc;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 674304E41D90
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3DBA26073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9946B10AB1384;
	Wed, 24 Dec 2025 17:32:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593941; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gyNqx1JRkMKL0mkrm3lb2dFCBrEO8orMqmdPDd0ZUCg=;
	b=xe5JFyGclvRaGZH40+tj57Dd5x9ZS2UhY4Wb7K6u5+WMAJ3M/rYGXbmojeX6m0QYgBH/q7
	HwnGZTMJgzSQk+09oO62S5eoqR0mNlEBPic8sYTaCrhVmei5rR3DHk6Vx7Cx9go8Rx1WZn
	2Tpo8WT7gI/qd7del/cJm8dscd/jFOlZye6GPuVDyzO7QbvLrUrurdmrMj9cLxwbKmjYMh
	EP8+cklBAuTyJynhp6DmLcPoVNJWEPwnk/Vk+6EOaplOkgh39a6Chk80+0Teml02hBw4vo
	zD23RLabsSkQN1EbaAgFiH3nU9PAVuwy6bt/XZ7hBsSIa7oP0frxY0pH/IMW0A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:32:15 +0100
Subject: [PATCH 49/53] ref-manual/system-requirements.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-49-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2257;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=wweFFD6YCicxokDpT0Wh6UYsTmj6vQrmP0Ud7axlHpw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVvLgPxLGEGAAujLxfYWaR/lxaZ44guCAn06
 MILsr6f7TOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVbwAKCRDRgEFAKaOo
 NogtEACoJbGPT2kgck1rcYHkg1aun5JA7QpmJXBORol27Y8O6M1rYjLqbCtAtux+TiPFQWXr0OP
 hRaTM1kPe4jHInzYOnEOgJxMf+1i0uHBpWmq+fACzDwinv/f1yN3jk3BUWAPB3b0pAzi3hBc/Fu
 CxG3BEb/vWsDqPf6yJIQUo52Nmx6mFGcJq47aoCXODIj9/e8NwD3h3wFlNugkNZfYOXCjYwQYrv
 62Qh9gCq9xoAB5E4mO2XkjF0gQ0al331XWoPNbbRxLUrf53eR5Pc7uNxF4MYyFqdAlSIDqGNTDg
 bdt2hHdKaPSfZ25qaQSykYQZznSZZbYF0M1dqtLJIZJCbXWEMKdhw0LvbiOKIrCAc15NM0BOBS+
 MoyT1WJdMXEe5EJDzjC4XxjmtA7TUBD1/xvNi356ZpGXBcGaRpTCpmxwLM5iawV7/3MhD6BVJga
 xQWOElcutkd4e2LhhIT1Z4H3J/1Kj8SSMqWwO7sHGaAI33qRvJcQIr+xgqxHUOMwnPBq3PhaQHc
 BvfLz7WZjeJzFOO48p/68o1F+RnF3Lud0KSjukCTUwsJMyP/1U4JlVly44RVEte/gV4iMAwOY3Y
 ustXo9xHrC/hCOSuMx8K1oX1+Ia+T0nFhNYfYI0wUqfXjUJ+kEp0ng1icHhILkCqOr1amD4VVNr
 X3QO20cvX27rndQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8378

Refresh the document now that the Poky repository is obsolete.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index a56e683ca..e8d6830b1 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -405,8 +405,8 @@ installer and automatically installs the tools for you:
 
 #. Execute the ``install-buildtools`` script. Here is an example::
 
-      $ cd poky
-      $ scripts/install-buildtools \
+      $ cd /path/to/project
+      $ ./layers/openembedded-core/scripts/install-buildtools \
         --without-extended-buildtools \
         --base-url &YOCTO_DL_URL;/releases/yocto \
         --release yocto-&DISTRO; \
@@ -420,26 +420,26 @@ installer and automatically installs the tools for you:
    To avoid the need of ``sudo`` privileges, the ``install-buildtools``
    script will by default tell the installer to install in::
 
-      /path/to/poky/buildtools
+      /path/to/project/buildtools
 
    If your host development system needs the additional tools provided
    in the :term:`buildtools-extended` tarball, you can instead execute the
    ``install-buildtools`` script with the default parameters::
 
-      $ cd poky
+      $ cd /path/to/project
       $ scripts/install-buildtools
 
    Alternatively if your host development system has a broken ``make``
    version such that you only need a known good version of ``make``,
    you can use the ``--make-only`` option::
 
-      $ cd poky
+      $ cd /path/to/project
       $ scripts/install-buildtools --make-only
 
 #. Source the tools environment setup script by using a command like the
    following::
 
-      $ source /path/to/poky/buildtools/environment-setup-x86_64-pokysdk-linux
+      $ source /path/to/project/buildtools/environment-setup-x86_64-pokysdk-linux
 
    After you have sourced the setup script, the tools are added to
    ``PATH`` and any other environment variables required to run the

-- 
2.51.0


