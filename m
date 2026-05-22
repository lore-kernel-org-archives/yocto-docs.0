Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0519CD5BB5
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 14:42:41 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18143.1779460958415197080
 for <docs@lists.yoctoproject.org>;
 Fri, 22 May 2026 07:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=iL79djSM;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6BDE24E42D2A;
	Fri, 22 May 2026 14:42:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 39CB960734;
	Fri, 22 May 2026 14:42:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9476B1081155A;
	Fri, 22 May 2026 16:42:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779460955; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=994awoyNaZEyEDvHEcRLBkeni9SzxRqdya7fYwjdcxQ=;
	b=iL79djSMrJlWJnnuDlBT8qz4c8Im7h9V9vxQ2Ok0r4T/Pj2wrSdxYU0eSPczy3HqyOvmh8
	Kz0NGRhkbcrnJ+CqrCyKJElyGi4qyYgg44NfuV8cXE71YZVjzJhm6oFh3prtBOMMiZ+0hh
	lpuj081s4lyH4ltGwMkuYbw3PUKbn/VMWDz1Fj5Af/EIO6+U4JK9EjCSiKC5w1g1thyLYx
	hVUxcwAE40746CApF8PQJMqAltkAKQrq5/MLhG+UVh346ewt0LctBBlvjg/LAaTVZXKuLf
	w6Msc/qlypQB2O8GiGBHyWET3KnG1/ddaS4fJMKbl0kQr/QQ5QqYY6P9wDRPPQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 May 2026 16:42:33 +0200
Message-Id: <DIPA9GR9CJJ9.C4CB3DR9RSC9@bootlin.com>
Subject: Re: [docs] [PATCH] bsp-guide: simplify example of structure of BSP
 layer
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <ea426fa3-2f18-891b-4e9d-c85ff1f0bcd3@crashcourse.ca>
In-Reply-To: <ea426fa3-2f18-891b-4e9d-c85ff1f0bcd3@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 May 2026 14:42:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9522

Hi,

On Thu May 21, 2026 at 1:50 PM CEST, Robert P. J. Day wrote:
>
> Rather than introduce a generic example of a BSP layer and follow that
> with a link to meta-yocto-bsp, eliminate the middleman and just show a
> clear hierarchical view of the meta-yocto-bsp layer where readers can
> immediately see the point being made.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/bsp-guide/bsp.rst b/documentation/bsp-guide/bs=
p.rst
> index a3b57d29f..1ae9d3353 100644
> --- a/documentation/bsp-guide/bsp.rst
> +++ b/documentation/bsp-guide/bsp.rst
> @@ -1222,22 +1222,28 @@ Project Development Tasks Manual.
>  BSP Machine Configuration Example
>  ---------------------------------
>
> -As mentioned earlier in this section, the existence of a machine
> +As mentioned earlier in this section, the existence of at least one mach=
ine
>  configuration file is what makes a layer a BSP layer as compared to a
>  general or kernel layer.
>
> -There are one or more machine configuration files in the
> -``bsp_layer/conf/machine/`` directory of the layer::
> -
> -   bsp_layer/conf/machine/machine1\.conf
> -   bsp_layer/conf/machine/machine2\.conf
> -   bsp_layer/conf/machine/machine3\.conf
> -   ... more ...
> -
> -For example, the machine configuration file for the `BeagleBone and
> -BeagleBone Black development boards <https://beagleboard.org/bone>`__ is
> -located in :yocto_git:`/meta-yocto/tree/meta-yocto-bsp/conf/machine/beag=
lebone-yocto.conf
> -</meta-yocto/tree/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf>`.
> +As an actual example, consider the relevant content from the
> +:yocto_git:`/meta-yocto/tree/meta-yocto-bsp/conf/
> +</meta-yocto/tree/meta-yocto-bsp/conf/>` directory of the
> +``meta-yocto-bsp`` BSP layer::
> +

You could use '.. code-block:: console' here (without the :: above).

> +   $ tree -F conf
> +   conf/
> +   =E2=94=9C=E2=94=80=E2=94=80 layer.conf
> +   =E2=94=94=E2=94=80=E2=94=80 machine/
> +       =E2=94=9C=E2=94=80=E2=94=80 beaglebone-yocto.conf
> +       =E2=94=9C=E2=94=80=E2=94=80 genericarm64.conf
> +       =E2=94=9C=E2=94=80=E2=94=80 genericx86-64.conf
> +       =E2=94=9C=E2=94=80=E2=94=80 genericx86.conf
> +       =E2=94=94=E2=94=80=E2=94=80 include/
> +           =E2=94=94=E2=94=80=E2=94=80 genericx86-common.inc
> +
> +showing four machine configuration files along with a lower-level
> +tuning configuration file.
>
>  The variables used to configure the machine define machine-specific prop=
erties; for
>  example, machine-dependent packages, machine tunings, the type of kernel


Antonin

