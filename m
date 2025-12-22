Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F55E674A9
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 12:47:12 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.79367.1766407628875439256
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Dec 2025 04:47:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=PcI91WwL;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C46304E41D30;
	Mon, 22 Dec 2025 12:47:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8871A606C1;
	Mon, 22 Dec 2025 12:47:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EB2E510AB02A2;
	Mon, 22 Dec 2025 13:47:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766407626; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pc7EnjZ4sBbPHJFt0QQJpVJx6BZxq6uEk95eNKsnqKM=;
	b=PcI91WwLPEHRiSZI2uB03+uD11Zxf5Vrw7i4BNiSz6d3/qmbDhNmNjB8CQxR4pZ5U3jMfd
	gVDqH9lofp8gVZ5XEOMTnQbgkshyp57MhDg7vVOo/CEzjvNkH4VoWFxHeiTktebN9Gdfsd
	AlQJXdPBu1Qlg5IwoUANFk2OpGTq8uwY2iSkJXEORkjE6Z7WhE7vOhff9v+N2EyXxzGq/n
	pO5ToNwAyZOFiB1JAE9wRoJoqkjDCchSSQ4U3HoQPOv0r3iwYfGGl9cvCXGACyONdn8ule
	aen9gFpHeGXVvlUIhj70211vVQ9pGyIvakebeVLmsqJrFtV811ZcmqlWjLlM6Q==
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Dec 2025 13:47:04 +0100
Message-Id: <DF4R8S3O3XPL.3QAINTFSTX01D@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, "Quentin Schulz" <foss@0leil.net>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2 3/3] tools/build-docs-container: build in
 separate directory for each distro
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20251009-iid-file-v2-0-715d527457f0@cherry.de>
 <20251009-iid-file-v2-3-715d527457f0@cherry.de>
 <DDHXSDDQ1EBG.5IL8Q984MU8S@bootlin.com>
 <300758b6-f05d-4178-b8ef-00de46e07fca@cherry.de>
In-Reply-To: <300758b6-f05d-4178-b8ef-00de46e07fca@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Dec 2025 12:47:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8318

Hi,

On Wed Oct 15, 2025 at 1:37 PM CEST, Quentin Schulz via lists.yoctoproject.=
org wrote:
[...]
>> With this, additional runs with different SHAs will just stack next to t=
his,
>> re-creating the symlink only when it is not a directory. This way, I kno=
w that
>> for any previous run of build-docs-container, I can open the "_build" sy=
mlink
>> to get the latest output. Of course I need to be careful when running co=
ncurrent
>> builds, but that is another use-case, a bit different from day-to-day
>> development IMO.
>>=20
>
> Mmmmm...
>
> So I think we could make this concurrent-safe by using an flock on some=
=20
> file?
>
> e.g. surround any Make target that modifies the source directory with an=
=20
> flock, something like shown here: https://unix.stackexchange.com/a/382916
>
> And actually... I think we already have some issue with concurrency=20
> without calling make multiple times from the same tree.
>
> I believe when you run make all, make will run make html, make epub and=
=20
> make latexpdf in parallel which will all call set_versions.py which=20
> modifies the source tree. Same would happen if passing multiple targets=
=20
> to make (e.g. make latexpdf html). I don't think the f.write() and=20
> w.write() in set_versions.py are concurrent-safe.
>
>> What do you think?
>>=20
>
> With the flock above, we could simply add the creation of a=20
> _build/latest symlink which points to the last make target that ran.=20
> Maybe we want a _build/latest/html for the last make html target,=20
> otherwise imagine you run make all once and then make html one more time=
=20
> for another distro, then _build/latest will now point to _build/distroB/=
=20
> which didn't generate the html part). But that could also mean we should=
=20
> split the build directories for latexpdf, html and epub so this works...=
=20
> but that means not being able to reuse the sphinx "cache" (I believe=20
> there's one to do incremental builds? maybe it's also used for different=
=20
> output types?).
>
> I think we (I) may be overengineering this a tiny bit :)
>
> I think we probably should add an flock at least for the writing of the=
=20
> files by set_versions.py if that proves to be an issue (testing needs to=
=20
> be done :) )

Sorry for the delay answering to this, I was caught up with the Whinlatter
release and never had the time to properly look at this.

I've sent a respin of this with what we were mentioning here, copied you to=
 it:
https://lore.kernel.org/r/20251222-concurrent-safety-v1-0-e3d86e44cd38@boot=
lin.com

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


