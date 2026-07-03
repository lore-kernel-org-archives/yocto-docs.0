Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA53C44506
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 11:45:11 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91457.1783079104728375853
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 04:45:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=QHC9IBfB;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CB896C49F4C
	for <docs@lists.yoctoproject.org>; Fri,  3 Jul 2026 11:45:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 10FAA60300;
	Fri,  3 Jul 2026 11:45:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E732A104C949F;
	Fri,  3 Jul 2026 13:45:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783079102; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nVLXFaoKEOV0BTMV6X/01OQJ2PyxSQd4pz3iICJ+lxE=;
	b=QHC9IBfBkiYS3Xj2ioswei/T0Jk2HJqPatutXCkiAu+XaKz+e8P5zNkF8RerzQVdgsW8Bw
	3tZfFcernJBbV6555kgQYHo3qmA9uD/Eaga8A8raQcj1apVhPI1GEsMUyIzmXMlkdYAIPJ
	erFODsEJe46QBh0ww9Dw8lyCyBTRp5aK5yyip/y2UYjRniNMVepzt1JOXbOL9vPz/LbRYk
	A0qWhvlc2dfCFwUY7OynVO/3a3p0u+FmpYnh21MFo4z9IR1oNoOArgM8nOt+Zhy+FHhfex
	S9MUOPtE6JHsyf7cukfX0GeHa5je+UuXsoNOcHgMBbRrINlzGVuTzFTnjx/3xQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual: update bmaptool section, refer to "bmaptool" package
Date: Fri,  3 Jul 2026 13:43:38 +0200
Message-ID: <178307887489.248663.13131378802644264452.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <b3901bb2-dbcc-3145-caec-c2dfb87f5dc9@crashcourse.ca>
References: <b3901bb2-dbcc-3145-caec-c2dfb87f5dc9@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Jul 2026 11:45:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10025

Applied, thanks!

[1/1] dev-manual: update bmaptool section, refer to "bmaptool" package
      commit: a24270e53d98002fd8b2811d1367df34cd78d4ca

