Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FDA5C4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 16:55:15 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.12467.1705078505339629249
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Jan 2024 08:55:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TVAvM2Tf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ECA5E1C0008;
	Fri, 12 Jan 2024 16:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705078504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=syEUWIP5kKeknN/ClN3mOS+Si7XsiZ+4s/xoJCy+9Mw=;
	b=TVAvM2TfcPAT5Lj7FJgLib4S+enTvSQWVmbmkcqjYpT4dZGEVeR0cq15+SmeFb2z0jo9dX
	L+1pAQzBPf+0v9GMPGu86PWwUo1hODlizxoH2W/jD71EThLqwJIfJGRVheexuIzkUCKgEd
	jC6GGttKP+l+nUfiRM7tlwVE0wBpq/t8s1KeTkF7gxfzbSyxVsOARV6kRLQ16foo1QiWsY
	SbeZYDH7MslBQxCrRWCtpy6OzId42/JfDPsl14trQfaiF09RK9iaMU78M2uFfytS2Py3Ia
	LiCTq7TJ3uKxJ6USd7tJyxITNvqzt5k6+yrJjvAdQ4bkmiTEDded7IY9mpUBgQ==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [dunfell][PATCH 0/2] documentation backports
Date: Fri, 12 Jan 2024 17:54:57 +0100
Message-Id: <20240112165459.3554452-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Jan 2024 16:55:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4780

From: Michael Opdenacker <michael.opdenacker@bootlin.com>


Maxin B. John (1):
  ref-manual: classes: remove insserv bbclass

Simone Weiß (1):
  dev-manual: start.rst: update use of Download page

 documentation/dev-manual/dev-manual-start.rst | 19 ++++++++++---------
 documentation/ref-manual/ref-classes.rst      | 10 ----------
 2 files changed, 10 insertions(+), 19 deletions(-)

-- 
2.34.1


