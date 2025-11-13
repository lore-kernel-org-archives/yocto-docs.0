Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ADC7CD5BA9
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 09:21:17 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19762.1763025667619275697
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 01:21:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=z+fLeQMI;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 607D24E41685;
	Thu, 13 Nov 2025 09:21:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2E6496068C;
	Thu, 13 Nov 2025 09:21:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B4ED2102F21A8;
	Thu, 13 Nov 2025 10:21:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763025664; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xsNogpJiyqDS7K/QXMScy2PzZLdTYu5Flw/jOGIUcv4=;
	b=z+fLeQMInLEMWgQ2pPZ7Ahm/L5zZMbnJB7oDt0DKJ2ruzFtqf5SavvmenVpU3AhKnbmNNE
	3oVmaZn+YB//cR31OIzSecllr9p21X+hgnFAydIWzy2nH0xSDihgR/9tzHmMfks9qVRHnU
	9xJTap5ESrx0pkw1PtNd4ktrLFHIkB/dl4Gey04UC5RvrZqJ7EkpBINAwSDVNil++Q9F5R
	pooIoDlli7m06Z9HnpfK6QOVE2wBm6I07QU3UVr2IqcHz5EVIggztdU2tn+4w2ewOnTdEH
	awcJsl2P67TvjzEM0+y+Mvpy7PK+DiYw5cnJg3V0CIV5Ipqiadj8gdF48y2ecQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Nov 2025 10:21:03 +0100
Message-Id: <DE7GFSIDHHJJ.2MT1342UXUSBA@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Ahmad Fatoum" <a.fatoum@pengutronix.de>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] migration-guides: 5.3: mention barebox migration
 guides
Cc: <ejo@pengutronix.de>, <yocto@pengutronix.de>
References: <20251113085516.1067909-1-a.fatoum@pengutronix.de>
In-Reply-To: <20251113085516.1067909-1-a.fatoum@pengutronix.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Nov 2025 09:21:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8030

Hi,

On Thu Nov 13, 2025 at 9:55 AM CET, Ahmad Fatoum wrote:
> Inspired by the Yocto migration guides in this repository, I have been
> maintaining release migration guides for barebox going back to
> v2024.09.0, the first release after barebox was added to OE-core.
>
> These contain actionable advice for users, e.g., rename of CONFIG options
> or differences in the shell environment.
>
> Reference the barebox migration guides from the Yocto migration guide
> to help users with their updates.
>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
> Unsure about the placement; Are the release-notes a better place for this=
?

Given that your link points to a migration document, I think your link is w=
ell
placed under the misc changes, thanks. (Also, barebox's version shouldn't c=
hange
as we are close to feature freeze).

> Or given that this would be a recurring aspect for future releases, just
> add it once to the class documentation?

I would even just make the class description point to the barebox website:

"""
The :ref:`ref-classes-barebox` class manages building the `barebox
<https://barebox.org>`__ bootloader.
"""

Then a link to the doc / migration document at the end of the class descrip=
tion
could be a good idea too.

Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


