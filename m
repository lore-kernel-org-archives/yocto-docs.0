Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B41C79F9F
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 08:31:26 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30382.1788769879909551236
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Sep 2026 01:31:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=ADetPpsa;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1F7C24E41565
	for <docs@lists.yoctoproject.org>; Mon,  7 Sep 2026 08:31:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E2D6D60383;
	Mon,  7 Sep 2026 08:31:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5069A11C79353;
	Mon,  7 Sep 2026 10:31:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788769877; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hSWI+MskMgR/0XpIQKXpfZRf6gkubFtUR9zb0bTyGbI=;
	b=ADetPpsaCeRvGu6qSYw93PJrGCYMAWZge1wwkVtefuYv+qRUEACFrfQvzzO8FBW+vEit7W
	8ksQoPVYH2uNm5Qq5FciZzNYswFjBCZ09Z+wRHls2tC/Tmxb8NaMWmgfdYM/XmXSQtx9qj
	bY1RxQqEez6eSwV0Zj/b7QjII+Nk7cBZtvt0C8pdywiNxtmz3fkT5T87AYGCPZdZ25LpBA
	F5iFLKD+fF2wOOCHuxwoWbts4LF+nEX1CP3wL53DE4+HKWxXpBK61F+JfUf0V2K6h2sN53
	ZrSgi/+IH0baoKqWc5ZGa9UfJngnEqFRd8Y3ZcI2rd+ij3uJ0lkb5UqcSEaAdA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] README: Correct capitalization, "Docbook" to "DocBook"
Date: Mon,  7 Sep 2026 10:30:24 +0200
Message-ID: <178876977234.61738.17217922291587119831.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <9134188e-15a1-7164-2038-898a9d686879@crashcourse.ca>
References: <9134188e-15a1-7164-2038-898a9d686879@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 07 Sep 2026 08:31:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10442

Applied, thanks!

[1/1] README: Correct capitalization, "Docbook" to "DocBook"
      commit: c209bb1732b17124a31daeefcd964bbaab030198

