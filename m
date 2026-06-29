Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C19C44500
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:05:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32893.1782720306875238259
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:05:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=jb5k0Buv;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3C8A61A0CBC
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 12DF15FF96;
	Mon, 29 Jun 2026 08:05:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B9447106F1578;
	Mon, 29 Jun 2026 10:05:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720304; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FxpYndoNEEhpebZQ8je1dXqMmiX1MvtEezIX75Fs6zo=;
	b=jb5k0BuvzcImr/NaP9SAR1Rrrlj1sCAvCw2CZ7p+rYWyNGNaxyu+mvjbPx5u22ZwRlnDOs
	ccxLJIjXFmmqcO2yueiqk9Lzc+zLf3ZI9SwA92BOr4vizeayVipT79JyT/FLoiVwlCTAYN
	7fvRgtEl+Z8LC0RkXp2o8pq4Twn3kcjqVgNsm7SJ3fARFXK5vj5+u3TXn0USQ2MGCn/NsG
	zQXbyzewH3VrE0jUEUAID+nSHn+sMO2mytixC5w66RsqfHswYxA6Dxdv7bN2idrnve76I8
	Ca/xbvqQdpcETs3MtdDDYcPLzXU8i4rLinlqD6pAbAzArvenqRCmfqXGMy8cBQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual: use "trade-off" as the noun
Date: Mon, 29 Jun 2026 10:03:12 +0200
Message-ID: <178272012457.45179.9057762196730298481.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <2efccbfb-b6cc-9f10-7fee-abdb2b4c3ee9@crashcourse.ca>
References: <2efccbfb-b6cc-9f10-7fee-abdb2b4c3ee9@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9942

Applied, thanks!

[1/1] dev-manual: use "trade-off" as the noun
      commit: 2921c51cb4a8e9c2923786faa777018b6068caeb

