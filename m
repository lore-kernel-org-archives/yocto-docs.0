Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E297C98305
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 12:20:06 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8726.1790079602936387546
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 05:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=LLuZURr8;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 168121A0FCC
	for <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 12:20:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DED12606CA;
	Tue, 22 Sep 2026 12:20:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DA4AC10329111;
	Tue, 22 Sep 2026 14:19:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790079595; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/58gojjONeY2RiAioC8jLfAH38bTj0lGskrtClwRzYE=;
	b=LLuZURr8nwFBFQeVKSD0TqX91Mv4rmFBX4BC2T53uXoXMDAhqYjF1i5Qy+6LRGibDygbo2
	Hexsz4IGlm1iszr0OCmogMvVTpvoTVBlpVEFjqWI/cxuJggwTl/nNZmLR6QYSscO1u2Xws
	y+3yyPX5r/7uO1+F7hO8rSxS1vPgeJIM3VZEPbnDANFzjTiRwyBWEvrje5cpZGEDQ/tpNX
	Y2G6vth1XNhEM8o8P/t/2jpheezgXc+gLQiZLqXKECkBdTRhA5LKx+TgRbDhnzPGHvb4Hh
	KVbhCWQ03pGC9xDjXCTW76wpdnxtAI+DxOL+XQK3+GX/JYTim49QvBFC6trELQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 14:19:54 +0200
Message-Id: <DLLU990210YM.BLR8161B6LGT@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <twoerner@gmail.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 10/10] dev-manual: indent a list continuation so
 the code block ends
References: <20260922020339.481929-1-twoerner@gmail.com>
 <20260922020339.481929-11-twoerner@gmail.com>
In-Reply-To: <20260922020339.481929-11-twoerner@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 12:20:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10581

On Tue Sep 22, 2026 at 4:03 AM CEST, Trevor Woerner via lists.yoctoproject.=
org wrote:
> The second line of the enumerated item is not indented, so the item ends
> after its first line and the "::" opens a literal block at the top level.
> Everything more indented then belongs to it: the assignment, the paragrap=
h
> explaining what packageformat may be, and the note beneath them. They
> render as preformatted text inside the code box, and the note loses its
[...]

Applied to master-next, thanks!

Antonin

