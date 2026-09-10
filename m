Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B60C7C79F9F
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 14:48:35 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16081.1789051706608749030
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Sep 2026 07:48:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=afvFGX5U;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8F597C653E5
	for <docs@lists.yoctoproject.org>; Thu, 10 Sep 2026 14:49:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 364075FA2F;
	Thu, 10 Sep 2026 14:48:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C79111C7926E;
	Thu, 10 Sep 2026 16:48:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789051703; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=57iXPDywua/3JRJXp8tAQD4FNTvkuqfAzkxGBqZUIGI=;
	b=afvFGX5UNdRsShlMJOfFY3QSNIj/qTjiQrLICYm3VojW6EB5WU0IElF7W2gI9LsPJTTj4n
	k0e3rnVsZV0P0YLkGfjD8FC7OIA6WYYdT6MQie5OTwyglV4RExJ41nEIUceKmna/NbYLg4
	sMTHulPQkDFoSLpaQI/lQXnC9dQr8gxof3y/v4f9LnIcnB7hKgtVam9BYWuz9cwXd9nvWY
	HDsAI17bMwBgrT+ZIczhqBZXdudxRK7rKDVpOePT/v4YPpqvPFxDpjsbxgNa9ids70Cx/8
	K5j1LbUmkB4sVZ7QVWR7re05bWRtqE7oCl2uWdmMy1DQP5jjQH1r4xbtnu9w7A==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org, 
 Andrei Lalaev <andrei.lalaev@anton-paar.com>
In-Reply-To: <20260910-master-v1-1-7bf67b4fbebd@anton-paar.com>
References: <20260910-master-v1-1-7bf67b4fbebd@anton-paar.com>
Subject: Re: [PATCH RESEND] ref-manual: update
 DEBUG_OPTIMIZATION/FULL_OPTIMIZATION
Message-Id: <178905144273.19748.7996237682429705414.b4-ty@b4>
Date: Thu, 10 Sep 2026 16:44:02 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=169;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=AHXhFEEbLzVUVflEcmv3OrLtbjyi1hP64IMGb2BPxhw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqosM1O+5E5cRL+SspfvTzGO6cwoArEP64C152+
 EpXwW3R22iJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaqLDNQAKCRDRgEFAKaOo
 NsneEACAFwstczcuSctkb5CYK4u38M4HDP38z8wEnOIWQ/CErrsQW9urkAH+MkrUHVQlOAf0Iij
 an5xIuP/8j8QOQFAn9v2gww7Hs8MIjJUUFXb7/Kb/ozqdjAWKpP/XcgZ/xgDaIDmeZbp8a7qcMw
 5engOTRu33LqEu05u46uxCTjd1o0v21PRjaMY54efPHvYIqZ0zVmRGj6yU+knGZaO4vVQKVPmfi
 XZGjl19QK3yBB/8p1+y2TqN7DMJ2kiQbA1Zk+NlX/PbHJAdDZ7sdMJZ0Sune+Jh4JS3p/XuH4GF
 3lPWq04fR0WX/bfe44vkl3CWvI1WpzBPnSKYoDPV7BnyvBvxz9zgpmbCUXNbNSbqlUrUgWuws1K
 bUBku+klHqZRH0ubDH0AmN77drM6yWCZ72Ic4NJ6rpm+Ov/u1NQasoOBdAxaKArg7/rtQtyORJ0
 0rfrOfznculiVkmEFyItsvpyZCTDAMxJCt37c5jtu8xiKzdSib8AMUkeQR8dP4u6xrsD3pKknn5
 uOc8KT+TdVWtYOhxweHhNvdbZdBzxGL49ijI6vIIRZhiht4wKiKS8b8n6CX8PV0xuKOpXxZ+Hd0
 EmT9vxnFTpiDBgJCtCtNC2MhMakrXde1Via9vV7S4DVdQ+DN1Js1uJkx2/K+Q5AFNEEKtu9xBHo
 7l9EbznIV+ZSQHg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Sep 2026 14:48:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10449

Applied to master-next, thanks!

[1/1] ref-manual: update DEBUG_OPTIMIZATION/FULL_OPTIMIZATION
      https://git.yoctoproject.org/yocto-docs/commit/?id=091c7f30110c


