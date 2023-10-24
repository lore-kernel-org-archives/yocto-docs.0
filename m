Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D037C07545
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 13:23:29 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.147613.1698153804763629248
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 06:23:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EW7bVNcJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F339E1BF211;
	Tue, 24 Oct 2023 13:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698153803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7MtfLB4AFN6oa+n2yAizIHuWiEPndPzCJRBmwMflxAc=;
	b=EW7bVNcJ2XnjLfPVAZB/68GHLc9S1KRXW3t4naBYbgsjEUPsHnCZHDu7OGpB09C9zbQys6
	b3q8ziFFAiVku/AlDa+n9TSJNA9c6c2TJlxvD6nyHOPfXRuTv5FPiHjgAa8w9ldGoOzcaz
	peP3WJ4m+2/AEzTDNbX81kAULFCnqP9M7nIhl3svQKmm0gnGcSEY+nG+P2piMtnPoJ5osF
	hMlhhVN9r+R/AKD3c6EVfaoAOimforr9Kbxv8oa4/DjL+yx3MeDVanibtkkWfMs6eqKFim
	0ahMtNJtdOo4Y2PgufaFOVPVIUmtDggdcZos54Ru1AgwrvIWIbYKJjLL92U3cA==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [mickledore][PATCH 00/13] mickledore documentation backports
Date: Tue, 24 Oct 2023 15:23:05 +0200
Message-Id: <20231024132318.90209-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Oct 2023 13:23:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4461

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Corresponding to changes in master which are
also applicable to mickledore

Arne Schwerdt (1):
  ref-manual: Warn about COMPATIBLE_MACHINE skipping native recipes

BELHADJ SALEM Talel (5):
  ref-manual: Fix PACKAGECONFIG term and add an example
  dev-manual: layers: Add notes about layer.conf
  ref-manual: variables: add RECIPE_SYSROOT and RECIPE_SYSROOT_NATIVE
  ref-manual: variables: add TOOLCHAIN_OPTIONS variable
  ref-manual: variables: add example for SYSROOT_DIRS variable

Michael Opdenacker (4):
  bsp-guide: bsp: skip Intel machines no longer supported in Poky
  sdk-manual: appendix-obtain: improve and update descriptions
  brief-yoctoprojectqs: use new CDN mirror for sstate
  dev-manual: start.rst: remove obsolete reference

Quentin Schulz (1):
  ref-manual: variables: provide no-match example for COMPATIBLE_MACHINE

Robert P. J. Day (2):
  dev-manual: new-recipe.rst: add missing parenthesis to "Patching Code"
    section
  profile-manual: aesthetic cleanups

 documentation/brief-yoctoprojectqs/index.rst |   2 +-
 documentation/bsp-guide/bsp.rst              |  14 --
 documentation/dev-manual/layers.rst          |  14 ++
 documentation/dev-manual/new-recipe.rst      |   4 +-
 documentation/dev-manual/start.rst           |  24 +---
 documentation/profile-manual/intro.rst       |  40 +++---
 documentation/ref-manual/variables.rst       | 142 ++++++++++++++++++-
 documentation/sdk-manual/appendix-obtain.rst |  50 +++----
 8 files changed, 198 insertions(+), 92 deletions(-)

-- 
2.34.1


