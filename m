Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85BD8C38A2D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 16:07:34 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web09.9497.1666800452658493100
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Oct 2022 09:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gzI8exjz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BE3F91BF203;
	Wed, 26 Oct 2022 16:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666800450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AwZczrfkJo+0yMDPaWOclb9W8MMAO5AkrX8igFFfKss=;
	b=gzI8exjzXtQMLDAHT9SEsu4HAPZmK0/xP7zDrd/V3FcUzHSfgbCQzn/6NxQeVyvdsx4RzA
	dQ7FhM4scnJ7uDqbwDJsJPT4j2W/EWrRYZ9ZFu5VyMlzx4sOl0Bi3yXy3rVdp/aY0S2zzl
	oGV9xJtSC/G7MeyiKRzffdZwb6/064rlGWLGPOvg1XwoxHvda+9CETG7WlMPpo26pD3dHc
	dVLO4ntu1PVpkgmG5pvazvuJ7w2dNJxvRrSwdkLc+SlDnSSogpVCcnrD7FuG6T5u1C5CYc
	19Lfb9RU7n6fJFGRcmPGmIYbKna+8ZuvxNI6YHHrQ5DzXWEsyDBr+1t4EvB50g==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: rybczynska@gmail.com,
	mikko.rapeli@linaro.org,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2 0/4] Improve CVE check and patching documentation
Date: Wed, 26 Oct 2022 18:07:09 +0200
Message-Id: <20221026160713.2068570-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <1721A288D2BAB036.492@lists.yoctoproject.org>
References: <1721A288D2BAB036.492@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Oct 2022 16:07:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3416

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Mikko Rapeli <mikko.rapeli@linaro.org>

I think detecting and fixing CVE security issues in yocto based distros
is quite important so improve the documentation around it. I've been
using cve-check.bbclass for a long time and these details hopefully
make it easier for others to start using it as well.

Changes in V2:
- Misc wording fixes by Michael Opdenacker

Mikko Rapeli (4):
  ref-manual: variables.rst: add documentation for CVE_VERSION
  ref-manual: classes.rst: improve documentation for cve-check.bbclass
  dev-manual: common-tasks.rst: add regular updates and CVE scans to
    security best practices
  dev-manual: common-tasks.rst: refactor and improve "Checking for
    Vulnerabilities" section

 documentation/dev-manual/common-tasks.rst | 183 +++++++++++++++++-----
 documentation/ref-manual/classes.rst      |  52 +++++-
 documentation/ref-manual/variables.rst    |  12 ++
 3 files changed, 204 insertions(+), 43 deletions(-)

-- 
2.34.1


