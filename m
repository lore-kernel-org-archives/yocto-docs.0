Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF88CC6B34
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 09:57:48 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35790.1792058260102836294
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Oct 2026 02:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ZiHCQ8YB;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D18BC1A1234
	for <docs@lists.yoctoproject.org>; Thu, 15 Oct 2026 09:57:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9ED7960360;
	Thu, 15 Oct 2026 09:57:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0B96110328BC6;
	Thu, 15 Oct 2026 11:57:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792058257; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nqj74b8YuGe4fEI7bVC0i6lexh73FUMXo+UY/RJ6b+Y=;
	b=ZiHCQ8YBEb+/CNnbdiG2tKevOFhJ3DZt1cuR5TBf/0Rw5clAwbLtsUvy6RbTcTAUA8yLUT
	tlFqlKv8Hin9nIHOPZEeBDGVUCdbhKXkKHicC+68Z1mhiHM/xRWSWYFLqXfKxIGDZW5Co7
	ybPXUefyrrIL6sUo9q7CYWwRuZ7U++MTyRF4bMTyk1oXbsw160/LC+1yGGgwpvqzu3sRvL
	V2+fdVoffQwgysfi2q5RshyvPZJt8IumevTH4hxJWArir6M0HA0smilbDqpG5qFapGrxgL
	Cg36TTgeB44emgypBwlEDZDgIdbZ5NCrCXpiFFY+c6TfePmQMcnoD891xfOtaQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 11:57:35 +0200
Message-Id: <DM5BMT79952L.281463MGN52YL@bootlin.com>
Subject: Re: [docs] [PATCH] ref-manual: add a terms entry for Wic
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <37230285-e554-fadb-1b33-b5748362f710@crashcourse.ca>
In-Reply-To: <37230285-e554-fadb-1b33-b5748362f710@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 15 Oct 2026 09:57:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10674

Hi,

On Thu Oct 1, 2026 at 12:51 PM CEST, Robert P. J. Day wrote:
>
> Add a short entry for Wic to the reference manual in order to later
> refer to it from other places in the docs.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

Looks good, thanks! Could you follow-up with a patch that replaces wic
occurrences in the docs by this term?

Antonin

