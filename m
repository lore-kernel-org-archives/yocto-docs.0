Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E18C76196
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 10:49:05 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.63023.1680000539650154216
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Mar 2023 03:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1ph6sr-00048Q-Gy; Tue, 28 Mar 2023 12:48:57 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1ph6sq-007Hl7-O2; Tue, 28 Mar 2023 12:48:56 +0200
Received: from uol by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1ph6sq-007xZW-42; Tue, 28 Mar 2023 12:48:56 +0200
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: Yocto Project Documentation <docs@lists.yoctoproject.org>
Cc: yocto@pengutronix.de,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH 1/2] kernel-dev: fix typos
Date: Tue, 28 Mar 2023 12:48:52 +0200
Message-Id: <20230328104853.1897266-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Mar 2023 10:49:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3816

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 documentation/kernel-dev/common.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index e0a85575c104..1d85202df49a 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -1083,7 +1083,7 @@ Consider an example that configures the "CONFIG_SMP" setting for the
 .. note::
 
    The OpenEmbedded build system recognizes this kernel as ``linux-yocto``
-   through Metadata (e.g. :term:`PREFERRED_VERSION`\ ``_linux-yocto ?= "12.4%"``).
+   through Metadata (e.g. :term:`PREFERRED_VERSION`\ ``_linux-yocto ?= "4.12%"``).
 
 Once ``menuconfig`` launches, use the interface to navigate through the
 selections to find the configuration settings in which you are
@@ -1384,7 +1384,7 @@ runs. This task validates the kernel configuration by checking the final
 ``.config`` file against the input files. During the check, the task
 produces warning messages for the following issues:
 
--  Requested options that did not make the final ``.config`` file.
+-  Requested options that did not make it into the final ``.config`` file.
 
 -  Configuration items that appear twice in the same configuration
    fragment.
-- 
2.39.2


