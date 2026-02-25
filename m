Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1094F4BB9E
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 10:51:11 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42760.1772016661086290810
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Feb 2026 02:51:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ExFV9XEc;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 867A7C143FE;
	Wed, 25 Feb 2026 10:51:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8C12E5FDE5;
	Wed, 25 Feb 2026 10:50:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1893210369254;
	Wed, 25 Feb 2026 11:50:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772016658; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=s1GsRXd4eDGOdW1D0XYUQDRaNa67gvZqOnVUzw+x/Hk=;
	b=ExFV9XEcxs2NN8Wlw1nLLh257vmbzLfXlF8yVgTA0SLPIbbXKevWEBoEiPpwWscAn9BvmO
	oHCQJRpwyfNeNXfgtU9diiUYLg5XzEt9jY3oB5s1tbvZnmrc4E0YJRQybZEwbR0jTN741y
	e8nSTXJI65dNmTc3RmcE+iLKSSgnBIaxEDO4QEbnJvDLojsyvGqX1zhVgMw+w8XNOWYwPy
	ohhbQChdrgAcZELQDRsDVOK4JI43Aef1RPYurNoGPeaiwWW/jsW2E2HHiihNRVPlogoC/Q
	4eAvkZQgsja0p8D6aCpMiDWb0g856P5LTGV/GTZY63uvieS7JGL4k2L3sHXr0A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Feb 2026 11:50:56 +0100
Message-Id: <DGNZH9VNHWMR.16IZNV6J43Y9O@bootlin.com>
Subject: Re: [docs] [PATCH v5 2/4] use a venv for installing packages with
 pip
Cc: "Quentin Schulz" <quentin.schulz@cherry.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <foss@0leil.net>, <docs@lists.yoctoproject.org>
References: <20260224-fix-make-multi-target-v5-0-7ebf281618b4@cherry.de>
 <20260224-fix-make-multi-target-v5-2-7ebf281618b4@cherry.de>
In-Reply-To: <20260224-fix-make-multi-target-v5-2-7ebf281618b4@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 25 Feb 2026 10:51:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8983

On Tue Feb 24, 2026 at 5:32 PM CET, Quentin Schulz via lists.yoctoproject.o=
rg wrote:
[...]
> diff --git a/documentation/tools/containerfiles/Containerfile.dnf b/docum=
entation/tools/containerfiles/Containerfile.dnf
> index fd47fde34..12d97ef6c 100644
> --- a/documentation/tools/containerfiles/Containerfile.dnf
> +++ b/documentation/tools/containerfiles/Containerfile.dnf
> @@ -1,6 +1,17 @@
>  ARG ARG_FROM=3Dfedora:40 # default value to avoid warning
>  FROM $ARG_FROM
> =20
> +# RUN . ./yocto-docs-venv/bin/activate doesn't work because env variable=
s set
> +# in RUN don't persist, so set up the virtualenv manually ahead of time.
> +# Unsetting env variables in Containerfile is difficult, so we hope it w=
orks
> +# fine without doing that for PYTHONHOME (see activate script content).
> +# Note that the actual location depends on WORKDIR at this layer in the
> +# container, and it must match the pwd when pip3_docs.sh is run in a lat=
er
> +# layer. This *must* be outside of any mount point otherwise it won't be
> +# available within the container.
> +ENV VIRTUAL_ENV=3D$PWD/yocto-docs-venv

This produces a warning with docker:

 1 warning found (use docker --debug to expand):
 - UndefinedVar: Usage of undefined variable '$PWD' (line 12)

Can be solved by adding:

ARG PWD

above

ENV VIRTUAL_ENV=3D$PWD/yocto-docs-venv

Are you fine with that? I can add the bit manually if so

Antonin

