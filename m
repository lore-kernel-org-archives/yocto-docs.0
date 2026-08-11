Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0088FC5CFCF
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 13:21:38 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54245.1786454495994780173
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 06:21:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=RKqyRJF6;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4083C1A1570;
	Tue, 11 Aug 2026 13:21:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0A2A76033C;
	Tue, 11 Aug 2026 13:21:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D198411C48BD1;
	Tue, 11 Aug 2026 15:21:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786454493; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1FWLmogfDwhnUCK+5QA3DqmyxS51PEU+3GVxKZxkBr4=;
	b=RKqyRJF6OkQM7Kp3ssYVUcqrKWLDpBSLar486UwOwYcFq+Q07J71RYdSxr1005VPwtMcNG
	IskZZVwlhm+bGZe1RUfHSjE5ztBg1QKUwQRMYyIRA8tzg/9TmtpoGBX+xBT205D6rDQNJp
	dqzWwn9Ol6k2ci5ZSURxmIOF1miT4k7Rh4C4nac6ZrQkDzDIzwrbJi66U3ZQqpTyTFyYs2
	6YSmqaXD22gLqn30jSxLsZ0h0HRsamoITmUmnV9yOYHUa5MawNmJ+lO3KDPm/jfFLFbOwc
	q/3WlZuGfxWbNQXAsSHAXGVw8/dftBrI08uB45m6JgR9Xaxh0dANPvr3usgHEQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 15:21:32 +0200
Message-Id: <DKM59K33IO4C.3UQHX3TIMYUFO@bootlin.com>
Subject: Re: [docs] [PATCH 1/2] brief-yoctoprojectqs/index.rst: use pip to
 install bitbake-setup
Cc: <docs@lists.yoctoproject.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <alex.kanavin@gmail.com>
References: <20260811-bitbake-setup-pip-v1-0-0c8b350017e4@bootlin.com>
 <20260811-bitbake-setup-pip-v1-1-0c8b350017e4@bootlin.com>
 <CANNYZj9U1oy3CEAqgPtaOMtB+GPER8B3_Y7XNZyo21BPgAA+_g@mail.gmail.com>
In-Reply-To: <CANNYZj9U1oy3CEAqgPtaOMtB+GPER8B3_Y7XNZyo21BPgAA+_g@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 13:21:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10263

Hi,

On Tue Aug 11, 2026 at 12:22 PM CEST, Alexander Kanavin via lists.yoctoproj=
ect.org wrote:
> On Tue, 11 Aug 2026 at 11:56, Antonin Godard via
> lists.yoctoproject.org
> <antonin.godard=3Dbootlin.com@lists.yoctoproject.org> wrote:
>> -   $ git clone https://git.openembedded.org/bitbake
>> +   $ python3 -m venv --clear ./bitbake-setup-venv
>> +   $ . ./bitbake-setup-venv/bin/activate
>> +   $ pip install bitbake-setup
>
> It would be good to also mention how to update to latest release if
> bitbake-setup is already installed (bitbake-setup will evolve with new
> features and there may be failures due to outdated installations from
> pip):
>
> $ pip install -U bitbake-setup
> (pip does not have a separate command for package updates
> unfortunately, so it's not intuitive).

Hmm, as this is a quick build document, I think most people won't have
bitbake-setup already installed and our instructions show how to install it=
 in a
new virtual environment anyway, however...

[...]
>> +      $ git clone https://git.openembedded.org/bitbake ./bitbake
>> +      $ ./bitbake/bin/bitbake-setup ...
>
> The bitbake-setup chapter in bitbake manual needs similar fixes I think?

...I will mention that in the bitbake user manual, so in a separate patch. =
:)

>> +   The ``bitbake-setup`` tool can also be used from the :term:`BitBake`
>> +   repository directly:
>
> ... is developed and maintained in :term:`BitBake` repository, and so
> can be used directly from there:

Looks, good, will update in v2.

Thanks!
Antonin

