Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09351FCE086
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 13:56:41 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70270.1772114198328179298
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Feb 2026 05:56:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=s9iFT+Y7;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CB0ED4E4122A
	for <docs@lists.yoctoproject.org>; Thu, 26 Feb 2026 13:56:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7DEA95FDEB;
	Thu, 26 Feb 2026 13:56:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0C6BE10369390;
	Thu, 26 Feb 2026 14:56:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772114195; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uFyAvdac/VpShGuM1oAOsCOcPkk1pfjFaqrH7HyyqDQ=;
	b=s9iFT+Y79+dRqWepxNuyojODaZD9W+eu3+gEOwxNEpHyRfEFu6x9QkIRjDjvr7+CIzop3y
	1L0ZSCd99nhygBiEMhoKG8ZFlMBHzzj7AixWIe+xZItMRgtwrersheT4Wjuhlw5Fz4TjMJ
	lhuvgkrpAwpN6D0kdZFafMON4UHmYeI3xn8sbJEO3jQJOl/1lIMhPJH0u/K83YOM2TriB7
	wo9OKSlUaqus4NvxB2qikQklj9PIs7tm6T+RJEtDXveskNodIoAnYtzoQN4lwgNyUZw6Wv
	64CcGOiEFecDUw8AC/yz7i6xaMbuPgKpw02vO10OgJZeOSy6/5AEhgSvN45YEg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Feb 2026 14:56:33 +0100
Message-Id: <DGOY1XTFJREH.2443XZDH4VIT3@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 1/2] set_versions.py: build with versions from
 releases.json
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
References: <20260225-releases-json-v1-0-fee3f01b9197@bootlin.com>
 <20260225-releases-json-v1-1-fee3f01b9197@bootlin.com>
 <502a9603-d92a-4ed1-8888-f92ea1bab43f@cherry.de>
In-Reply-To: <502a9603-d92a-4ed1-8888-f92ea1bab43f@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 26 Feb 2026 13:56:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8994

On Wed Feb 25, 2026 at 3:15 PM CET, Quentin Schulz via lists.yoctoproject.o=
rg wrote:
[...]
> Something's wrong here I guess. This is not a properly ordered list of=20
> tags and I would assume someone at some point will make this assumption=
=20
> (e.g. how to get the latest version in a series? I intuitively would do=
=20
> releases[-1] but this won't work here).
>
> How is this generated?

This file is generated using
https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/release-=
parser.py,
so it needs to be fixed there, thanks for reporting.

Antonin

