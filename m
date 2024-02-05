Return-Path: <baruch@tkos.co.il>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 150D7C4828D
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 07:46:14 +0000 (UTC)
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by mx.groups.io with SMTP id smtpd.web11.58028.1707119170384126128
 for <docs@lists.yoctoproject.org>;
 Sun, 04 Feb 2024 23:46:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@tkos.co.il header.s=default header.b=V/RnkBqs;
 spf=pass (domain: tkos.co.il, ip: 84.110.109.230, mailfrom: baruch@tkos.co.il)
Received: from tarshish.tkos.co.il (unknown [10.0.8.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.tkos.co.il (Postfix) with ESMTPS id 8D3054406EF;
	Mon,  5 Feb 2024 09:45:40 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1707119140;
	bh=XbZr59DqcZzkZ85W04VmEHoyRIWoWzQ0TmeNmlEK5Pk=;
	h=From:To:Cc:Subject:Date:From;
	b=V/RnkBqsNIjKIp5qUcqxLjhIjyEPHwbPsxRhdHofopjYW9UY5NSpmkO8eNWdpUZz+
	 PvGjApcHUh2JWqW8XJCmfliRe6C1O54yuQQOpbu98Wkl5l5L/mw2NWBve4FtDJvOHf
	 tsvjlfTPhlUhAbkUe/0db+FI8GdlGaZ4B9QMsWL2gMa20Qw+NtnLNCo5RpFMXn8gxK
	 2CLbBgIVyuH/Z3cexaAoq+oC0H4pumpwvdDq51hJ7Bf5m0WkMQS8I4K23aNLVK7Fmc
	 KZd3bWxS0JwLUM3PewX3WZf8WNpB/Dfb1pCWYD64a83EdeGF9mWX0WW/kVm7gQrlPl
	 pI94B/ASFHdgw==
From: Baruch Siach <baruch@tkos.co.il>
To: docs@lists.yoctoproject.org
Cc: Baruch Siach <baruch@tkos.co.il>,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] contributor-guide: fix lore URL
Date: Mon,  5 Feb 2024 09:45:45 +0200
Message-ID: <7542f40a18bc1485daaf503d1ab05019be088142.1707119145.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 05 Feb 2024 07:46:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4808

Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 documentation/contributor-guide/submit-changes.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documen=
tation/contributor-guide/submit-changes.rst
index 95728c25c615..61f3157d602e 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -438,7 +438,7 @@ their e-mail clients will default to including your e=
mail address in the
 conversation anyway.
=20
 Anyway, you'll also be able to access the new messages on mailing list a=
rchives,
-either through a web browser, or for the lists archived on https://lore.=
kernelorg,
+either through a web browser, or for the lists archived on https://lore.=
kernel.org,
 through an individual newsgroup feed or a git repository.
=20
 Sending Patches via Email
--=20
2.43.0


