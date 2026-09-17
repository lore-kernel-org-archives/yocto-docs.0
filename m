Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5492C982DA
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 15:30:53 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42509.1789659052491240787
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Sep 2026 08:30:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=IX1qaQr2;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 23EC4C5CD7A;
	Thu, 17 Sep 2026 15:31:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AF4225FAA3;
	Thu, 17 Sep 2026 15:30:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A1E7411C7B064;
	Thu, 17 Sep 2026 17:30:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789659050; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OaQQUPAKNpkvQOQ3S97cOgsOMprSR2ugizsvhnwrWFs=;
	b=IX1qaQr2+2Pri5t7eA8W71EeNi44qJ+da+ZEudgGA+p5mCUAPjyXM3WfqBf+l/3izxJTrL
	lofOhbWPOl4V/SsaSk6ExxQLRt1g7sn/vipAscy9DHvu9VQqrzWbzvME5Oui68xAuDkyjR
	jhF1qeUZ2Dpj655Ze8ekDEqDUh7svc+lKLCV78ZMjCDfop9lhDmpZcbcS+oP0XNIfj5M7p
	S8gGHIjFhJ/0/vUmvkHAW9IhlJD70jQGenp0H6Gs6pj2wnYyVExBT87g4KP6TY9QLVOykQ
	0CRgRKNxiaLGPYxNvofqOT0LH62XkszxCFik4Qs1VHh6dZzbkP4GXXWVPX2t7g==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual: correct OVERRIDES to FILESOVERRIDES for FILESPATH
Date: Thu, 17 Sep 2026 16:52:42 +0200
Message-ID: <178965649656.302216.2882947592754060266.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <d673601a-4878-eda8-d649-b5a29490025d@crashcourse.ca>
References: <d673601a-4878-eda8-d649-b5a29490025d@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 17 Sep 2026 15:30:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10528

Applied to master, thanks!

[1/1] dev-manual: correct OVERRIDES to FILESOVERRIDES for FILESPATH
      https://git.yoctoproject.org/yocto-docs/commit/?id=3Df6f4dbdf2e38

