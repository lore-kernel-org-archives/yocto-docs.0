Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2968AD609C8
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 16:22:47 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26734.1765902160642601237
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 08:22:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ztBigvIC;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6A02CC1A580;
	Tue, 16 Dec 2025 16:22:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C38A16071C;
	Tue, 16 Dec 2025 16:22:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C384119A900E;
	Tue, 16 Dec 2025 17:22:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765902156; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/1KMsdJDIBuOvk5RztF3A7b4xMaiQ3wN6B4M9GXmpmg=;
	b=ztBigvIC16+w4r6448aYACXfu+/vblINPU20zt3HVSgypE1+T5RX3DVXkGZ/1NJGb4ejQm
	NpF07akg/DweIymOjyUikR3+l9NIfNEKIPKqScd82J982bn2WmMA4P3Y3dTjf2vinOjYFb
	cbJqJEAKrWtuKe66ZpvH04oAqPhtG9IeMd8TUEeSRKyByIXDE5U0qiuVJlGij6ufc+BtzZ
	BZapCg+CfZY24QgXa0XgiGJQujFmcGzmiZlpJqhYUCAB5obtrsE3suDY/PFlwOJqDx5nG5
	3wTIDW3YE5eJCSG5LKMQW0qwPN8ZX1ulelufRvQ9pl+L/lrrNOCrWr0rKNwzzw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Dec 2025 17:22:34 +0100
Message-Id: <DEZS2I985ADM.1SEISSPXMJX2A@bootlin.com>
Subject: Re: [docs] [PATCH] migration-guide: update 5.3 release notes
 download section
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <chee.yang.lee@intel.com>, <docs@lists.yoctoproject.org>
References: <20251216143327.759452-1-chee.yang.lee@intel.com>
In-Reply-To: <20251216143327.759452-1-chee.yang.lee@intel.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Dec 2025 16:22:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8298

Hi,

On Tue Dec 16, 2025 at 3:33 PM CET, Lee Chee Yang via lists.yoctoproject.or=
g wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> also align some note with finalized release notes.
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>  .../migration-guides/release-notes-5.3.rst    | 90 +++++++++++++++++--
>  1 file changed, 83 insertions(+), 7 deletions(-)
>
> diff --git a/documentation/migration-guides/release-notes-5.3.rst b/docum=
entation/migration-guides/release-notes-5.3.rst
> index 536067d63..7e41bc862 100644
> --- a/documentation/migration-guides/release-notes-5.3.rst
> +++ b/documentation/migration-guides/release-notes-5.3.rst
> @@ -8,6 +8,15 @@
>  Release notes for |yocto-ver| (|yocto-codename|)
>  ------------------------------------------------
> =20
> +This release does have some significant changes which people need to be =
aware
> +of. We have added bitbake-setup and have switched to this as the default=
 way
> +the project is presented to users (e.g. in our documentation and in our
> +automated testing). Existing workflows with other tools such as kas or
> +submodules, or individual repositories remain unchanged. We have stopped
> +updating the poky repository and users will need to switch to the indivi=
dual
> +bitbake, openembedded-core, meta-yocto and yocto-docs repositories inste=
ad
> +though. Please see :yocto_git:`README </poky/tree/README>` for more info=
rmation.

I believe all of this was already addressed in the migration guide
(https://docs.yoctoproject.org/dev/migration-guides/migration-5.3.html),
so this seems redundant? Could we simplify to:

"""
This release does have significant changes which people need to be aware of=
. See
:doc:`/migration-guides/migration-5.3` for more information.
"""

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


