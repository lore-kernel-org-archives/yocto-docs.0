Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60DB7CE7AB0
	for <webhook@archiver.kernel.org>; Mon,  9 Sep 2024 07:17:12 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.47267.1725866229113047954
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Sep 2024 00:17:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=F1wvEopW;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C63311C000A;
	Mon,  9 Sep 2024 07:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725866227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=houMVE2RRzEWMljOSwnoXPxfnTsHVK7crrhKPk9/HrA=;
	b=F1wvEopWrnYPNjjmipHGlIJbLnlRhF41CNKJVnbtdNZU3AeO0eAuJQyGuutxM+nEVO6Q+Q
	vC2RmjSi23zTHHXTkKaX6+CIcb+Uc2Xe0aoeRlG5LXFWK9L+KgxerHgO2kkFP+JLymiWp8
	qoVJeXchEvE3c164Ws4gbqcrkValfzZS+lbgajXxB1zzxRsGeKG/d7OP6lktStkGZzdLnO
	T2FR/BJnchVfrEG4torRMG6ogQDCD6kVoz52ZCDuvQi/Hjp627ZHdPFfdlVq1rxSQ0K967
	vJufxR2IkiuVnn6OWB9nPPGf6oDa5+6cxXJ63W1vCjRIFvaZkZZUiU7xdafSPQ==
Date: Mon, 9 Sep 2024 09:17:06 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: docs@lists.yoctoproject.org
Subject: [master] Pull request
Message-ID: <202409090717061bb912a6@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 09 Sep 2024 07:17:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5353

The following changes since commit cf811228d7d25ad7136e24e7c6b9dcd39ca43610:

  migration-guides: add release notes for 5.0.3 (2024-08-22 11:31:14 +0200)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs contrib/abelloni/master-next

for you to fetch changes up to c32b55b3403dcfd76a4694ff407d4b513e14c8f4:

  doc/features: describe distribution feature pni-name (2024-09-03 10:35:52 +0200)

----------------------------------------------------------------
J�rg Sommer (2):
      doc/features: remove duplicate word in distribution feature ext2
      doc/features: describe distribution feature pni-name

 documentation/ref-manual/features.rst | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

