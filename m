Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC39C4167D
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 16:49:53 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.17619.1699980590037273575
 for <docs@lists.yoctoproject.org>;
 Tue, 14 Nov 2023 08:49:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Lt2trb9z;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4312D1C0002;
	Tue, 14 Nov 2023 16:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699980587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dCXpGtiuIJJA8E356/daB4NxfA6g4DYieC2ooT4MAmw=;
	b=Lt2trb9zlTpfvjxfErZeGl08uxduhsz4u/IaCBf1j5exe/Emd0vv8ulgfHSdf2A/LuoX9i
	8CS/P8xYBrn6m7piT6bdxmKJhbq6UuheVYmZz3GyM+ltJKKc+9+EiMo610nq2sETwtqEB/
	rsf7hVv2uZocCaerCxgozIb6IIDBtnK1bb3uTXQTzrl8NyYC6fCQ77sNKAmLZMIy8hWF/z
	5znbrKGxzGjHJM14SuF/LnvWt9fnCJwhY/edr12n52pkgWXafCjj9VSsEmWnrTma8lTjM/
	olzDkvS/+oEQWRhzrcJqjDctzYFVYslT3BzJXVSdxt50FVl/aMzbumCCq6va6A==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 0/7] kirkstone backports
Date: Tue, 14 Nov 2023 17:49:35 +0100
Message-Id: <20231114164942.133472-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 14 Nov 2023 16:49:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4620

From: Michael Opdenacker <michael.opdenacker@bootlin.com>


BELHADJ SALEM Talel (1):
  overview-manual: concepts: Add Bitbake Tasks Map

Michael Opdenacker (5):
  ref-manual: variables: document OEQA_REPRODUCIBLE_* variables
  ref-manual: variables: mention new CDN for SSTATE_MIRRORS
  ref-manual: variables: add RECIPE_MAINTAINER
  ref-manual: classes: explain cml1 class name
  manuals: update class references

Paul Eggleton (1):
  ref-manual: update SDK_NAME variable documentation

 documentation/dev-manual/runtime-testing.rst  |    2 +-
 .../dev-manual/upgrading-recipes.rst          |    2 +-
 .../migration-guides/migration-1.5.rst        |    2 +-
 .../migration-guides/migration-2.6.rst        |    2 +-
 documentation/overview-manual/concepts.rst    |  172 +-
 .../overview-manual/svg/bitbake_tasks_map.svg |    4 +
 documentation/ref-manual/classes.rst          | 1698 ++++++++++-------
 documentation/ref-manual/release-process.rst  |    2 +-
 documentation/ref-manual/variables.rst        |  313 ++-
 documentation/test-manual/intro.rst           |    2 +-
 10 files changed, 1430 insertions(+), 769 deletions(-)
 create mode 100644 documentation/overview-manual/svg/bitbake_tasks_map.svg

-- 
2.34.1


