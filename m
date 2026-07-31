Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 928BDC54F54
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 09:37:21 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3046.1785490632601533698
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jul 2026 02:37:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=azSw3tIe;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EED791A134E;
	Fri, 31 Jul 2026 09:37:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C403F6039A;
	Fri, 31 Jul 2026 09:37:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C96A311C16612;
	Fri, 31 Jul 2026 11:37:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785490630; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7D91orl0qJ4SWysj7Sb3WYtzu+tYZ8MCTSQSiMoe2Rc=;
	b=azSw3tIeWTvTtV3Md7/vx41NrWXTgDt2drcN1i7lMUX4N3E9smZaHLbt+Kj8wN+LZudHJX
	LmJEiYSBHivs+6vaeJT5JHbtUybdoeZZZ2KTMYB491U6vSGj4o/fxk8bDelQfgxrnaMXlf
	zsVg2cT1MbOa7J1OdSGpW08WGcp4zHS8nrijr4i4hjUVFkqoWOHvhL1DE+kScseMrdBay9
	b5FfhyGTLty191S+yj1FK2uQZurC3HQJUJlGt6bbF96bC90xgDvGVf8eycXxbH3B7tn69+
	TdZBlSvzY9RhHvf2baWOEWnLPdpPVHn9LzhD3wZgL+m1tv5ZGSE+DQyDfTGKyA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	niko.mauno@iki.fi
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	quentin.schulz@cherry.de,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: Re: [PATCH] identity-component: Replace unicode with regular ASCII
Date: Fri, 31 Jul 2026 11:36:25 +0200
Message-ID: <178548999941.2379643.2745927469543000647.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728055856.22909-1-niko.mauno@iki.fi>
References: <20260728055856.22909-1-niko.mauno@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:37:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10223

Applied, thanks!

[1/1] identity-component: Replace unicode with regular ASCII
      commit: 47b62537fa3752a7e06fc3b59f9c3f592dda166d

