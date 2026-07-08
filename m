Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771C5C43602
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 10:03:53 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4948.1783505030532844552
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Jul 2026 03:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=uXtcSY55;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 05C9AC8F448
	for <docs@lists.yoctoproject.org>; Wed,  8 Jul 2026 10:04:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22F3860337;
	Wed,  8 Jul 2026 10:03:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B542611BC33C8;
	Wed,  8 Jul 2026 12:03:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783505027; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qxDBFdmzRWzUSHxq++wPIlBT/tcUyqgJ1oQHJ6CGvbo=;
	b=uXtcSY55UUalItZltxn7FGIjLV9uBPfWlc51Bq4lzVsomamzcpnzFoSyRCQbVTuT/SZJhJ
	UYu+jGFDGFMb1ETW0jDxs/Q5WMa/A1Hr5ba+6gzypW7rrPgOe/YrpAd027DDULbRLMU/+G
	r3tKVkNLlcraKVXjTh5fsa4Q14uJgccB/0jNnd/iYjAqdgYHTrlU7cwW1RKuDWiHllLemy
	vAppn+7VYLeJUXDeV3ZMNyewAGcuryBc1xv3EEwCMcGCrBK7dIOtoIv/HqO7+KgSvMJt18
	mkmbpDWaO++ALhJuuOlptZU5Ab/ICLsAAWZNuxdFIanx7EvlJhvF1tu6MGgPXg==
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 12:03:45 +0200
Message-Id: <DJT3RLUZ8AQ0.2KURC5T9ECZD1@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH RFC 0/6] Generate documentation links for OE-Core
 (cover letter only)
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20260703-gen-doc-links-v1-0-c2c31c68a0c2@bootlin.com>
 <b50ad5146a74a8a2278ebc5a7e89fc02d7d5f25b.camel@pbarker.dev>
In-Reply-To: <b50ad5146a74a8a2278ebc5a7e89fc02d7d5f25b.camel@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Jul 2026 10:03:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10042

Hi,

On Mon Jul 6, 2026 at 12:02 PM CEST, Paul Barker wrote:
[...]
>
> Hi Antonin,
>
> I think the idea is good! A couple of comments...
>
> I don't think we can set YOCTO_DOCS_DIR by default as there are many
> ways of setting up the source layers without cloning the docs repo. We
> would need a way to set this in toolcfg.conf via bitbake-setup when the
> chosen configuration includes yocto-docs. Then the include directive in
> bitbake.conf should be conditional on YOCTO_DOCS_DIR being set.

So this would require adding specific logic in bitbake-setup, I guess? I.e.=
 make
bitbake-setup detect that we've included the documentation as part of our b=
uild
and set YOCTO_DOCS_DIR appropriately? Is this what you had in mind?

> Also looking at the gen-doc-links script, we should not use a Creative
> Commons license for scripts. We should use MIT or GPL.

Correct, I'll adjust that.

Thanks!
Antonin

