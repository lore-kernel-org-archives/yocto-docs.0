Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA4FD6B072
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:26:30 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17261.1769700381096469042
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:26:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=pB+Yw8Rq;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8C38E4E4231D;
	Thu, 29 Jan 2026 15:26:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 62DD3606FD;
	Thu, 29 Jan 2026 15:26:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A2579119A868D;
	Thu, 29 Jan 2026 16:26:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700379; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cMHeURaBPAVPeEtfP2fDMpyFEVzrhAMjke4nMbB7JjE=;
	b=pB+Yw8Rq/7Rwc+a4LTBYcvtsIJschmszVfdSsUXBvZFYS0AiHV0ZzLFm4DtU96eYjIqFpV
	O/9yNUFLeca9P1uTZoedXkxBmY2azzvfjAdJWEHOCAkPCyKn2VfWyU4jbcfX7Nu/CUBHOl
	ucuBxirh75fjC5HAYq1dQ8Uc8C58GDboZHpGHtOSYjg7jdiNGLh+pv+GjMU8amhcylqYne
	YOei5c28j1HQI9UWc1b0N7JtIQb5lTzFERHYRTbv+TEOIirVSSnydbJQj8HLQuf23wfZfw
	GdUanfLMgFBg9VrJ3Nr6KTKfrp4SYrgVd0MRNmV9SWgDgJ7o+E1A3OOtW7V+CQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 16:26:18 +0100
Message-Id: <DG16FEAIC7BE.22NE3R65AH7NO@bootlin.com>
Subject: Re: [PATCH v3 00/57] Remove obsolete poky repo references
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Antonin Godard"
 <antonin.godard@bootlin.com>, "Quentin Schulz" <quentin.schulz@cherry.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <docs@lists.yoctoproject.org>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:26:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8844

On Thu Jan 29, 2026 at 4:22 PM CET, Antonin Godard wrote:
> The Poky repository's master branch is no longer updated:
> https://git.yoctoproject.org/poky/tree/README
>
> Many places in the documentation were still making references to Poky as
> in the repository. Migrate the documentation in two steps:
>
> Check all occurrences of "poky" or "source directory"
> (case-insensitive/multiline match), and reformulate/adapt.
>
> Most of the occurrences will usually be a path in Poky that can be
> replaced by OE-Core/meta-yocto.
>
> Some others are more tricky, and needed some re-organization / rework.
> For that reason, patch were split by files, to make reviewing/merging
> easier and incremental.
>
> This series depends on the "Redefine terms now that the Poky repository i=
s
> obsolete" series which redefines terms used to replaces occurrences
> here.
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

I will send pull requests with this series as-is. If any typos are left, le=
t's
send follow-up patches to fix them.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


