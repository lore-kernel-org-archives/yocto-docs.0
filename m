Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC41C369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 18:13:11 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.1114.1745950389206632994
 for <docs@lists.yoctoproject.org>;
 Tue, 29 Apr 2025 11:13:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1u9pS7-0006zS-Aj; Tue, 29 Apr 2025 20:13:07 +0200
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1u9pS7-000IrC-0T;
	Tue, 29 Apr 2025 20:13:07 +0200
Received: from ejo by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1u9pS7-00BziQ-0C;
	Tue, 29 Apr 2025 20:13:07 +0200
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: docs@lists.yoctoproject.org
Cc: yocto@pengutronix.de
Subject: [PATCH] ref-manual/variables.rst: update ROOT_HOME documentation
Date: Tue, 29 Apr 2025 20:12:55 +0200
Message-Id: <20250429181255.2858778-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: docs@lists.yoctoproject.org
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 29 Apr 2025 18:13:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6790

* Since scarthgap [1], the default will be overridden when using
  'systemd' as INIT_MANAGER. Reflect this in the documentation.
* The distro configuration is probably the better place for
  customization, thus at least mention this together with the
  local.conf.
* While at it, drop the probably redundant description on how to
  override weak default variables.
  The example on how to set "/root" is still given indirectly, anyway.

[1] ebafe463 ("systemd: upgrade to 255.1")

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 documentation/ref-manual/variables.rst | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index d17f81036..4527d15e4 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7761,17 +7761,12 @@ system and gives an overview of their function and contents.
          prefer to have a read-only root filesystem and prefer to keep
          writeable data in one place.
 
-      You can override the default by setting the variable in any layer or
-      in the ``local.conf`` file. Because the default is set using a "weak"
-      assignment (i.e. "??="), you can use either of the following forms to
-      define your override::
+      When setting ``INIT_MANAGER = systemd``, the default will be set to::
 
-         ROOT_HOME = "/root"
          ROOT_HOME ?= "/root"
 
-      These
-      override examples use ``/root``, which is probably the most commonly
-      used override.
+      You can also override the default by setting the variable in your distro
+      configuration or in the ``local.conf`` file.
 
    :term:`ROOTFS`
       Indicates a filesystem image to include as the root filesystem.
-- 
2.39.5


