Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D15ECFE51E2
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 08:44:10 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16522.1777020241228044275
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 01:44:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=kor87wiT;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AFF371A33E3
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:43:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 81188604EB
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:43:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB81410720740;
	Fri, 24 Apr 2026 10:43:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777020239; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=d1QrPYHZ1zsFPiHNvC9FwjhbzlDxXHsHBXpwdEjMZiI=;
	b=kor87wiThG6+/mT+V2lslX7HP1ol+vkBT/8WFfvjy2Y6aMbnvr/awdjbRUierEfFcPow9M
	Vw5rC506vxlNFPN9K6eAlYg3VNNm1dwNlfh+k9ClNDVbaYU98SpO7bDHH0BeaSfGlCVneM
	rzegJlL9/9VFk6vll/JfRSRdc6dBKT6ncH153ks+BJHP7PelaC2wPc2s/z5j5HUEIi29D7
	kfxkQUfGBJk42Byf3X9ul9SY0WdxbpXvrS/i1IgJdZctDo+XSqqlxVgh7GuBMN9PENA8Bn
	Cp07vksd9k7eLZOkaaKlUPjvLn/sNNHEEiQmPHG3W09I0vDnH69R8X1Sw2ksbg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH RFC] sphinx-static/theme_overrides.css: switch to a fixed width documentation
Date: Fri, 24 Apr 2026 10:42:36 +0200
Message-ID: <177702011519.92831.11099150085964818080.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260202-fixed-width-html-v1-1-e987deb9926d@bootlin.com>
References: <20260202-fixed-width-html-v1-1-e987deb9926d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:44:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9359

Applied, thanks!

[1/1] sphinx-static/theme_overrides.css: switch to a fixed width document=
ation
      commit: 98234c9d3a0846d719630914bea8599da9f51374

