Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F300FCCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 11:44:57 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.9295.1761651894761395981
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 04:44:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=EWZJGp9l;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 084044E41392;
	Tue, 28 Oct 2025 11:44:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C8E5D606AB;
	Tue, 28 Oct 2025 11:44:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6FF94102F250E;
	Tue, 28 Oct 2025 12:44:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761651892; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ufCVOgoA6m32e+7Y5j1Iz3Ya6ii81N+gv1RXGyyccXQ=;
	b=EWZJGp9l49lQaidabKSZQxDQkEhg6Am+Ejkp6t7nJhWLLsrCdWtXnFWiT8BJp1xthT8uvd
	gTJS5GAXPM20EvThYLQs4gRPEppiw5gO+217FkuBSqDhBPr8eaEWz7IrBHaLXwcUHyqtPD
	WAgxXjlR0Fmx/+afH+I1ROajJf4TcFsUZq7/U8tLtjUfMu6nTk9xhZSluPl2UCntWLGmxg
	ldZ7gb5QOZ/DSBt4WF2KQqedOq8fA3J2KAqqJNAGAAoaq22Kmbv5FIMRYJIb4UwI6+b0Pm
	2UhK881w1GnTlzx+/Ymjld7tWg4qUCjjO2m8L81OJZaU4jf9Sq4jAPHjClOmqw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Oct 2025 12:44:49 +0100
Message-Id: <DDTXH5FCNZ06.2QT6HN8KPCYED@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] whatever happened with the notion of documenting dynamic
 layers?
References: <ec497032-eb7d-3aaf-ad59-7316b3bd6921@crashcourse.ca>
In-Reply-To: <ec497032-eb7d-3aaf-ad59-7316b3bd6921@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Oct 2025 11:44:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7880

On Tue Oct 28, 2025 at 11:34 AM CET, Robert P. J. Day wrote:
>
>   i recall someone mentioned that dynamic layers are currently not
> documented in the YP docs.

Hi Robert,

I believe you are talking about:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15713

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


