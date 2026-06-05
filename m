Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36397CD6E7D
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 14:18:23 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9117.1780669100730659549
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 07:18:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mdXd8lqk;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3AA5E1A092C
	for <docs@lists.yoctoproject.org>; Fri,  5 Jun 2026 14:18:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 094535FED1;
	Fri,  5 Jun 2026 14:18:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7BCB7106A2480;
	Fri,  5 Jun 2026 16:18:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780669098; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EM7cQ54R86B7aeStpP2kcnx/CYnGyJmIOSY+DwL7QXg=;
	b=mdXd8lqkqCGfnZB68idvu5NIHYRrFoJKK23+zH0IldLVY5Og1U9O3wMV3y1ubwuybFd6nM
	RDIFyi6FT02w3d3lUECa7AUU8rok/cCk1MiWQlfcANV45KHPoqSNGJZaQMJuuDGP+DPl0W
	BvPRU//hqmzuJKM5DwnmzbZBkQBjv7dpWXeTzUEdZz/RPL7g1FslZOLu8PFZYLMC/EvSyb
	SdHTvdPzzyl3+xZ9WG1Mpv/hMno9V2u4CLBnwj+8QQT2alR+QE3lZaIVAROzRzznP4RWSx
	MwFF3DyKlrl9kBat2g5xZ60ICy9ibsq/K75VxdS4dUb5UPcndQWW5MZmfno31A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Jun 2026 16:18:17 +0200
Message-Id: <DJ16III1L1GN.2O92K0NWMB5RE@bootlin.com>
To: <chee.yang.lee@intel.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] migration-guide: add release notes for 5.0.18
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20260605102453.2102163-1-chee.yang.lee@intel.com>
In-Reply-To: <20260605102453.2102163-1-chee.yang.lee@intel.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 14:18:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9608

Hi,

How are there so many new CVE status updates for the kernel? Is it linked t=
o a
recent change on Scarthgap? Could we mention it in the release notes? This =
seems
a bit out of the ordinary.

Antonin

