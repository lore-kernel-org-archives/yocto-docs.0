Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B68B8C07545
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 13:27:29 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.18015.1698154042871258487
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 06:27:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FIGrlQRf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68FA820003;
	Tue, 24 Oct 2023 13:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698154041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LA1oEZ2R9AHua7kuUfiesQzD9HpMcoZPqrHsA7Y30CU=;
	b=FIGrlQRfk+UrnSC8gvbLyesWeVA1PnpxHaC0/Dwvb4ZSSVBbFDVU10tGwV0C9oQOOrGBtu
	MJm4Mi9/cWbXfRjuyVGwVQ6Hm6QFTxXcjaKzp3/0xUqPvDRLzQNsCnPvmgFi7qKeuDW+Gv
	XVgDy6bZe1HhE6DZ7ZpP8SiLbziKN3y6I3L+lcDWi+EbB6D8TBZoYj9RsQo//IWUtJpgcy
	z4h9/8isowbkzJ/g07aurtfgYC3kOiorkFsyN8z1VAfHxRF6Ydn1pQAu0dqniE36ErYgKR
	CoIw8R9bn/GqkmKCM1yjFyoWvPcLsREChVv/QN87y1gtMf2I9pd5cR3BjNp1YQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 00/16] kirkstone documentation backports
Date: Tue, 24 Oct 2023 15:26:56 +0200
Message-Id: <20231024132712.90600-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Oct 2023 13:27:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4475

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Corresponding to changes in master which are
also applicable to kirkstone, sometimes after
specific tweaks.

Arne Schwerdt (1):
  ref-manual: Warn about COMPATIBLE_MACHINE skipping native recipes

BELHADJ SALEM Talel (5):
  ref-manual: Fix PACKAGECONFIG term and add an example
  dev-manual: layers: Add notes about layer.conf
  ref-manual: variables: add RECIPE_SYSROOT and RECIPE_SYSROOT_NATIVE
  ref-manual: variables: add TOOLCHAIN_OPTIONS variable
  ref-manual: variables: add example for SYSROOT_DIRS variable

Michael Opdenacker (6):
  manuals: update linux-yocto append examples
  dev-manual: wic: update "wic list images" output
  sdk-manual: appendix-obtain: improve and update descriptions
  bsp-guide: bsp: skip Intel machines no longer supported in Poky
  brief-yoctoprojectqs: use new CDN mirror for sstate
  dev-manual: start.rst: remove obsolete reference

Paul Eggleton (1):
  dev/ref-manual: Document INIT_MANAGER

Quentin Schulz (1):
  ref-manual: variables: provide no-match example for COMPATIBLE_MACHINE

Robert P. J. Day (2):
  dev-manual: new-recipe.rst: add missing parenthesis to "Patching Code"
    section
  profile-manual: aesthetic cleanups

 documentation/brief-yoctoprojectqs/index.rst |   2 +-
 documentation/bsp-guide/bsp.rst              |  46 ++---
 documentation/dev-manual/layers.rst          |  14 ++
 documentation/dev-manual/new-recipe.rst      |   4 +-
 documentation/dev-manual/start.rst           |  24 +--
 documentation/dev-manual/wic.rst             |  27 +--
 documentation/kernel-dev/advanced.rst        |   3 +-
 documentation/kernel-dev/common.rst          |  34 ++--
 documentation/profile-manual/intro.rst       |  40 +++--
 documentation/ref-manual/variables.rst       | 180 +++++++++++++++++--
 documentation/sdk-manual/appendix-obtain.rst |  50 ++----
 11 files changed, 275 insertions(+), 149 deletions(-)

-- 
2.34.1


