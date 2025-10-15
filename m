Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B519CCD195
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 11:46:22 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.14095.1760528778607760866
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Oct 2025 04:46:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Se63tCqP;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 12BD91A13CD
	for <docs@lists.yoctoproject.org>; Wed, 15 Oct 2025 11:46:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DEC5A606F9
	for <docs@lists.yoctoproject.org>; Wed, 15 Oct 2025 11:46:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C2E0102F22B7;
	Wed, 15 Oct 2025 13:46:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760528776; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6Ud8wq5erlMi0ObXEeCmeTIaBLhnaoqIDrfRvbmSI7E=;
	b=Se63tCqP2I6A4OJSIL7RwJk2JHBZFrqexujHsuuJXzS40x5NtHDTtRYlXXcAry0Pz+5G+Z
	CWZ27pWQ/fF/HxzZlDw1zFn/SYan20RjfzLHGDD51jAxbyBYUn+x0g6fie4SbS9DfBu8Ww
	8ZI/9vLQL66DCSWUSiKYpAObxRaotSh8HGiGcR8wwP9iT3c2Ynm2jRB2T5D1vzTT2hJEg0
	6SHgg2lPQF8hXA5a75h8DmRfDFGqKMiABN1xq2cudqrZSUOMElz7goTn6UeZpRgLAXW2eK
	KtnKlNkQeAs/YBDD051uvxsAbqrmxdF/uUb7mg+WUcAbf78XDThBf8cYCid3Dg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] ref-manual/fragments.rst: remove duplicated built-in fragment note
Date: Wed, 15 Oct 2025 13:45:21 +0200
Message-ID: <176052868602.3167271.9990372709297000024.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010-fix-builtin-fragments-doc-v1-1-2594783324f0@bootlin.com>
References: <20251010-fix-builtin-fragments-doc-v1-1-2594783324f0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Oct 2025 11:46:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7704


On Fri, 10 Oct 2025 16:54:56 +0200, Antonin Godard wrote:
> This behavior was removed in commit aea2d69d0533
> ("lib/bbconfigbuild/configfragments: disable the previous builtin
> fragment when enabling a new one") in OE-Core.
>=20
>=20

Applied, thanks!

[1/1] ref-manual/fragments.rst: remove duplicated built-in fragment note
      commit: e420f0f90614b13fc92654219296182858ca17b9

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

