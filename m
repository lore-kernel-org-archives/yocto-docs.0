Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED82CCD4F3C
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 07:07:21 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31338.1779347239874116524
 for <docs@lists.yoctoproject.org>;
 Thu, 21 May 2026 00:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=eXe3vkf9;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 518C54E42D0D;
	Thu, 21 May 2026 07:07:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1F8B060495;
	Thu, 21 May 2026 07:07:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7F52107EA6C4;
	Thu, 21 May 2026 09:07:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779347237; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+O38JP/ipzy4CQoitCxEe5cu8uKnp1PB8E3PtT/feXg=;
	b=eXe3vkf9GThTWoZHwwc06n0iu23X3yHV+sh2/1x6wD/ttj9YRoQ2057DrO1yBR19wZOb5u
	8OlOWR3a/WlZ1ugs6CIFGa7syxww0ic0W/a6PnWveY3wsrgs+T3PPOLCVJ3xVXe72cqNsZ
	pZYdMSdQAqW5e1HKpZpe+3MXGX0wUrCrC48vYV682tOceAPqYJ9CLFQpHvTm8aQ6z75816
	eva+GYPjxMKv10JiVRMAOMoYmZCQLhMfImhR4F84ltI06AwJS7oWxsyXnqZYsHGSowM5Sa
	6Gz5zKKxHic7MxuDEKLcEmGziXxmSaLL2VJ8HodKCLaMAK9GMqsAtKuST+VR5w==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Minwoo Choi <mw.choi@telica.co.kr>
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	quentin.schulz@cherry.de
Subject: Re: [PATCH v4] ref-manual/variables: document the 'dynamic layer' concept
Date: Thu, 21 May 2026 09:06:21 +0200
Message-ID: <177934712542.33890.17262156114712779308.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518213758.2420-1-mw.choi@telica.co.kr>
References: <20260518213758.2420-1-mw.choi@telica.co.kr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 May 2026 07:07:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9501

Applied, thanks!

[1/1] ref-manual/variables: document the 'dynamic layer' concept
      commit: a490142fdd3dfbb94126dafa8505d53e67c77811

