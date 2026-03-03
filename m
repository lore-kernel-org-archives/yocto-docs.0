Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E6B2EC1430
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 13:14:18 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17988.1772543647797678667
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 05:14:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ZGH3u8UQ;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D12BF4E424FD
	for <docs@lists.yoctoproject.org>; Tue,  3 Mar 2026 13:14:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A7C495FF29;
	Tue,  3 Mar 2026 13:14:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 91B8F10368E91;
	Tue,  3 Mar 2026 14:14:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772543645; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fX306adyV8HRBcraR2ML/1Sk0aDwmYcJXCJ+XOR9+BE=;
	b=ZGH3u8UQvzySV1MRwcLFcevfLuen7Q7OCeBd+t/O7mV31eH5mweDsZTJTRNFsCQENh9dc8
	YAHImvDEVBsYNRGtGVj0gW+/8GJIt9/QJVf4M4Wx9j8DubupkG0xhYKRLbj/zCYchE5Jx/
	JKwgDFENUrmytmTQGnydNTcbXu56ELOjx5j1rrtImvkJN9CPfkGYhbKnL1AlRynEhfAKAU
	2h6sGyr4doOR6xgeIVvIsLdQop0O29vtAtA/Pb3aEIWH8EtvaYu6QDOgB4LtGwVdwa8gB3
	mP1+MyU2Jsdoo/ZkHlHpL2foLyiaK+rAqpzaGotKzXhFeK6f4sZPQywZOtGNqA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 14:14:04 +0100
Message-Id: <DGT6A4L263BU.ODVFK33QLCYV@bootlin.com>
Subject: Re: [docs] [PATCH v2 1/3] tools/fetch-releases-json: add to fetch
 and format releases.json
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
References: <20260226-releases-json-v2-0-6ba4a3b37b24@bootlin.com>
 <20260226-releases-json-v2-1-6ba4a3b37b24@bootlin.com>
 <38678bef-ba8f-4181-85f4-c367c3f6dc29@cherry.de>
In-Reply-To: <38678bef-ba8f-4181-85f4-c367c3f6dc29@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 03 Mar 2026 13:14:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9047

Hi,

On Fri Feb 27, 2026 at 11:26 AM CET, Quentin Schulz via lists.yoctoproject.=
org wrote:
> Hi Antonin,
>
> On 2/26/26 3:00 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> Add a simple script that can be used to fetch and format the
>> releases.json file from https://dashboard.yoctoproject.org/releases.json=
.
>>=20
>
> OK but why do we want this in the tree? It'll still be regularly outdated=
.
>
> I understand not wanting to rely on a network connection, but we already=
=20
> need that for the bitbake's object.inv we download... so this ain't that=
=20
> much different.

You're right, I forgot about that inventory file :( made this change with a=
n
offline build in mind.

Fetching the file when building seems like a proper solution, although:

- IMO, we need to fallback on fixed values, even if they're outdated, to no=
t
  block a documentation build if we can't fetch the releases.json file

- on the Autobuilder, we need to do the opposite: block a build if we can't
  fetch the releases.json file

- avoid fetching the file again if we already did (especially important on =
the
  Autobuilder as we don't want the file to be fetched for every tag + we do=
n't
  want it to change during a build)

With this in mind, I'll work on a v3. Thanks for your insights!

Antonin

