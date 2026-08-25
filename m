Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E497C61DBE
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 14:53:58 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23879.1787669632965376049
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Aug 2026 07:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=j0Vix/7y;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B7E864E413AC;
	Tue, 25 Aug 2026 14:53:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7DA4E604C4;
	Tue, 25 Aug 2026 14:53:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D83EC11C7A5D8;
	Tue, 25 Aug 2026 16:53:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787669626; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7iR92mWzWpa/hKgt92CX0IMuoi6pOt516IK1qKamvGY=;
	b=j0Vix/7y4mPyv8/fDXLRYu8E2vmMgGsMyEPkzPkX0XnE/H/XWgMDei6ktuZX/uLinmGuNt
	iLbd1kHg0hDFN15OoaMXoFv3o4ISqWPDFTaUGLwwYEylCsF2nv9mJitivbFonX9KJh8SuL
	CgaiarESqze/V78B8kLGxB2FDBYX4i2e5F0oyBTOeKB3Z4VVkt0niuT3VnmpqzAGF7X3+M
	6CC6WBdgHEzTwplCE92lXLf+lHfcNjh/vWtG/TV9jl40+nT0vT3SIZiPLctjNa07e3SES1
	FFZEyVs9K1lLR5oR5083NTtvoNKFDML51wF5aRnFS/EfxXIyfUvzzClg/NtcHQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 16:53:44 +0200
Message-Id: <DKY3ZRZMDMV7.SLUUC9EIHTOS@bootlin.com>
Subject: Re: [docs] [scarthgap][PATCH] ref-manual/classes.rst: document the
 vex class
Cc: "Aleksandar Nikolic" <aleksandar.nikolic@zeiss.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <aleksandar.nikolic010@gmail.com>, <docs@lists.yoctoproject.org>
References: <20260825144520.16267-1-aleksandar.nikolic22@pm.me>
In-Reply-To: <20260825144520.16267-1-aleksandar.nikolic22@pm.me>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Aug 2026 14:53:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10339

Hi,

On Tue Aug 25, 2026 at 4:45 PM CEST, Aleksandar Nikolic via lists.yoctoproj=
ect.org wrote:
> From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
>
> This class has been in OE-Core on Scarthgap for a while but never
> documented in the reference manual. Copy the description from master.

Usually in these situations you would cherry-pick the patch from master wit=
h
`git cherry-pick -x --signoff <commit>`, and send the patch to the list.

I've cherry-picked commit 32cf3414f5ed ("ref-manual: add new vex class") an=
d
applied it to scarthgap-next, thanks for the heads-up!

Antonin

