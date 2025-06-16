Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3368BC71136
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 20:41:56 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.2382.1750106509113979742
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Jun 2025 13:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=sV9ak7ti;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-202506162041448342290d3f95b778d2-c5t7kf@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202506162041448342290d3f95b778d2
        for <docs@lists.yoctoproject.org>;
        Mon, 16 Jun 2025 22:41:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=z1mnhMf//zlkUQBuoeqQllkDSGhHfjmC8BVwWCgaTHk=;
 b=sV9ak7tiFx92ZWFof68s878PSo4BYRve3iY70ivttKhQSriVUJu4MiI0BApW7L0JLoECCU
 J3QnA0RLILGymVX3KAQ/65buGd1sOwflEzH58GzVBuPfBEprTJfND7/cpr83ZBFpnXHv4V+e
 sr1s7ViSsV+qAedJfLjfZccCJFLZr5k8E74OSG8oVpjwxcfeBdiWQNoHFC1fjWmyfUkpujI5
 V3/7lRA+HoMVAOksiKWkAxRI6HdfekeSVvfoTN5NYHMMGdCvarhCCnGcKdew/0HhZM3WkpK9
 WI96jBnhOrydxDV6cVI+l6UuriMdNJbWtHpKiy3396hKbkJu3k9MNnnQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 0/3] FIT image improvements documentation
Date: Mon, 16 Jun 2025 22:36:46 +0200
Message-ID: <20250616204135.1388643-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Jun 2025 20:41:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7076

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Changes from v1 to v2:

* Findings from Antonin
  * Add examples
  * all suggested wording improvements
  * link to bugzilla
  * Enumeration with #.
* Taking into account discussions related to meta-ti and meta-rockchip

Update the documentation to cover the changes introduced with
https://lists.openembedded.org/g/openembedded-core/message/217767

Adrian Freihofer (3):
  ref-manual: replace kernel-fitimage by kernel-fit-image
  release-notes: drop references to kernel-fitimage
  migration-5.3: replace kernel-fitimage by kernel-fit-image

 .../migration-guides/migration-5.3.rst        |  42 ++++
 .../migration-guides/release-notes-5.1.rst    |   2 +-
 .../migration-guides/release-notes-5.2.rst    |   4 +-
 documentation/ref-manual/classes.rst          | 201 ++++++++++++------
 documentation/ref-manual/variables.rst        |  60 +++---
 5 files changed, 215 insertions(+), 94 deletions(-)

-- 
2.49.0


