Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E40B3CAC5A7
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 14:30:10 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.13044.1758810604757023407
 for <docs@lists.yoctoproject.org>;
 Thu, 25 Sep 2025 07:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=MWaf9d4o;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 64828C011EF
	for <docs@lists.yoctoproject.org>; Thu, 25 Sep 2025 14:29:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8B8CF6062C;
	Thu, 25 Sep 2025 14:30:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BCEA3102F189D;
	Thu, 25 Sep 2025 16:30:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758810601; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VCNWGNnKBwzz88UqZ0wSpDbAjYp275Sefj3to6ebk/0=;
	b=MWaf9d4ookO88WTfof15I1sJNWGQkE6WgjSOUZORfudJPi7niOsrrIGHoOXhTH9A/dr+9N
	aL28tGpX6GbGDJgPh0g0dy8uMr18rey1sPn2p4rRQ1+WxrWUjZ3ctpFRee0VXm4w1KCxGQ
	EPDCS3gjot23hu5SAuO+SAyPXbA4UeYa0X892r9ENve5E+UV6c/jWbJEvK4qTia2RxuRKB
	HBzT8ql6imrYdEkz+PsneQ/hqQGSL+J08AerUIP+uZ+ToeDu5NbroR9RajCkGWWBU5ku/s
	g5wwjQ1u2oNmwsGdmpW8w8Nc8HLS/GO1lXKZYummYDaHNEvG9PGTUUtkhhgdoQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 25 Sep 2025 16:29:59 +0200
Message-Id: <DD1YBMXM5MUJ.2N2XDSIL5KN6P@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <bhstalel@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs][PATCH 2/2] ref-manual/classes.rst: add diagram for
 classes used by base.bbclass
References: <20250921164306.53501-1-bhstalel@gmail.com>
 <20250921164306.53501-3-bhstalel@gmail.com>
In-Reply-To: <20250921164306.53501-3-bhstalel@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 25 Sep 2025 14:30:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7600

On Sun Sep 21, 2025 at 6:43 PM CEST, BELHADJ SALEM Talel via lists.yoctopro=
ject.org wrote:
> The diagram is created using draw.io, I used it also
> to create the BitBake Tasks Map, and I was informed by
> Michael back then to use Inkscape, but I was not successful
> learning it, and that led to me postponing lot of
> contributions. So, I thought contributing draw.io SVGs
> is better than nothing, one day I will fix them with
> Inkscape.

> Signed-off-by: Talel BELHAJ SALEM <bhstalel@gmail.com>
> ---
>  documentation/ref-manual/classes.rst           |   7 +++++++
>  .../figures/base_bbclass_inherits.png          | Bin 0 -> 168001 bytes
>  .../ref-manual/svg/base_bbclass_inherits.svg   |   4 ++++
>  3 files changed, 11 insertions(+)
>  create mode 100644 documentation/ref-manual/figures/base_bbclass_inherit=
s.png
>  create mode 100644 documentation/ref-manual/svg/base_bbclass_inherits.sv=
g
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
> index 791c6b2ef..703ad98dc 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -191,6 +191,13 @@ The following actions, among others, are handled by =
this class:
>  - Handle the provided license via :term:`LICENSE` and :term:`LIC_FILES_C=
HKSUM` variables
>  - Prepare the native recipe that correspond to the scheme set in :term:`=
SRC_URI`
> =20
> +Besides that, the :ref:`ref-classes-base` class inherits more classes to=
 provide more
> +utilities, set up toolchain variables, add more tasks, and more. The fol=
lowing diagram
> +shows how :ref:`ref-classes-base` is related to other classes:
> +
> +.. image:: figures/base_bbclass_inherits.png

Other places that use SVGs make the following call:

  .. image:: svg/base_bbclass_inherits.*
     :width: 100%

Can you use that instead? It will render the file as non-pixelated in the h=
tml
page, which is nicer.

> +   :align: center

Some comments on the diagram:

- I think it's great, it shows what you described in the the line above, i.=
e.
  the graph of inheritance.

- I'm not sure representing the classes-global/ and classes/ directories ad=
d
  much to the diagram. In fact, I would remove the directories here and jus=
t
  represent the inheritance between classes.

- This class can evolve over time, and maybe more classes will be inherited=
 in
  the future. So I don't think we need to be exhaustive here. Instead I wou=
ld do
  something like:

  base.bbclass --------------------> patch.bbclass
                inherit          |-> staging.bbclass
                                 |-> mirrors.bbclass
                                 |-> utils.bbclass
                                 |-> utility-tasks.bbclass
                                 |-> logging.bbclass
                                 \-> ...

  This is just to give the idea of including the "..." at the end. Users ca=
n read
  the file if they want the exaustive list.

- I would not include the terminal.bbclass inherit. Classes can include oth=
er
  classes but I think the main point of this diagram is to show the basic
  inherits of the base class.

- I like the TOOLCHAIN/TOOLCHAIN_NATIVE mention.

>  .. _ref-classes-bash-completion:
> =20
>  ``bash-completion``
> diff --git a/documentation/ref-manual/figures/base_bbclass_inherits.png b=
/documentation/ref-manual/figures/base_bbclass_inherits.png

No need to include the PNG here. SVGs are automatically converted to PNGs.

[...]
> diff --git a/documentation/ref-manual/svg/base_bbclass_inherits.svg b/doc=
umentation/ref-manual/svg/base_bbclass_inherits.svg
> new file mode 100644
> index 000000000..f223eb4d1
> --- /dev/null
> +++ b/documentation/ref-manual/svg/base_bbclass_inherits.svg
> @@ -0,0 +1,4 @@
> +<?xml version=3D"1.0" encoding=3D"UTF-8"?>
> +<!-- Do not edit this file with editors other than draw.io -->

Hmm... if we really can't open that with Inkscape that's a problem from
maintenance :/ I tried opening it with inkscape and indeed, I can't edit th=
e
text and so on. Maybe there's an option in draw.io for exporting for other
editors? Otherwise sadly we can't merge this, as we wouldn't be able to
maintain it easily.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


