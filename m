Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AACD9EDF020
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 09:07:31 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67938.1770973650080002745
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Feb 2026 01:07:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=iGjIdNG/;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8845F4E40D27;
	Fri, 13 Feb 2026 09:07:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A3E4606CC;
	Fri, 13 Feb 2026 09:07:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A76C102F2783;
	Fri, 13 Feb 2026 10:07:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770973648; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PFrKmeBsKFh2tVIDf9COj7iq7pRy898qpHMPorakH4s=;
	b=iGjIdNG/ESjW9PceU6asOVqJ6SEnIqiAz0KGUrKrvnkXuVv19X9M8MVaCGWwM4Es7MrOFh
	Z/eECFwWrOGiD2PhNVIWGnqx4RvCYf6pbc8avWe/h4mdVvM8Ru86jwIYTOpt3JkJCiKHlq
	Rr9DOcOvqwNKCiQXA77nHNeyDj3cK3y9fs5m9fmx4YioYS8jVQGL6oFNwc8ZzgAdGuz3lw
	AXSKYZSVfq3Y/9zLd+096ys4cIVv3M/vSAkKwl1QOMaLyRt4i+Kqh4igS98ea0DfZxvSDM
	kljg0bjHhy69Tgiv2lwFM0gqsoHd35ny3L063hAjkKxG5JxQ8knfvOfgc7uwMQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	chee.yang.lee@intel.com
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH 1/2] migration-guides: add release notes for 5.3.1
Date: Fri, 13 Feb 2026 10:06:51 +0100
Message-ID: <177097354668.48715.3521695952558302907.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206094146.61584-1-chee.yang.lee@intel.com>
References: <20260206094146.61584-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 13 Feb 2026 09:07:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8912

Applied, thanks!

[1/2] migration-guides: add release notes for 5.3.1
      commit: e95e60ef87a2a32f341fdd7eaa5a69afa528fa94
[2/2] migration-guides: add release notes for 4.0.32
      commit: 095981c08b9d63905472df5d1d60c07af96f0250

