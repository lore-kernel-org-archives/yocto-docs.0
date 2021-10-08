Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7713CC433F5
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 18:58:56 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.1744.1633719535358691903
 for <docs@lists.yoctoproject.org>;
 Fri, 08 Oct 2021 11:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id EF1DAC0007;
	Fri,  8 Oct 2021 18:58:52 +0000 (UTC)
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [RFC 0/1] Documentation standards
Date: Fri,  8 Oct 2021 20:58:49 +0200
Message-Id: <20211008185850.1032542-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 08 Oct 2021 18:58:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1974

This is a first attempt to standardize the way documentation
(including diagrams) is created.

I'm proposing to write such rules in MarkDown format, for easier
browsing. This is not included in the generated documentation anyway.

For SVG diagrams, proposing the first version of a template that
should help creating new diagrams by copying and pasting shapes,
boxes, arrows and clipart.

Your feedback is welcome. Standards for writing text, to add symbol
references, for linking, etc., are not written yet. I'd like your
opinion on how the specification draft looks like first, and of
course your ideas to make it better.

Thanks in advance

Michael Opdenacker (1):
  Start of documentation standards document

 README                              |    6 +
 documentation/README                |    9 +-
 documentation/standards.md          |  102 +++
 documentation/template/template.svg | 1160 +++++++++++++++++++++++++++
 4 files changed, 1276 insertions(+), 1 deletion(-)
 create mode 100644 documentation/standards.md
 create mode 100644 documentation/template/template.svg

-- 
2.25.1


