Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B62CCF9FA
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 12:30:57 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.14255.1761913853328981147
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Oct 2025 05:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=pGLXyM5G;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5F14AC0E952;
	Fri, 31 Oct 2025 12:30:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DE4A360704;
	Fri, 31 Oct 2025 12:30:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 97E8F118125BC;
	Fri, 31 Oct 2025 13:30:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761913850; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YHQbHlr9xzQqUGuFhk/v+n63bD/JQO+tWDfXaHDvP1I=;
	b=pGLXyM5G2c9zb37dLn6sF5Kchg47rknqOSSUIU+3r2Db6SlWZ97opteO/jFEnU+K/sHJBL
	tRceYdlnlQU23CwIKyvepVYNhRYh7q/bjSfojOh2Jc3lBX7/E47laPjA0keAHDWkA8JROv
	U2/VUCfY39nWMEEWJ6NcyowS5Irez8Lffg135nD5oFXadNM1zhLruzRqf2aQtG3iOxxJaP
	1aXTE/0GbVe/Bd68bUOjOTOqZChURrySKjZfzgFOz+DGQ30ZTDmUSLXO0DdWIga7+DFlxQ
	yFfsTSLlr4LXCkL8arDhPZTIm3YMMGYJGc9LRELhDqQ/b/2FahdjP1ZL3wq/JQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 0/2] Improve uninative class/variables
Date: Fri, 31 Oct 2025 13:30:05 +0100
Message-ID: <176191376969.156612.13980274620144451916.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251006-uninative-class-extend-v1-0-1a9e30e95e8f@bootlin.com>
References: <20251006-uninative-class-extend-v1-0-1a9e30e95e8f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 12:30:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7940


On Mon, 06 Oct 2025 15:03:03 +0200, Antonin Godard wrote:
> After https://lore.kernel.org/r/061e6150ce177221f7b6ee8754b03a20347a92c=
3.camel@linuxfoundation.org.
>=20
>=20

Applied, thanks!

[1/2] ref-manual/variables.rst: document UNINATIVE_URL/CHECKSUM
      commit: 974fe4e1c5db65b462a382e089e016326e7b3f26
[2/2] ref-manual/classes.rst: extend the uninative class documentation
      commit: 68996f0f3bf882714e8d96a0aa7b2492fe16d0c3

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

