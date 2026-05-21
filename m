Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81CFACD5BAF
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 07:07:32 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31079.1779347245502672902
 for <docs@lists.yoctoproject.org>;
 Thu, 21 May 2026 00:07:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=dO+q0EvL;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D2A271A3659
	for <docs@lists.yoctoproject.org>; Thu, 21 May 2026 07:07:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A744560495;
	Thu, 21 May 2026 07:07:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BFAA4107EA6CA;
	Thu, 21 May 2026 09:07:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779347243; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RAZZmrTdfPfsrenYxyYX1KiZqIzfCZgbWPPFpIW/9gg=;
	b=dO+q0EvLvXQXFV4hCIVtUWNNaxJGGCdaTSaTcbvGRPoD+Sn1Du7fUQaRf2UdmgfhtRc8S1
	9/JWR4K6xYNUloUTZCvijyjuCKMaCbcEIkrymHsmXdcqFkWREb4AUpJJvQUbZYIRzwpQ+z
	oKac65NdlmFBj+4ooCvc1v5fPltVhJLnHjtJe8+xgeAEvrmPkuN9VXE7TsaVnXloj/moTN
	vTY7NW5LPIzxTW714az2hNbzhxC0l630dYjvIdB/OJJAvp/47JJ4lUGbfGKqCMZLIZHtr8
	z+XWG6jPlRWPQq/ykxaKm/8gKO1i8ts1wOv057Jqqh2U7ft5yA2afbN92ppCxg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] Quick Build guide: Various pedantic cleanups
Date: Thu, 21 May 2026 09:06:26 +0200
Message-ID: <177934712492.33890.8976866537187275824.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <c1c86570-49ec-de55-563d-e43722f89573@crashcourse.ca>
References: <c1c86570-49ec-de55-563d-e43722f89573@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 May 2026 07:07:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9506

Applied, thanks!

[1/1] Quick Build guide: Various pedantic cleanups
      commit: aaea33345ad61e747fb79ae05438aa3d3a8b2d07

