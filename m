Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF06C88E64
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 08:36:18 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15915.1789374969315176314
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Sep 2026 01:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gR//kZT3;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2F82FC62209
	for <docs@lists.yoctoproject.org>; Mon, 14 Sep 2026 08:36:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F34F60323;
	Mon, 14 Sep 2026 08:36:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0080811C7AFD9;
	Mon, 14 Sep 2026 10:36:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789374966; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=abCdhoYNzya5siL5FDXcMOjOz5iRAE+FPojE/9p8vpY=;
	b=gR//kZT3S1NvCS8wTmGyMJfo6qXB90JgmK85NUQtnPx3TsLDretvilk9Ylux0+NFfmN1k+
	PlAO1AlGA9RLbbv3i6I7FGCU+vdhdqtkUl5Z26yA0XUwLbCssq4rgWnOKjY3YNNMgQm7B/
	I3S+p/prqnBQ4XrGeFs7Jzzi/ivdHg8PoDnm2rDAEWRwVBFBd14TEgG51WreLhb6HODbA9
	vUE+8sdJaAa7fQAcVN1ffADva4b2BpiRnCSNe9O2m6YqQD0DPZHRlYhgaQDPrlc68PitYX
	nCEuATeQ8R9HvFmROAtkmmSnvxEMtyIkp9MIQwnFbkvfhP3Su/zBQfEUpwO9TA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 10:36:05 +0200
Message-Id: <DLEWHJ0DKML4.2ITSSJJ00H3ZG@bootlin.com>
Subject: Re: [docs] how should one update "dual, six-core Xeons"?
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <b13f1dcb-14aa-8063-e9da-96817167a9aa@crashcourse.ca>
In-Reply-To: <b13f1dcb-14aa-8063-e9da-96817167a9aa@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 14 Sep 2026 08:36:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10485

On Fri Sep 11, 2026 at 8:08 PM CEST, Robert P. J. Day wrote:
>
> here:
>
> https://docs.yoctoproject.org/dev/dev-manual/start.html
>
> it's amusing to read, "These systems, in general, should be high
> performance (e.g. dual, six-core Xeons with 24 Gbytes of RAM and
> plenty of disk space)."
>
> would someone like to suggest a more modern configuration, and i'll
> submit a patch.

We could simply say: "&MIN_RAM; Gbytes of RAM, at least &MIN_DISK_SPACE; di=
sk
space".

Those are replaced by our poky.yaml.in replacements when building.

Not sure we need to mention a processor model here, as it would become obso=
lete
in the future.

Thanks!
Antonin

