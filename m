Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87672D116F8
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 08:36:38 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17000.1764578189928629418
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 00:36:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=sp6R8xrp;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 568AD4E419B8;
	Mon,  1 Dec 2025 08:36:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2E328606BB;
	Mon,  1 Dec 2025 08:36:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CBF81119121CA;
	Mon,  1 Dec 2025 09:36:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764578187; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0S0CHFxH15ZU2BvMISkVMrLJslfK7SdKFkZK2IlCfYU=;
	b=sp6R8xrpIWm4FaHvCgUEmM67Jr1pawZ8wrB0CxEi3F2GsyXe3f2GqIM1a2rZBxccve1r+5
	1VuzQj18SNBYYF9NUmBvF3ZPIrGpNuBMn6DlXkl+90uWBJvBwyBYntMM0ljGmd/S7zua4k
	eLzyDUYn/zZgpzcMmxvJVg49pJYf7G6cF/BhZ/keeP0S7ErMU7mIn66VrbD1QtLkuZeH+a
	w0WCOYHv6bukDjHR1GuqvZyfovStbBNBjlOx+N45UtVY+lmWUpI6l9J/efRugZWI6it1A8
	69aZpLcF2ItGws+ZnIUgPWV9LIDkAvF7+BRYp9vC43wLqZ0eHJr07cwxgF6vvQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Quentin Schulz <foss+yocto@0leil.net>
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	"Robert P. J. Day" <rpjday@crashcourse.ca>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH 0/2] make sure Quick Build section and System Requirements are in sync -- cover
Date: Mon,  1 Dec 2025 09:35:52 +0100
Message-ID: <176457799700.63554.12635925224658986035.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251125-quick-start-requirements-common-v1-0-2c872b2fd45f@cherry.de>
References: <20251125-quick-start-requirements-common-v1-0-2c872b2fd45f@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 01 Dec 2025 08:36:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8177


On Tue, 25 Nov 2025 15:52:59 +0100, Quentin Schulz wrote:
> The instructions in the Quick Build section are targeting Ubuntu users
> and must be straightforward to follow, without having to follow a serie=
s
> of link. There is some requirement (specifically locales) that didn't
> make it to the Quick Build section, so let's make sure it is in sync
> with the section in System Requirements by simply moving the whole rST
> content to an include file instead of just the apt instructions.
>=20
> [...]

Applied, thanks!

[1/2] tools: ubuntu_docs: remove duplicate python3-saneyaml
      commit: 3a06fe794fbca96baa470387d82cb7fd6b1af95f
[2/2] make sure Quick Build section and System Requirements are in sync
      commit: 411e8ebcf79d390b557aca3ea39d610cfbd06fc5

Best regards,
--=20
Antonin Godard

