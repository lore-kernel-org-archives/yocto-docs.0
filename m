Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 799F4C44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 12:28:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4837.1784118486719845039
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Jul 2026 05:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=V2o8Pj+R;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6EE9E1A0FEF
	for <docs@lists.yoctoproject.org>; Wed, 15 Jul 2026 12:28:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3D7416035C;
	Wed, 15 Jul 2026 12:28:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C320611BD15D9;
	Wed, 15 Jul 2026 14:28:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784118483; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AuxRN0aZvHsQD3NOJMWCoIS1KB2eJAyAgEsYLvrebGg=;
	b=V2o8Pj+R5dCoi7XIqLjHbu3RcMav6UeVbcr9rDHvyUChzqYgKoFCYFgn2WFrHmDyMt24kz
	xa/B0XzKpU+eAHVWo7q5Z5n3D1nMayz4/69LmzvbXPCG5ASpXVEAlVUIcL4FHGD/tU3qE3
	MVLHBO8SnjS5Qrk8ZQiLlPWdCh48+XQiySLXm8nGo1BFVpB5axsZGjdVQxa6OD0gq6HRtI
	VogpWLS4CEZ9ey6s/Bchn5l/p298hnnXzuc4Iv6zH/GqihHIjU+R+iFvVaoK2Om/siK2pj
	JLaWtmLhpnuG8g7zfoCzb3v20anCvi8emGtplsEj9cXCcK5BDUbcOSdLYJMyGA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Jul 2026 14:28:02 +0200
Message-Id: <DJZ57VU7VSXO.1AKV7BYMZ0F0E@bootlin.com>
Subject: Re: [docs] [PATCH] fix multiple typo and grammar issues
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <lianux.mm@gmail.com>, <docs@lists.yoctoproject.org>
References: <20260715073400.81081-1-lianux.wang@processmission.com>
In-Reply-To: <20260715073400.81081-1-lianux.wang@processmission.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 15 Jul 2026 12:28:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10071

Hi,

On Wed Jul 15, 2026 at 9:34 AM CEST, wang lian via lists.yoctoproject.org w=
rote:
> From: Lian Wang <lianux.mm@gmail.com>
>
> Fix several typographical and grammatical errors across the
> documentation:
>
> - "and and" -> "and" in release-process.rst
> - "for for" -> "for" in release-notes-3.4.2.rst
> - "does not provides" -> "does not provide" in release-process.rst
> - "to be receive" -> "to receive" in submit-changes.rst
> - "overriden" -> "overridden" in release-notes-5.0.rst and
>   release-notes-5.1.rst
> - "now support" -> "now supports" in release-notes-5.1.rst
> - "referring WORKDIR" -> "referring to WORKDIR" in release-notes-5.1.rst
>
> Signed-off-by: Lian Wang <lianux.mm@gmail.com>
> ---
>  documentation/contributor-guide/submit-changes.rst     | 2 +-
>  documentation/migration-guides/release-notes-3.4.2.rst | 2 +-
>  documentation/migration-guides/release-notes-5.0.rst   | 2 +-
>  documentation/migration-guides/release-notes-5.1.rst   | 8 ++++----
>  documentation/ref-manual/release-process.rst           | 4 ++--
>  5 files changed, 9 insertions(+), 9 deletions(-)

I think this is a resend? This patch is already on master-next, and looks f=
ine
to me, thanks!

Antonin

