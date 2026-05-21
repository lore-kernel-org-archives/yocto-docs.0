Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A001CD343F
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 07:07:32 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31081.1779347246848903619
 for <docs@lists.yoctoproject.org>;
 Thu, 21 May 2026 00:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=2aafOeH0;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4D0B64E42D0D;
	Thu, 21 May 2026 07:07:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 227AA60495;
	Thu, 21 May 2026 07:07:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 607EC107EA6C7;
	Thu, 21 May 2026 09:07:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779347244; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YYiL5FmvChl+ft9AsFQRyb9nA1yk6iTiakAiYIU2Gyg=;
	b=2aafOeH09mUFZ94vpOkl2PlREWeF4oyQW06lKtGWpMQMtJLTNe+Vslk0eme9Wik5gyVl9+
	bk+jwQ91O4MZ6O2CA6RQCW+u8U20VOF+MjWKfVYSqPmUIpB5zY84938VER8dBwACH7zzyX
	Gie480VPqRSl/BDyBNcTtGySxVi4oARFFOgZvtxlxFdd7DuGlKZMpdXikvRypFOPd+YS8y
	H5RqUSpJdt+fVRnjCqNQPYX3kcl9whtUNOwEJAvydREcrtPgk++ijFAwUx+54m3vATtaH/
	VUF+mwnGpMkSQwmAsLdgiUcSZtuU7nhWJ2U4QDQPN3J+wrDKX02C56fZBgJskg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] "Transitioning ..." doc: Various pedantic cleanups
Date: Thu, 21 May 2026 09:06:28 +0200
Message-ID: <177934712501.33890.8667578098946602993.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <24eff5f0-982b-fd5a-4483-1d5b7ec40514@crashcourse.ca>
References: <24eff5f0-982b-fd5a-4483-1d5b7ec40514@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 May 2026 07:07:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9508

Applied, thanks!

[1/1] "Transitioning ..." doc: Various pedantic cleanups
      commit: 801f719458d0d9670debad4ddc379e3ade4d85f9

