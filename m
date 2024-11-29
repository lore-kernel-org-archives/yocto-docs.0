Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 475C8D6EBEB
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 08:08:03 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.111209.1732867680529183128
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Nov 2024 00:08:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=h8fqp1g0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7CCFF6000B;
	Fri, 29 Nov 2024 08:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732867678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JACMtjhLII7nrJTnrN2IUg81Fc3ZAX2PAFzGzQyWdMU=;
	b=h8fqp1g0wo5jcHAz362p1FYFyAaFIrIZdCd6YILC0rrhmcn63QpwsHyRWYFbo+YEgwAwOJ
	xjB2gPhfGs0w+6rUchxtfqsrjZeD8TpROB8Z6DDm+BscdG0mdNceN1slbySOXLo4whNyuB
	cPjgUPsOIZPZN/OCffT4GG8DyzOFgusMi359rxL/BosLFkbODZ37J+aw+xHyItpOK4r5v1
	FauVaUcdDP+LdkaA2EG5wxgr/pa+leNcgEEB/jfS34hv2KUy1utGVltCJVM3sAu7cOGAwn
	YlEca9elNTSqIFHIj1hJ7PAYTjN+e0/pY8RwhyYDY/u/TVs7PdUCIUB20mXx2w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 Nov 2024 09:07:57 +0100
Message-Id: <D5YIBP7FA4H3.2528IJ9BE6GBX@bootlin.com>
Subject: [kirkstone] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Nov 2024 08:08:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5847

The following changes since commit 188d4317fc7c6ebf0e6803e3240e9e3ba2024442=
:

  Revert "sphinx-static/switchers.js.in: do not refer to URL_ROOT anymore" =
(2024-11-15 15:37:17 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to 5b6e502c7640724471b791c521b7e976c03ad8e2:

  migration-guides: add release notes for 4.0.23 (2024-11-29 09:03:30 +0100=
)

----------------------------------------------------------------
Antonin Godard (2):
      standards.md: add a section on admonitions
      ref-manual: classes: fix bin_package description

Lee Chee Yang (1):
      migration-guides: add release notes for 4.0.23

 documentation/migration-guides/release-4.0.rst     |   1 +
 .../migration-guides/release-notes-4.0.23.rst      | 209 +++++++++++++++++=
++++
 documentation/ref-manual/classes.rst               |  45 +++--
 documentation/standards.md                         |  15 ++
 4 files changed, 253 insertions(+), 17 deletions(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.23.rst

