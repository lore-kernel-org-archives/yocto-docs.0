Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FBBEC44501
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 09:13:05 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8650.1784193176309079373
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Jul 2026 02:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=bBRvoqK/;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 046204E40E06
	for <docs@lists.yoctoproject.org>; Thu, 16 Jul 2026 09:12:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C5E8C602B8
	for <docs@lists.yoctoproject.org>; Thu, 16 Jul 2026 09:12:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E74AE11BD3CA7;
	Thu, 16 Jul 2026 11:12:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784193173; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gg5oiXJ8oQ4ia4HHj+CMwLeN6kbdDzbfF1woshTfuw0=;
	b=bBRvoqK/O76pYKzeBnYhB9e603hRu7hSfEmVPhRhZFtTj3na8mutF6IrbG23aQ79ire0Pg
	FgN9LdF9D420cZiBYgka4mAq+LRtux6cStPbOVZtQgDr58hp/o7UBT1rhTonpFDCMaXPTh
	pMc1bnfrsQi3DRw7HbB/GoAe5vuVwiAyvLEhycP8V2QmP1GfCDRdKO+rxSxk2nFiQ1ymQX
	OFHR+WY0x82uc74yk+i2fCEP2IlAqeI33cIN2F5C1Jtmu5WRUsKexcdHy69R+51qQBkeQ0
	3bO62s6C9Sy+7xC6xJzwTz6ipsAmYic2md3P9alnTWZk2RtWP8oIomCRIUBJug==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/8] Fix broken links
Date: Thu, 16 Jul 2026 11:12:14 +0200
Message-ID: <178419298534.94913.4036845260906270764.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260710-linkcheck-v1-0-999168371d5e@bootlin.com>
References: <20260710-linkcheck-v1-0-999168371d5e@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Jul 2026 09:13:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10079

Partially applied, thanks!

[1/8] conf.py: add linkcheck builder exclusions
      (not applied)
[2/8] conf.py: add extra links known to be broken
      (not applied)
[3/8] migration-guides/release-notes-3.4.2.rst: fix a broken link
      commit: 4fd8cc10d3749f6ab3a372f943b5586f465565fb
[4/8] docs-wide: fix broken path links
      commit: 12a5d2add529e789480fa782af3803dada982869
[5/8] ref-manual/classes.rst: replace obsolete mailing list thread
      commit: 5e792ff01d463a7eca21b7be50124d7c10ff8559
[6/8] ref-manual/images.rst: update obsolete VMWare links
      commit: 7c969dcbebf5cccb28ccbf2370dc8b52cbd08974
[7/8] migration-guides/release-notes-5.0.rst: remove broken link
      commit: 45f54eca0f7ba4a56ce7dd8a1a388eef1eeffc45
[8/8] docs-wide: fix various broken links
      commit: 358519ca6406a89fee42c45dcaf63a37a374f33c

