Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6700C982DB
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 15:30:54 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42792.1789659053377651773
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Sep 2026 08:30:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=mjdmZX+8;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8A4B31A0936;
	Thu, 17 Sep 2026 15:30:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5839B5FAA3;
	Thu, 17 Sep 2026 15:30:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 988F711C7B08E;
	Thu, 17 Sep 2026 17:30:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789659050; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=X71V6S6bKKZzmLu7NLjht2/OMwxwfBa6Ajb1JVnnEQQ=;
	b=mjdmZX+83RNxT1CdArpSXjmvOuMr+IZolT2zL3S7FjNVeJlQsb/muXmAnKT/1veg+UDhjv
	9Fw0ZEn93xWC5GuYSvh07fMc9OYiM1iynC4OsSDgvDYVyt/GxRYwmNoDo0xGw6Du+rT4Ep
	E9ykvoQuJ+aRmpfN367FiMjbk/FSsVD39/jm9dNN66d9TvIbXpbIONBSablnYrVlizQGhD
	hUjXP+QUX5R9zrV8RcTUSSgUWII9ZqZHaGW13TMhqG7u9MBAbW1BOxtHIVFcRRZe9SYOcF
	5ti26N0P1wzJxne7dHXTz5kiGnkpr6JmX1q6FDd5NvBX/FWwaZ58M/X1CWFp3g==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual: drop link to out-of-date wiki page
Date: Thu, 17 Sep 2026 16:52:43 +0200
Message-ID: <178965649641.302216.12959476209277696069.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cf76dd2f-7c9f-54b8-ed2f-78d38b629e97@crashcourse.ca>
References: <cf76dd2f-7c9f-54b8-ed2f-78d38b629e97@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 17 Sep 2026 15:30:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10529

Applied to master, thanks!

[1/1] dev-manual: drop link to out-of-date wiki page
      https://git.yoctoproject.org/yocto-docs/commit/?id=3D9944508e63ef

