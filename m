Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C68CC79FA9
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 08:31:27 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30387.1788769886272882338
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Sep 2026 01:31:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=B2yy1gMh;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 996F91A185C;
	Mon,  7 Sep 2026 08:31:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6EDD860383;
	Mon,  7 Sep 2026 08:31:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BDD8C11C7AF21;
	Mon,  7 Sep 2026 10:31:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788769884; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Qm5domICkHbQoyJFqhhdb4LidfeJ+y9zZRmS4Kwr/cU=;
	b=B2yy1gMhdc3uO0QIDkb1CqOoq3ce2WEXJ2Jf1i1r5CbymrrXgj30YivXaSvRkZlmpOuMYJ
	8D+CtsMOIM2kEE+GmI54vTAMwpIlXZ9oVm4lqwlVYdDu7IrBRvzbFqWix+dNJIv4a+RCW8
	ZYTjLSeGtvakpMQhQZdIQMM+C9q6P/O4l8nxNAFKRcuEHu1YI65DoNVSxNep0+1aGe2Ggc
	1xUdjMyhMvqwIyju80xpQADz6rWxXIkMVT9FsFT34nMLP/3dO5TWQ/3UmmkFW41NLxtow4
	L8Tbi8qojrgOmwxF61QvQHeiv80BUZjU+wcO7ETxVaXzTUVe4uSaS0psi650aA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Trevor Woerner <twoerner@gmail.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] docs: state the language of nine literal blocks explicitly
Date: Mon,  7 Sep 2026 10:30:26 +0200
Message-ID: <178876977245.61738.908015604673809004.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826013018.2673213-1-twoerner@gmail.com>
References: <20260826013018.2673213-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 07 Sep 2026 08:31:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10444

Applied, thanks!

[1/1] docs: state the language of nine literal blocks explicitly
      commit: 9437982143f2f6bcf521841c02559ab4331aae6b

