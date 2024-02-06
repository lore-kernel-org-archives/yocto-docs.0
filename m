Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87DB3C48297
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 15:36:17 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.24169.1707233776997809533
 for <docs@lists.yoctoproject.org>;
 Tue, 06 Feb 2024 07:36:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=T7sJL6Im;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A619C2000B;
	Tue,  6 Feb 2024 15:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707233774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=G+fQbProyNzeKbGA7c1aIidnyVYdKtZA1KoTpOdt110=;
	b=T7sJL6ImW9Y4mUQ1fcch+4uMDuGNSRvQVhKlluFevG5cp6Z4PquiPB/yySoioYkc3mloFB
	GnmOLc03dYmZwW3dF+kwtpUGywAFMRiSsGRDR6nPkCklRKm0JIBqq2oTFvaomyZ8XDl2Rz
	BoBruU13bn2cvUQRcSEjVH0M+r6Tdl5mIS73GxnpoIDSiraDZ4N60Zt5ZLoDNaGuReLSEQ
	APXTzl+1eq96yoCw0mBXK46c2ZYVJuRbEO5aCb3sg6A6Gnh9/7LKmKLAYw7Ha3wctVZ9nQ
	aOhhhvfl9/HwLj6WaaoI7r6iEfNtRgrhcVxuxmGK/pzviIUk7l+Zmjwk72/Ffw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [dunfell][PATCH 0/1] documentation backports
Date: Tue,  6 Feb 2024 16:36:08 +0100
Message-Id: <20240206153609.77849-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 06 Feb 2024 15:36:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4823

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Corresponding to applicable changes in the "master" branch.

Simone Weiß (1):
  dev-manual: gen-tapdevs need iptables installed

 documentation/dev-manual/dev-manual-common-tasks.rst | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.34.1


