Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C367BC61CE7
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 14:07:10 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.34417.1749218821621531776
 for <docs@lists.yoctoproject.org>;
 Fri, 06 Jun 2025 07:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=GCoIbouX;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-20250606140657c61e8a14fa15f7fa53-uzv2g2@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250606140657c61e8a14fa15f7fa53
        for <docs@lists.yoctoproject.org>;
        Fri, 06 Jun 2025 16:06:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=yqCpUukZNazxQfHpwcVafg+Qyp9zCGzypYH+TMRdb4E=;
 b=GCoIbouXPEmwgdehdNeqpebWrNlPZD7OHCflc6Jj5G9xbef9+5ynPdh9bHQNv8ffM/x8iO
 E04N6Hp2IIQ+ybn2XCfYGdjNf0zvd/ZOxOIcbrjObsGpqX0Ur0Jo/FlGDVL09yusMD1GDnAS
 TqXzOEqOmV9CysvtG1nKq/vJYT+LWeelWxdXL3LmsE+pH9/0xuJFj/y1XYyPFgY5JHD8SUxA
 Snd5claXXozWX+BGpJUpS5kzOs06B4v3gEbiVOsqfv6xPz3PEzyfu7DB94AWJqAIGVyQfDE1
 QK1w4YdZJvBxDp/lQG8K1RSaMqIjHNAa+pPK3zvGloGFIJ+wiV+Mn6fA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 0/3] FIT image improvements documentation
Date: Fri,  6 Jun 2025 16:06:07 +0200
Message-ID: <20250606140647.80782-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 06 Jun 2025 14:07:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7017

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Update the documentation to cover the changes introduced with
https://lists.openembedded.org/g/openembedded-core/message/217767

Adrian Freihofer (3):
  ref-manual: replace kernel-fitimage by kernel-fit-image
  release-notes: drop references to kernel-fitimage
  migration-5.3: replace kernel-fitimage by kernel-fit-image

 .../migration-guides/migration-5.3.rst        |  35 +++++
 .../migration-guides/release-notes-5.1.rst    |   2 +-
 .../migration-guides/release-notes-5.2.rst    |   4 +-
 documentation/ref-manual/classes.rst          | 126 ++++++++++++------
 documentation/ref-manual/variables.rst        |  60 ++++-----
 5 files changed, 152 insertions(+), 75 deletions(-)

-- 
2.49.0


