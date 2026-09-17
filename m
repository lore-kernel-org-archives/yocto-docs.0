Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D87DC982DC
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 15:30:54 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42507.1789659049246990507
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Sep 2026 08:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=I7oBvU0M;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2E7FD4E407A0
	for <docs@lists.yoctoproject.org>; Thu, 17 Sep 2026 15:30:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F0DF35FAA3
	for <docs@lists.yoctoproject.org>; Thu, 17 Sep 2026 15:30:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5EB7B11C7B064;
	Thu, 17 Sep 2026 17:30:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789659042; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ozQWZXMQrBXh9xZpTOOojrDH7jzoE6GarmnotpfTSqE=;
	b=I7oBvU0MbogaUhbuzQvARpYHGNFnOqsioNY3G4n3ogoKfm6Y+mRidgf+DdxwISqOKSjbCg
	tc6QzFbWdpkuZv9Yf7VF4tvaGnG1j3bCC9AgeizhYjvoDA3PpMO/kyx7+z19cWpP9C6VVw
	3UO4dA/JGTlzSw8vNR//Dpe/+KpT1sPuN/YVHHgTtBeFQU9DyQYxsuANeaLEF1hZeVJVCy
	bzrRhn1bguMg+L9FR2ZWo/1YpCbkY0/YQrZFvn3Mc1ndRT33LMdp66MzkLwbJIPXq/O/CI
	+SXiDkvxnnuwZMixBJgJIVSMjhEGf3pbRDJEkdB2bCJ6B3fblqPS+ND0uZWv7w==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 00/10] Assorted fixes and additions
Date: Thu, 17 Sep 2026 16:52:38 +0200
Message-ID: <178965649659.302216.6161609826579095278.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911-assorted-fixes-v1-0-0d92a8112918@bootlin.com>
References: <20260911-assorted-fixes-v1-0-0d92a8112918@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 17 Sep 2026 15:30:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10525

Applied to master, thanks!

[01/10] security-manual/securing-images.rst: remove "your" in "your OE-Co=
re"
        https://git.yoctoproject.org/yocto-docs/commit/?id=3D0ddb7e1685cd
[02/10] bsp-manual/bsp.rst: fix a "local.conf" -> "layer.conf" typo
        https://git.yoctoproject.org/yocto-docs/commit/?id=3Dfb495dd96da3
[03/10] ref-manual/structure.rst: fix a "local.conf" -> "layer.conf" typo
        https://git.yoctoproject.org/yocto-docs/commit/?id=3Dbe0d9bf14ee7
[04/10] ref-manual/varlocality.rst: mention built-in fragments for distro=
/machine
        https://git.yoctoproject.org/yocto-docs/commit/?id=3D5f922a065676
[05/10] ref-manual/varlocality.rst: remove BBFILES from local configurati=
on assignments
        https://git.yoctoproject.org/yocto-docs/commit/?id=3D2f2cb936a285
[06/10] ref-manual/features.rst: add tools-profile
        https://git.yoctoproject.org/yocto-docs/commit/?id=3D3c55d1af536c
[07/10] ref-manual/variables.rst: BBMULTICONFIG: fix a typo
        https://git.yoctoproject.org/yocto-docs/commit/?id=3D0e575b2512f2
[08/10] dev-manual/poky-manual-setup.rst: suggest use of fragment instead=
 of assignments
        https://git.yoctoproject.org/yocto-docs/commit/?id=3D933f29490560
[09/10] ref-manual/variables.rst: fix local.conf.extended obsolete path
        https://git.yoctoproject.org/yocto-docs/commit/?id=3D7362e05392b8
[10/10] ref-manual/variables.rst: mention built-in fragments for MACHINE/=
DISTRO
        https://git.yoctoproject.org/yocto-docs/commit/?id=3D43e39aad99cc

