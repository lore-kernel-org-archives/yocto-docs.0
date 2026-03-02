Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33084E9B356
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 09:54:24 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.157216.1772445259848534097
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 01:54:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=dJa1INGf;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BC929C40F86
	for <docs@lists.yoctoproject.org>; Mon,  2 Mar 2026 09:54:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9903F5FE89;
	Mon,  2 Mar 2026 09:54:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BE6241036954A;
	Mon,  2 Mar 2026 10:54:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772445257; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=slo+kNyJ6OkopNNFrQMA2dTr6hNPPY9xAy+hAgG4Wug=;
	b=dJa1INGfTUhgigwnYdVfk64xpIv9LKEXFMNyPWbSbOqPiZhAzsEuAAKzhJjw3w/EZG4/xw
	u8w4jdmjmYiiXfawJgs8VAej6XVW6wlU7n6McjdORy/6PrcW0X+iw1gcB2T4ER+4WFi2aZ
	NSU0eaOGOG6lkbByVbMBaR1vX83b7j8g9zdyo1CNtxx5RJSJQkdnYUmLzAnKIuYZBTmqGv
	DNv56RrUjJaq9ks8ipn5YSvp+tTYH3DUEJbZ7Th4F7ReOVczp62rZlAJROxYCe+rNMUlYJ
	ASRYWzeGzgBi96wos88RhMkwsIaQS6MvpN/8srCYwvextijVXClve38jQmRjZw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH] tools/containerfiles: fix docker warning
Date: Mon,  2 Mar 2026 10:53:34 +0100
Message-ID: <177244519667.106718.5910475869340484346.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260227-fix-docker-build-warning-v1-1-5557689ebc3e@bootlin.com>
References: <20260227-fix-docker-build-warning-v1-1-5557689ebc3e@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Mar 2026 09:54:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9028

Applied, thanks!

[1/1] tools/containerfiles: fix docker warning
      commit: d97cfeaa55ed42722998d3313c1857aa377f6881

