Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF49D5CCB7
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 10:09:24 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18958.1765879762029204417
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 02:09:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=grz/6PAL;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9D9A74E41C29
	for <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 10:09:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 611226071C;
	Tue, 16 Dec 2025 10:09:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 150CE11943353;
	Tue, 16 Dec 2025 11:09:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765879759; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=veud1sIylC23FieF8UQKggMX6AbxT/30D3yO7uYo8ho=;
	b=grz/6PALP1Z719BV7MW3e7GUQi6gcUg4v0eip2UBHywgEsx1bRw8Lu95C24GoobvXztqG+
	8WemwduyUrl9vMF6Leho9peJy64bzZThC2tVtE2lob3KqfPXrlixmIJsq2K0PtI8qtb7hH
	YC7SOro0S+Jbo0yW6veWv+U798tsmm/eLyvUw25DO71z6h8UmSlOB9SRWbLWXBCB0nJKYC
	R8RGcQeW+s+T6PgDCZo8H9/PkO8dR346VhCm4WUhc5AbdlGAbf74Svf3XQgx0N2CDs/g3F
	H5uCh+PfFd9F9a/VYyIrUOHOSP6G4IcXxuBngmdEE0PjgydZrJMnZhbMgM77Fw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Dec 2025 11:09:17 +0100
Message-Id: <DEZK4PFP76QY.NVX9OTMIP8WE@bootlin.com>
Subject: Re: [docs] is it time for a separate YP doc focusing on
 security/vulnerabilities/CVEs, etc?
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <rpjday@crashcourse.ca>, "YP docs mailing
 list" <docs@lists.yoctoproject.org>
References: <2d09b577-b67c-74cf-658e-8b82f29ad17d@crashcourse.ca>
 <dc3f345e-ad6f-435b-b0bb-98c07e1a9b7f@cherry.de>
In-Reply-To: <dc3f345e-ad6f-435b-b0bb-98c07e1a9b7f@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 10:09:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8283

Hi,

On Tue Dec 16, 2025 at 10:33 AM CET, Quentin Schulz via lists.yoctoproject.=
org wrote:
> Hi Robert,
>
> On 12/15/25 10:00 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
>>=20
>>    i know i've mentioned this before but, to start with, the dev manual
>> section "Making Images More Secure":
>>=20
>>    https://docs.yoctoproject.org/dev-manual/securing-images.html
>>=20
>> opens with three links all of which are more than a decade old. and
>> further down in that same manual, there are two sections related to
>> vulnerabilities. given the importance of security in the embedded
>> space, might it be time for a whole document devoted to the subject?
>>=20
>>    there were a number of talks related to this in the recent YP
>> virtual summit, that seems like a decent place to start. surely there
>> is easily enough content to justify a separate manual for this, no?
>>=20
>
> https://lore.kernel.org/yocto-docs/20251204-reorg-security-section-v1-1-7=
5aeeb741c83@bootlin.com/
>
> Maybe?
>
> Anything more to add to that patch? Since you have some interest in the=
=20
> topic, please take a few minutes and help reviewing it?

This patch moves the process-related security bits to its own section, but =
it's
process only. I believe Robert was talking more about a "how to secure your
target" manual.

Right now, I can see we have:

- dev-manual/securing-images.rst
- dev-manual/vulnerabilities.rst
- dev-manual/read-only-rootfs.rst
- (anything else?)

I'm not against moving these to a security manual, like the kernel or profi=
ling
one. It also puts security a bit more to the front, which I think is what t=
he
YP (and rest of the world) is leaning towards.

Afterwards, people can plug-in security guides/tips in there, as long as th=
e
implementation is supported in OE-Core/Poky. For example, systemd security
features through PACKAGECONFIG, etc.

This would also help with this open bug:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14509.

Regarding the links in securing-images.rst, yes, they could be refreshed or=
 even
removed, as I find the sentence "Consider the issues and problems discussed=
 in
just this sampling of work found across the Internet:" not strictly necessa=
ry in
a Yocto Project documentation context. Patches welcome :)

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


