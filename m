Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A2DBC433F5
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 13:47:51 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web08.15998.1636724870180834372
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 05:47:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 4E196240010;
	Fri, 12 Nov 2021 13:47:48 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 0/4] Supported distros update and preparation for 3.1.12
Date: Fri, 12 Nov 2021 14:47:37 +0100
Message-Id: <20211112134741.170835-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Nov 2021 13:47:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2130

These are updates already applied to Dunfell. Note that I added
both Fedora 33 and 34.

Is it OK to assume that openSUSE 15.2 is supported on "master" too?
I'm finding success builds on this version, but I'm not sure this
is sufficient, and it's probably not up to me to decide.

Michael Opdenacker (1):
  documentation: prepare for 3.1.12 release

Steve Sakoman (3):
  ref-system-requirements.rst: Add Debian 11 to list of supported
    distros
  ref-system-requirements.rst: Add Fedora 33 and 34 to list of supported
    distros
  ref-system-requirements.rst: Add openSUSE Leap 15.2 to list of
    supported distros

 documentation/ref-manual/system-requirements.rst | 9 ++++++++-
 documentation/releases.rst                       | 1 +
 documentation/sphinx-static/switchers.js         | 2 +-
 3 files changed, 10 insertions(+), 2 deletions(-)

-- 
2.25.1


