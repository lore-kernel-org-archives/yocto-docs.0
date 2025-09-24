Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C283CAC5A7
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 08:36:15 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.7908.1758702971520079985
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Sep 2025 01:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ZPgNkq/F;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A2D231A0EFE;
	Wed, 24 Sep 2025 08:36:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7A8DF60634;
	Wed, 24 Sep 2025 08:36:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EB09F102F18CC;
	Wed, 24 Sep 2025 10:36:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758702969; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kO9YhQT6mR3317cJ/ub3k6O4UxWYAaeRpkZmemJoAJo=;
	b=ZPgNkq/F4o83sSRChd+yyO7RVszWpbBpNOm6TU/HSK4xEsgXiUmrSnSRFZKxLTdQIcHGNt
	hM9WP2exrIg6cDozD+sYBxukqmfQ/0ZelBRNr29HLp+49UAfHoBaGVw3VUAvnI/sWq403K
	x6SNn36DKtomiQLykAsd0FuMbalAEM521RdrxjWc8m73vrP5RTWfZpFMblsO5pGvoW3sTW
	dW9/oxFEFDYI1JTaRXHtqzXMCObuCvWL0ZOm8TNLuxbNaZNn3zVGnVs5tV8vFOgVhrPKUq
	7LjzY5p/jW3oslnkkEvGyGAFQ1zg5Ag9WjA2RVipk29alVoNQCQZsoe0y/HA1A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Sep 2025 10:36:06 +0200
Message-Id: <DD0W651ZACFT.1YL4JQYXNINAR@bootlin.com>
Cc: <tim.orling@konsulko.com>, <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <alex.kanavin@gmail.com>
Subject: Re: [docs] [RFC][PATCH v2] brief-yoctoprojectqs: add bitbake-setup
 info
References: <20250819213530.3616042-1-tim.orling@konsulko.com>
 <DD0B43YZK3LO.1TVXDXSLGVPIU@bootlin.com>
 <CANNYZj9n0Na=y9+-mY=AYc37-iYyLoQFX33q7D5ptsuxcsbiZA@mail.gmail.com>
In-Reply-To: <CANNYZj9n0Na=y9+-mY=AYc37-iYyLoQFX33q7D5ptsuxcsbiZA@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Sep 2025 08:36:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7587

On Tue Sep 23, 2025 at 6:38 PM CEST, Alexander Kanavin via lists.yoctoproje=
ct.org wrote:
> On Tue, 23 Sept 2025 at 18:06, Antonin Godard via
> lists.yoctoproject.org
> <antonin.godard=3Dbootlin.com@lists.yoctoproject.org> wrote:
>> Do we want to list this here? I feel like this could distract from the p=
oint of
>> this section, which is to showcase how to use bitbake-setup. I think we =
need a
>> separate section on fragments that we could link from here. I know this =
is
>> additional work: we can merge this as-is but probably a task for later.
>
> I too think properly documenting the oe-core fragment implementation
> and available fragments should be done first, and only then full
> bitbake-setup documentation should be based on it. Bitbake manual
> describes the addfragments keyword, but not what is actually done with
> that keyword in oe-core, or available tooling (in oe-core) to manage
> fragments, or available fragments.

I'm working on adding the docs on the fragments at the moment, it should be=
 out
this week.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


