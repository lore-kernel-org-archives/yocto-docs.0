Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A000CD8CBE
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 07:28:40 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73958.1780990116080152703
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 00:28:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=oHErXi8F;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 95F321A37F2
	for <docs@lists.yoctoproject.org>; Tue,  9 Jun 2026 07:28:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6BA775FFC1;
	Tue,  9 Jun 2026 07:28:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2719A106A2AC5;
	Tue,  9 Jun 2026 09:28:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780990114; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vvKk6EoeHQKokotZWVfl6FRZrc/QAZK2bNQImeLzGro=;
	b=oHErXi8FxlV1UWF3hlga46zvrfK8JmmNquTqdQ/dxumWzyDeu/rXG0Uk3MOZlvDlM2vD0K
	6IwqNJT7q7wEhlq7ASl+bNXMJkpTAocGJwsg43s2A5HuUfQ/18TpPhkpTO/eiD3XFSYpJS
	RnuoP3h+0oE56agYpMIaxgBUvUm8yimKwpOzA8S8jP3FicmKxMZeXV+G3am+RnfESVVRv3
	EkWwruSfF1FXAgVWJ++zuPzoETsSxy4ugdyC3r0FCNLiZdlBIDikByjz/hjxDQbidcRAJS
	0CrO9fTlI62jv8KAg6gjVETiSfF9htQxRofxjAQzctIn79F0hIC6dFRH1JmTcA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Paul Barker <paul@pbarker.dev>
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	Marta Rybczynska <marta.rybczynska@ygreky.com>
Subject: Re: [PATCH v2 0/3] Security team documentation updates
Date: Tue,  9 Jun 2026 09:27:03 +0200
Message-ID: <178099000143.200930.191243118455832934.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603-sec-team-v2-0-ee7d2016fbf4@pbarker.dev>
References: <20260603-sec-team-v2-0-ee7d2016fbf4@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 07:28:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9638

Applied, thanks!

[1/3] security-team: Update membership list
      commit: 7ea9d1b37d44d79989c4d9f078f816e3bd21d0ce
[2/3] security-team: Tidy and update section on security team operations
      commit: 70b1e61f9ab548b091a2c4ec5d50cfdd1e2f8f11
[3/3] security-team: Add section on multi-project embargoes
      commit: 6ae978f4c59d737825c83c68ec51201f9fa81260

