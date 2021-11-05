Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF43EC433F5
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 15:12:05 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web12.6901.1636125124629151847
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Nov 2021 08:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id C357A40005;
	Fri,  5 Nov 2021 15:12:02 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 0/3] Simplify variable reference descriptions
Date: Fri,  5 Nov 2021 16:11:56 +0100
Message-Id: <20211105151159.28541-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Nov 2021 15:12:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2089

This starts an effort to eliminate duplication between the YP / OE
and BitBake manuals.

The idea is to move all information that applies to BitBake to
the BitBake manual, and just add YP / OE specific information
in the YP manual.

The below commits assume that the below patches have been accepted
in BitBake: https://lists.yoctoproject.org/g/docs/message/2084

These commits are just shown in advance to double check
these changes to the BitBake manual.

Michael Opdenacker (3):
  ref-manual: simplify SRC_URI reference
  ref-manual: move TMPDIR to BitBake's documentation
  ref-manual: move TOPDIR to BitBake's manual

 documentation/ref-manual/variables.rst | 148 ++-----------------------
 1 file changed, 8 insertions(+), 140 deletions(-)

-- 
2.25.1


