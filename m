Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93EB2CD8CAD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 07:40:32 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74083.1780990825965865717
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 00:40:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NmL+9R2p;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 155F7C4FED6
	for <docs@lists.yoctoproject.org>; Tue,  9 Jun 2026 07:40:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B14655FFC1;
	Tue,  9 Jun 2026 07:40:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 73A3D106A2AC9;
	Tue,  9 Jun 2026 09:40:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780990823; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rHMBuSt5tBedhvoQrcLMkyiO1o9U9Qw82rtmq+3p4L8=;
	b=NmL+9R2p8dK9ZJMZlL3bpMvw79QIuHQVY7a2+Exe59tjhGWTwhHukMaIANqubxsE1q+U2O
	Fc6Nl+7HXzaEzwbSyBq7ngvARgAyNdR0WeTxJSQvHVMddPQTbIUhX0X5YAcy/O8DUhra0U
	KsQi/sstrD5cW6A4XA07y75pRRvQAyHTzdcStyoZ0bC3qN9KnR91wLecLlOHx78HmQsNWW
	1hyEPANaurWSVlVhlflROXiQuWuxeDQUM5bIkBcKT0St2NWqUPv5Ol2wONXrC0AiHP0MbX
	rrVQkptxIav2tTado6c4YmC/6qA58Grm2LLhSEE61VccpSa64lhFsBx/N1NQ/A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 09:40:21 +0200
Message-Id: <DJ4CK0FASR1V.35G76W8TPEQN4@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2] ref-manual: clarify that PACKAGE_EXCLUDE
 supports DEB packaging
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <3faa7374-9428-5882-2862-861454dd0b49@crashcourse.ca>
In-Reply-To: <3faa7374-9428-5882-2862-861454dd0b49@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 07:40:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9659

Hi,

On Fri May 22, 2026 at 6:18 PM CEST, Robert P. J. Day wrote:
>
> As an accompaniment to earlier commit
> 0d05dedd62a6d4c726f120a23654ede1f0b23d8e, correct that the
> PACKAGE_EXCLUDE variable supports the DEB packaging backend.

I also noticed that NO_RECOMMENDATIONS has the same sentence (DEB is not
supported), which I doubt now considering this patch and the previous. You =
think
you could also test whether DEB still has this limitation for
NO_RECOMMENDATIONS?

Antonin

