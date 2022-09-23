Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CADBC04A95
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:52:39 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.566.1663955548564620368
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 10:52:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YYieFbMX;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 03712200004;
	Fri, 23 Sep 2022 17:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663955546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zbbzEzpfC2D+FMf3QOOB+092GKaix0d3zElxY9xYwT8=;
	b=YYieFbMXyunl4JPYbeodwsPb+O05qmmlRYNA4Ok4iCh5ovg1kRkFlU3a+PDjBptZyRmQrx
	aDWUeXgeZDTcyLt1hDTbT140TY+2Zbvp5u4A6TagFUtJU95EuaT7OrsxodSlRA0BushHru
	kgyRGdCP9o+GLTUiI9zBbX9mHjvtHvdHsHLMltAfZerr9PkGs3sh4Bq5q1tu/lGgSleWNW
	Zd+Xm/TXI9Us2TDGRrmOo0/YtswpRK83YwIIOYAbzByXURl8KGDUijso5q5iS0OCbVHzaw
	0Fokk6R3FxWS4ptvM9hCKnmQRd5qb6bSZPcjWWk5JcKoTXEI26MgBGihclYhPQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 00/30] manuals: add missing references to tasks
Date: Fri, 23 Sep 2022 19:51:49 +0200
Message-Id: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Sep 2022 17:52:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3215

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

manuals: add missing references to tasks

As suggested by Quentin Schulz on https://bugzilla.yoctoproject.org/show_bug.cgi?id=14508

Michael Opdenacker (30):
  manuals: add references to the "do_fetch" task
  manuals: add reference to the "do_install" task
  manuals: add references to the "do_build" task
  manuals: add reference to "do_configure" task
  manuals: add reference to the "do_compile" task
  manuals: add references to the "do_deploy" task
  manuals: add references to the "do_image" task
  manuals: add references to the "do_package" task
  manuals: add references to the "do_package_qa" task
  overview-manual: concepts.rst: add reference to "do_packagedata" task
  manuals: add references to the "do_patch" task
  manuals: add references to "do_package_write_*" tasks
  ref-manual: variables.rst: add reference to "do_populate_lic" task
  manuals: add reference to the "do_populate_sdk" task
  overview-manual: concepts.rst: add reference to "do_populate_sdk_ext"
    task
  manuals: add references to "do_populate_sysroot" task
  manuals: add references to the "do_unpack" task
  dev-manual: common-tasks.rst: add reference to "do_clean" task
  manuals: add references to the "do_cleanall" task
  ref-manual: tasks.rst: add references to the "do_cleansstate" task
  manuals: add references to the "do_devshell" task
  dev-manual: common-tasks.rst: add reference to "do_listtasks" task
  manuals: add references to the "do_bundle_initramfs" task
  manuals: add references to the "do_rootfs" task
  ref-manual: tasks.rst: add reference to the "do_kernel_checkout" task
  manuals: add reference to the "do_kernel_configcheck" task
  manuals: add references to the "do_kernel_configme" task
  ref-manual: tasks.rst: add reference to the "do_kernel_metadata" task
  migration-guides: add reference to the "do_shared_workdir" task
  ref-manual: tasks.rst: add reference to the "do_validate_branches"
    task

 documentation/dev-manual/common-tasks.rst     | 68 +++++++++----------
 documentation/kernel-dev/common.rst           | 10 +--
 .../migration-guides/migration-1.3.rst        |  2 +-
 .../migration-guides/migration-1.7.rst        |  2 +-
 .../migration-guides/migration-1.8.rst        |  4 +-
 .../migration-guides/migration-2.1.rst        | 12 ++--
 .../migration-guides/migration-2.5.rst        |  2 +-
 .../migration-guides/migration-2.6.rst        |  2 +-
 .../migration-guides/migration-3.1.rst        |  2 +-
 .../migration-guides/migration-3.2.rst        |  8 +--
 .../migration-guides/migration-3.4.rst        |  2 +-
 .../migration-guides/migration-4.0.rst        |  6 +-
 .../migration-guides/release-notes-3.4.rst    |  2 +-
 documentation/overview-manual/concepts.rst    | 56 +++++++--------
 documentation/ref-manual/classes.rst          | 16 ++---
 documentation/ref-manual/faq.rst              |  2 +-
 documentation/ref-manual/qa-checks.rst        | 14 ++--
 documentation/ref-manual/structure.rst        |  2 +-
 documentation/ref-manual/tasks.rst            | 52 +++++++-------
 documentation/ref-manual/variables.rst        | 22 +++---
 documentation/sdk-manual/extensible.rst       |  2 +-
 21 files changed, 144 insertions(+), 144 deletions(-)

-- 
2.34.1


