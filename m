Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3DA0CD5BB7
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 07:07:32 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31340.1779347244779544248
 for <docs@lists.yoctoproject.org>;
 Thu, 21 May 2026 00:07:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=RDE7PM8n;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E15E6C2C64D
	for <docs@lists.yoctoproject.org>; Thu, 21 May 2026 07:08:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E1DA560495;
	Thu, 21 May 2026 07:07:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 80BB0107EA6C9;
	Thu, 21 May 2026 09:07:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779347242; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vmld3Ap3XmkYPx6+CfRpZkhHDzrd1x9IzOGYKImoRko=;
	b=RDE7PM8nBAjjIMDFuz9BPxb7P0416olY9kzL7s9a7IZjTiNC9xCkPIMV0lYdiam0mj4XPz
	rNjCfvlI2opllrmp+5IFC9cM6sYMoB5G5XmTyXBWgnMqhmXMq2kE1gRWpm42COOEZoQXJ+
	KmzaeBFLw/Dn9mKZzHCohVNogF5b3+xt253qOR8QjkDOmCW75tK9AHxUYjrrcnvDO37Tpw
	lPRG2mkr7KL/fYO1AH3A3mWmr4+hc3+JTJyNhIhMrNWagZflHuelU5QF4N3mKorRYirrBF
	UCuE4kVTik1lrTdnilCTYdstgJloXPM1oMLkcvhnH8T0zoCcWnXsTWLkFJR+nw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] overview-manual: fix "checkout" versus "check out"
Date: Thu, 21 May 2026 09:06:25 +0200
Message-ID: <177934712529.33890.1145980622036531271.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <b8e8a936-75cc-4535-1cf5-37e10a5818da@crashcourse.ca>
References: <b8e8a936-75cc-4535-1cf5-37e10a5818da@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 May 2026 07:07:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9505

Applied, thanks!

[1/1] overview-manual: fix "checkout" versus "check out"
      commit: 1d5f0fea4e150be0ef9b10d5733eeaba06c78e6f

