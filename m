Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24ABEC44507
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 08:38:50 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9363.1784277521513115021
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Jul 2026 01:38:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=v0zvpTp8;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4C6BB1A1044
	for <docs@lists.yoctoproject.org>; Fri, 17 Jul 2026 08:38:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 229EF60361
	for <docs@lists.yoctoproject.org>; Fri, 17 Jul 2026 08:38:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A2D911BD0109;
	Fri, 17 Jul 2026 10:38:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784277518; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rbnWuwrUhd5FZDNJxYJubwV6XXYGx+nwCWX9/o2oaiY=;
	b=v0zvpTp8qXm9X7CFw9inifcS6wH0QCH5VqjL0jKa7WIzviiWftpNobq4nfHuPKaZZWO9Uc
	Lpz7FxVXKwhVWTd3L8Q5Gv1kzg/lnAkVrCDMFmPRTV9ECkd/bclQ1tvR0JFazEdHqIkLFT
	CWDwmb3pWavTg4lu7dQLNlDfEkNL3Cl+KFFY8NwYbmd1/j8mNBtwf9pMcEfCje6rZqP2v+
	Op8Pajx37dyRFabwvEaW/EM0cVmf5gTZUsfcw+e2uIlhIfYepX+zMTg/Ljfg+l7LDu1pif
	d+aTtrGF3M6FSgCvRRZpzO8S9nDjehr303jKrbzhnmig0nQLV+BpnEh3//L1mQ==
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jul 2026 10:38:37 +0200
Message-Id: <DK0PLBLF0C0D.2L5GC5E385TAL@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Antonin Godard"
 <antonin.godard@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2 3/4] tools: add gen-doc-links to generate
 documentation link flags
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
References: <20260716-gen-doc-links-intersphinx-v2-0-83cb3aef6ff6@bootlin.com> <20260716-gen-doc-links-intersphinx-v2-3-83cb3aef6ff6@bootlin.com>
In-Reply-To: <20260716-gen-doc-links-intersphinx-v2-3-83cb3aef6ff6@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Jul 2026 08:38:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10094

Hi,

On Thu Jul 16, 2026 at 2:18 PM CEST, Antonin Godard via lists.yoctoproject.=
org wrote:
[...]
> +def main():
> +    args =3D parse_arguments()
> +
> +    yocto_docs_dict =3D {}
> +
> +    if not args.yocto_docs_inv.exists():
> +        print(f"yocto-docs inventory not found at {args.yocto_docs_inv},=
 "
> +              "use the --yocto-docs-inv option or set YOCTO_DOCS_INV_PAT=
H "
> +              "in your environment")
> +        sys.exit(0)
> +
> +    if not args.bitbake_inv.exists():
> +        print(f"bitbake inventory not found at {args.yocto_docs_inv}, "
> +              "use the --bitbake-inv option or set BITBAKE_INV_PATH "
> +              "in your environment")

Sorry for the noise, I sent a wrong version of the patch, which shouldn't c=
ontain
this but as the script doesn't read doesn't these env variables. The rest o=
f the
patch is the same so I'll delay sending a v3.

Antonin

