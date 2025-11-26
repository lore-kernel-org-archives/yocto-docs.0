Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FDC8D10F4B
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 13:00:16 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12337.1764162013639816746
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Nov 2025 05:00:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Twn/ZPs4;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C67BD4E418F6
	for <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 13:00:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9C7A260721;
	Wed, 26 Nov 2025 13:00:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8461E102F08EB;
	Wed, 26 Nov 2025 14:00:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764162011; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/UBT7u32cnGTDTJ3gP+0VXgfhjn/rc0xrbMnUTDBqvg=;
	b=Twn/ZPs4LgSo/wE4MKgmQOZc8k0VDxpiU4pudWjMlrfAX222TqVjYZFj/NUO2swxNpN7dJ
	W4goLlucbiyG1s1b762e0Jb2z1WPjWUaR+1cDt69ohF5RoShq3oRuRXvtFgF/lAHDqmV74
	onBrMgkpifCg4p6DzJaWuX89s4+a9QaGArz1e3qkmk0Fgs5Nok4mQpgFkqIfPPjMJVPIXx
	eY9a4P4HAQ9IgbPWzF1gDo8CaPV2wjVKRhuWjWFNnOO6K6OGWYYy2sJple/MY27T2Zo40z
	SfZk/3Z/lAx9hFW6/6ldwbJKuZWGgbpmH5aGB/d+y0ztFxwQZijw+sTa95U5EQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	daniel.turull@ericsson.com
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2] vulnerabilities: add section for kernel CVEs vulnerabilities
Date: Wed, 26 Nov 2025 13:51:26 +0100
Message-ID: <176416145955.617433.13872531378458739343.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251110084548.3333453-1-daniel.turull@ericsson.com>
References: <20251110084548.3333453-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 13:00:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8132


On Mon, 10 Nov 2025 09:45:48 +0100, daniel.turull@ericsson.com wrote:
> Documentation to include how to use scripts that can help
> with kernel CVEs introduce by:
>=20
> e60b1759c1 improve_kernel_cve_report: add script for postprocesing of k=
ernel CVE data
> 12612e8680 linux/generate-cve-exclusions: use data from CVEProject
>=20
>=20
> [...]

Applied, thanks!

[1/1] vulnerabilities: add section for kernel CVEs vulnerabilities
      commit: 20278cd79d9506fbeb8860ad11f49c71d401f08d

Best regards,
--=20


