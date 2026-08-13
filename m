Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6C2C5AC67
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 08:48:51 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14633.1786610921630095733
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Aug 2026 01:48:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qHLfelOG;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7C4584E411E9;
	Thu, 13 Aug 2026 08:48:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4FED7602B8;
	Thu, 13 Aug 2026 08:48:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8CDF811C4DB86;
	Thu, 13 Aug 2026 10:48:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786610918; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Mf55XSZKcEIzhbUJWRmR0mWwiaY3VPbqbqjBcHGmXkU=;
	b=qHLfelOGSLVKSop24dimpWSGQsnE7svCtqzbOJ1vBSxOYZWYTksMfa5ix3LSWgmos5W7eb
	twG01LPeFComn/MffRXv4i1BNuQkcC9j6MWA9gUpnj4aOzXSTn+CSOfYO0gf4eWr40wW4U
	B21NQrpcsTfGsxbABOQWakOXVYLDiY85l/lY6IafyT0h3OZu8+VwpKXUHgNb+MqOgseWgv
	N421q3XYtl7yC2Mh6KedGwq/Td2H362AxYABSGrsMDNYlSj/7xFGB4ONd+qLjhyy3UcNHc
	XJ2BsRKIvzNc0DHr90XLoQvMmbpvd+/2ObSOZjF2ySGFGsJG9s605I1qaMRxPA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Aug 2026 10:48:35 +0200
Message-Id: <DKNOPNZG31PG.381CXGWC5KWTE@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>
Subject: [scarthgap] Pull request
Cc: <docs@lists.yoctoproject.org>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Aug 2026 08:48:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10276

The following changes since commit 8496602a28b19fec9ee55dc45572b31a32c70443=
:

  ref-manual: Fix occurrences of omitted space with :prepend (2026-07-29 10=
:56:47 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs scarthgap-next

for you to fetch changes up to dc9a5aa19ca2a0b5ad866f0329b8a030542ca0c6:

  ref-manual/variables.rst: document the QB_DEFAULT_BIOS variable (2026-08-=
13 10:29:21 +0200)

----------------------------------------------------------------
Antonin Godard (4):
      dev-manual/sbom.rst: refresh for SPDX3
      docs-wide: remove CROPS references
      ref-manual/variables.rst: document qemuboot variables
      ref-manual/variables.rst: document the QB_DEFAULT_BIOS variable

Paul Barker (1):
      contributor-guide: Note patch complexity requirements for stable bran=
ches

 documentation/brief-yoctoprojectqs/index.rst       |   7 +-
 documentation/bsp-guide/bsp.rst                    |   3 +-
 documentation/contributor-guide/submit-changes.rst |   6 +
 documentation/dev-manual/sbom.rst                  |  27 ++--
 documentation/dev-manual/start.rst                 | 104 +------------
 .../overview-manual/development-environment.rst    |  16 +-
 documentation/overview-manual/yp-intro.rst         |  36 +----
 documentation/ref-manual/variables.rst             | 161 +++++++++++++++++=
++++
 documentation/sdk-manual/appendix-obtain.rst       |   3 +-
 9 files changed, 200 insertions(+), 163 deletions(-)

