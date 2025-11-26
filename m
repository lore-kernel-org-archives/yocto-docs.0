Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C39AD10F45
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 13:00:26 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12342.1764162019711518702
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Nov 2025 05:00:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=EY3HoA1G;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1842F1A1D79
	for <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 13:00:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E3A3960721;
	Wed, 26 Nov 2025 13:00:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 15436102F08FB;
	Wed, 26 Nov 2025 14:00:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764162017; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=usA/uMVHm2s869Pqer3XUWkgbXkCHrNXaZzBTQsOdPc=;
	b=EY3HoA1GWv5TXHyHOqg14WxL/pHl7wMe040m4yS9WEICBHjd+zanH6EI4N2pj69ymauvuP
	4jJMSPlZgbJnO9v4N6wPHlXPCtLuGe2PcGEinzskWq84lD7EL3xJ4Pq+dhL7VUgJoF/lNu
	KiPMBPGMnNz36sXjzNIGqMSf30wJPpbmyIgyHXdv0VxNGmLphfoZbSQyQ6U3YlPFzB47IK
	cRvSng5hOviXx9vTbbKg0CpN0ZPxc0YB/bTET0va6daizVl8k/mgycLGL82bIhvvBsuzY3
	ygbws29MDJb2JJXXhrpEqI1U/OgvGYzw/WBrcWYXtyuv6AMo8qj7qKNpoVdD5w==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual/layers.rst: document "bitbake-layers show-machines"
Date: Wed, 26 Nov 2025 13:51:31 +0100
Message-ID: <176416145891.617433.17418636093373467925.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cd97575f-dc17-df8f-7d9f-a253df64a09e@crashcourse.ca>
References: <cd97575f-dc17-df8f-7d9f-a253df64a09e@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Nov 2025 13:00:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8137


On Tue, 28 Oct 2025 08:00:51 -0400, Robert P. J. Day wrote:
> The "show-machines" subcommand is not mentioned in the docs; add it.
>=20
>=20

Applied, thanks!

[1/1] dev-manual/layers.rst: document "bitbake-layers show-machines"
      commit: b4320cdc4df08c59a24d5247b3895dd602554fa0

Best regards,
--=20


