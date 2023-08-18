Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5727C7EE2E
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 17:10:19 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.74.1692378615781216354
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Aug 2023 10:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jZ/jMMRv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E4E81FF802;
	Fri, 18 Aug 2023 17:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692378614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SVhISYFcJigexYr25bsebZZfclfiXXk2J/9pKZmePYY=;
	b=jZ/jMMRvqFyQDTqacrzhcf+DxoAZ8poTjbO3jJkRFzSBoC9oPfP+lFXkvW2SiwZJeKv8s2
	1dNBnBE17STfiLeFUdeXVu5TWtAH0agzZ8ZJuzS1Pboy4c6/Ylf5MeGlSQmgPZgIqoELYW
	8Xg45ouwUAtO2EqIGVCrxCDuLurzRDbsEG8i/MikhMhbJT9eDUeq1UEr+eamKbXE17lIe4
	ftFJEg08ISyPWPP0ES8nDRL6Kb2pRnBtIZlBYqMGh8YdaQ5ICnJ1y8Im6Ulre8jHaJm+El
	kF1dvZEHcwjTFFlDJsrAdyXvH+ErWPRQTGZB6LNBxBj9T3xDk+ArXY0H6+Xm5Q==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Jon.Mason@arm.com,
	JPEWhacker@gmail.com,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 00/10] Further work on the Contributor Manual
Date: Fri, 18 Aug 2023 19:09:55 +0200
Message-Id: <20230818171005.92381-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Aug 2023 17:10:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4165

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Ongoing work to consolidate existing documentation
and wiki pages into one central Contributor Guide.

You can review individual patches, but for your
convenience, the result is also available on
https://docs.yoctoproject.org/next/contributor-guide/
(wait for 30 minutes after this message is sent)

Michael Opdenacker (10):
  contributor-guide: move to 2nd place in top menu
  contributor-guide: submit-changes: simplify note
  contributor-guide: identify component: provide link to repositories
  contributor-guide: submit-changes: detail commit and patch creation
  contributor-guide: submit-changes: develop sending patches section
  manuals: README: update list of manuals
  contributor-guide: submit-changes: reorganize and develop sections
  contributor-guide: submit-changes: improvements to mailing lists
    section
  contributor-guide: submit-changes: commit guidelines for recipes
  contributor-guide: submit-changes: how to request push access to
    repositories

 documentation/README                          |   8 +-
 .../contributor-guide/identify-component.rst  |  10 +-
 .../contributor-guide/submit-changes.rst      | 611 ++++++++++++------
 documentation/index.rst                       |   2 +-
 4 files changed, 442 insertions(+), 189 deletions(-)

-- 
2.34.1


