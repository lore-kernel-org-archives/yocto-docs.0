Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD00C4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 15:31:27 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.24298.1707233484356003827
 for <docs@lists.yoctoproject.org>;
 Tue, 06 Feb 2024 07:31:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IsuIUDEn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E00A6240008;
	Tue,  6 Feb 2024 15:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707233483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=38E9YlJpL7ohSmpG7xTYYtQtLDhcPuD32bohVbUmMvA=;
	b=IsuIUDEnjCJ7iLHdFDv+ZM43S8QO4Xx3k0bcCQOEvkPaZuCupVn5OmaqaNj+j82O0Sdldt
	hbSGYuTbB/g84nQjzjpviWTL7LxsphWkqGPBarI8e56Wc0LOH6BMC0qlMcoGILatpcmlNM
	r8yZL+Byf3PPyiKLvoqFmAip0XQFIlwoDj8RRgds+CgZsnJhQTka+INi6xXYemSzKt4HYD
	7cgNIUshfbvK+xPkJEWoPUKgWMSTEebm+j28vUWwiV3KVpWadbBegSi4oYP8zdTjUR4+RV
	GeYRlLJLRmySIwI0lW+83Sr6vvZJg4qSG0bCjM8lSsXoLWuqbqts1sR9jq4NKw==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 0/3] documentation backports
Date: Tue,  6 Feb 2024 16:31:08 +0100
Message-Id: <20240206153111.77153-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 06 Feb 2024 15:31:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4819

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Corresponding to applicable changes merged into "master"

Baruch Siach (1):
  contributor-guide: fix lore URL

Michael Opdenacker (1):
  dev-manual: start: remove idle line

Simone Weiß (1):
  dev-manual: gen-tapdevs need iptables installed

 documentation/contributor-guide/submit-changes.rst | 2 +-
 documentation/dev-manual/runtime-testing.rst       | 2 ++
 documentation/dev-manual/start.rst                 | 3 +--
 3 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.34.1


