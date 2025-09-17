Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60008CAC59A
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 14:14:13 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.24175.1758118447550624835
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Sep 2025 07:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=E0R3hH2Q;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 388F64E40CBF;
	Wed, 17 Sep 2025 14:14:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0FB786063E;
	Wed, 17 Sep 2025 14:14:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 619BD102F1A16;
	Wed, 17 Sep 2025 16:14:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758118445; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=e3G/WRTqoE9t2IWvlxR0XeEM0duZJpvx26XkM9I+zkY=;
	b=E0R3hH2Q9ZKIdr5q4WNWrMLHMimcvVCoLt0hJf49fs/voi6C1BljUdKFiJRqsT2FLtSALq
	+Kgf3LV/mhNLazHqx79dWKJqjpse5k/Yvm76eiOsBgtGu8yiSUe2SOp9vP+896us6v1ooN
	2zo1PbK59Td7ZnmJ7HyQwDAYPfBmEVLg0DAfbgAFMg0h9KiVuKXd7YNPIYZ7QrsBGw0oel
	R18pD+SQXVQb4dwS6WLjestqhS+cV1AFB4h2pbJnDT9geEWlzZt2FaDdcnwTXa5/SZqYKl
	kjUCsp9tWlrR9cTe3MSOzh6LwpJaloiiJaV497CYpObEMUKoYV5AfyJjP+156g==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	chee.yang.lee@intel.com
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] migration-guides: add release notes for 4.0.29
Date: Wed, 17 Sep 2025 16:13:19 +0200
Message-ID: <175811826407.690097.13952362149532207652.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250822040545.120904-1-chee.yang.lee@intel.com>
References: <20250822040545.120904-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 17 Sep 2025 14:14:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7532


On Fri, 22 Aug 2025 12:05:45 +0800, chee.yang.lee@intel.com wrote:
>=20


Applied, thanks!

[1/1] migration-guides: add release notes for 4.0.29
      commit: d3bbfed9cad4cda0960ee0623c728ea2a18e1b29

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

