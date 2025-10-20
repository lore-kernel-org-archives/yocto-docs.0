Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2156CCD1AA
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 08:53:05 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.13499.1760950383552393311
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Oct 2025 01:53:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=cGF482lu;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4350E1A1538
	for <docs@lists.yoctoproject.org>; Mon, 20 Oct 2025 08:53:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 18B32606D5;
	Mon, 20 Oct 2025 08:53:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7CF49102F23A7;
	Mon, 20 Oct 2025 10:52:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760950377; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OgzgOvdqfHGbu05Ogfxp2ikXdsZQ7gSX8c7xB7NDUwM=;
	b=cGF482luiADd8rOpiiJBDhzP5YagDCf3HNuOCE/3Zj85IKAybKe9wWPBbdys19v6VQflO/
	zOs/P9fmb8ylV72y8loM9Dt6y9KPgeLvXu31zboLfQ1TQS/7mOtIkYgMaE8aEJmZX3aOw6
	14/OVyvmBLBcaPldW6DM1fpEfrFUjj9uFrhpj2mWSzC9hpWa2//z5lQB6jqxhUHrhl7tg1
	hhf0laiENRLhP52fzRSrGIezcQCppvm8sDeb5dx3YECCev557OqJZDa3O+2GVsZsayONvD
	QlfpgUBX1xZLXAmtvOq3Elw/3cxW7K0N3CEIy7JH0VHeZB1IDk9Vd+Gx7QNR7g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Oct 2025 10:52:55 +0200
Message-Id: <DDN0T6RTSU01.2DU8AYQ5F6ZRW@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 17/17] migration-guides/release-notes-5.3:
 updates
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
References: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com> <20251016-release-note-5-3-second-hunk-v1-17-20f21db1f93c@bootlin.com> <368a4429-8ba5-4c93-b855-18c80d323a73@cherry.de>
In-Reply-To: <368a4429-8ba5-4c93-b855-18c80d323a73@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Oct 2025 08:53:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7754

On Thu Oct 16, 2025 at 1:02 PM CEST, Quentin Schulz via lists.yoctoproject.=
org wrote:
> Hi Antonin,
>
> Didn't go through the whole patch, but...
>
> On 10/16/25 10:54 AM, Antonin Godard via lists.yoctoproject.org wrote:
> [...]
>> @@ -147,7 +156,9 @@ Supported distributions
>>   Compared to the previous releases, running BitBake is supported on new
>>   GNU/Linux distributions:
>>  =20
>> --  XXX
>> +-  Debian 13 (Trixie)
>> +-  Fedora 42
>> +-  Ubuntu 25.04
>>  =20
>>   On the other hand, some earlier distributions are no longer supported:
>>  =20
>
> Weren't we supposed to remove support for Bullseye?

Yes, but is is still part of poky.conf [1] and running on the Autobuilder, =
I
don't really know when that'll change but I'll keep an eye on it (I've been
holding on your docs patch for that reason :)).

[1]: https://git.yoctoproject.org/meta-yocto/tree/meta-poky/conf/distro/pok=
y.conf?id=3Dfe65e142d0d9ba0e51ff9175ffa82e902f982a20#n33

> [...]
>>  =20
>> @@ -206,6 +226,8 @@ Removed :term:`PACKAGECONFIG` entries
>>  =20
>>   -  ``mesa``: ``kmsro``, ``osmesa``, ``xa``
>>  =20
>> +-  ``systemd``: ``dbus``
>> +
>>   Removed classes
>>   ~~~~~~~~~~~~~~~
>>  =20
>> @@ -269,4 +291,22 @@ Miscellaneous changes
>>   -  ``xserver-xorg``: remove sub-package ``${PN}-xwayland``, as ``xwayl=
and`` is
>>      now its own recipe.
>>  =20
>> --  The Wic-specific option ``--extra-space`` has been renamed to ``--ex=
tra-filesystem-space``.
>> \ No newline at end of file
>> +-  ``gdk-pixbuf``: drop the ``GDK_PIXBUF_LOADERS`` variable, which was =
part of
>> +   the recipe's :term:`PACKAGECONFIG`. Instead the :term:`PACKAGECONFIG=
` can be
>> +   modified directly to achieve the same result.
>> +
>> +-  Remove the ``meta/conf/distro/include/distro_alias.inc`` include fil=
e,
>> +   which associated a recipe name to one or more Distribution package n=
ame.
>> +   This file is not used and maintained anymore.
>> +
>> +-  Remove the ``nghttp2-proxy`` package from the ``nghttp2`` recipe as =
the
>> +   ``nghttp2-proxy`` package became empty after an upgrade that makes i=
t a
>> +   library recipe only (due to
>> +   :term:`EXTRA_OEMAKE` containing ``-DENABLE_APP=3DOFF`` by default in=
 the
>> +   recipe).
>> +
>> +-  Remove the ``util-linux-fcntl-lock`` package (in the ``util-linux`` =
recipe) as
>> +   util-linux now supports the ``--fcntl`` flag for the ``flock`` comma=
nd.
>> +
>> +   Recipes currently using the ``fcntl-lock`` command should replace th=
ese by
>> +   ``flock --fcntl``.
>
> Would suggest starting the list items with "Removed".
>
>> diff --git a/documentation/migration-guides/release-notes-5.3.rst b/docu=
mentation/migration-guides/release-notes-5.3.rst
>> index 417087e35..57f50f4e1 100644
>> --- a/documentation/migration-guides/release-notes-5.3.rst
>> +++ b/documentation/migration-guides/release-notes-5.3.rst
>> @@ -11,10 +11,21 @@ Release notes for |yocto-ver| (|yocto-codename|)
>>   New Features / Enhancements in |yocto-ver|
>>   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>  =20
>> --  Linux kernel XXX, gcc 15, glibc XXX, LLVM XXX, and over XXX other
>> +-  Linux kernel 6.16, gcc 15, glibc 2.42, LLVM 21.1.1, and over 300 oth=
er
>>      recipe upgrades.
>>  =20
>> --  Minimum Python version required on the host: XXX.
>> +-  Minimum Python version required on the host: 3.9.
>> +
>> +-  Host requirements changes:
>> +
>> +   -  The minimum disk space requirement is now 140Gbytes (previously 9=
0Gbytes).
>> +
>> +   -  The minimum RAM requirement is now 32Gbytes (previously 8Gbytes).
>> +
>
> It's time I stop building on my laptop then :)

Haha, maybe I should add "suggested" minimum RAM requirement.

>> @@ -159,6 +223,16 @@ New Features / Enhancements in |yocto-ver|
>>         deployed filenames. Users can now override :term:`UBOOT_VERSION`=
 to
>>         changes the output filenames.
>>  =20
>> +   -  The :term:`FIT_LINUX_BIN` variable which specifies the path to th=
e Linux
>> +      Kernel binary in the context of the :ref:`ref-classes-kernel-fit-=
image`
>> +      class. Setting the variable to an empty string allows use cases w=
here the
>> +      kernel binary is not included in the FIT image itself.
>> +
>
> See feedback on an earlier patch, this is currently incorrect.

Yes thanks, Adrian has also sent a patch on this, I'm also waiting for his
feedback.

Thanks for the reviews as always! :)

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


