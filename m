Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB33DC43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 09:57:25 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.88948.1783072635901042396
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 02:57:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=D7/A/FPY;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8E4BA1A0DD4;
	Fri,  3 Jul 2026 09:57:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6444F60300;
	Fri,  3 Jul 2026 09:57:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8DBC3104C8399;
	Fri,  3 Jul 2026 11:57:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783072633; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8aHGKqNn7M78euvZC4dJq3zcIukcoTi3uH8zhUhV8Dc=;
	b=D7/A/FPYPLJQGnVAVc6QnMQeK952noj7VJEWnYrUujQwDYH6fvNP/4lgDqCcmfJBgEV105
	eUVd61RCPjOvk/ScuhTwfXG8gAQQAVmWjRsd7T0MfM8k+QVV4y2qg1gpduA9BBI4gOh/3M
	3G6yulK7xLj7eCuqZG1SY/PAlDQCpimu2JbNaulWAnDrvhtz3m4k+CNdR9lrJecQ6CM1oI
	CJmZYaxU+kdAwVFZgxYp2k9tl8XtLJei+IcAvP+A3USLVx67K3zfLAyUThvijGHHfBx5mJ
	eMzuw4F6jUuvboKERk+zl7nB5qtcJrdISfXqvDsDfeherE0tQ5L1YosBv0MZtg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 11:57:10 +0200
Message-Id: <DJOUHUD8GFGU.2QBFH3Q1U030A@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Paul Barker"
 <paul@pbarker.dev>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Daniel Ammann" <daniel.ammann@bytesatwork.ch>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 5/7] ref-manual/variables.rst: document the
 LOCALE_UTF8_IS_DEFAULT variable
References: <20260630-sync-documentation-conf-v1-0-da14b40cb515@bootlin.com>
 <20260630-sync-documentation-conf-v1-5-da14b40cb515@bootlin.com>
 <69cf4a3f-6013-460b-924b-a54cef6bc593@bytesatwork.ch>
In-Reply-To: <69cf4a3f-6013-460b-924b-a54cef6bc593@bytesatwork.ch>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Jul 2026 09:57:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10008

Hi Daniel,

On Fri Jul 3, 2026 at 9:59 AM CEST, Daniel Ammann wrote:
[...]
>> +   :term:`LOCALE_UTF8_IS_DEFAULT`
>> +      If set, locale names are renamed such that those lacking an expli=
cit
>> +      encoding (e.g. ``en_US``) will always be UTF-8, and non-UTF-8 enc=
odings
>> +      are renamed to, e.g., ``en_US.ISO-8859-1``. Otherwise, the encodi=
ng is
>> +      specified by `Glibc`'s ``SUPPORTED`` file. This not supported for
>                                                          ^ is

Nice catch, thank you!

@Paul in CC, can you drop this patch when merging the PRs (on master, wryno=
se
and scarthgap)? It is independent from the others. That way I'll be able to
re-send it without this typo (or else I'll send another patch, that's ok to=
o).

Thanks!
Antonin

