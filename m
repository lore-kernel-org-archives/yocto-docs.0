Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73969C48295
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 14:28:27 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.64083.1707143299697585096
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Feb 2024 06:28:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=R+xrZLT4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F09940004;
	Mon,  5 Feb 2024 14:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707143297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Rbi5nPGBAZXejuEbswJqE53pMMEOEZEAInDKROM6y6g=;
	b=R+xrZLT4CzVy+eBPG+YpjYTQxwbs3CDgLGk2WxPNZ/vMukLJUmfJUq1QoT8G4VM9hQePoE
	2IWJj7gaKSuFp0IqNLkr29nezlXFbw/rKzX4XPPy2ga+iwzcaqapiuYEDFmZiPEyQRY8L5
	+/tQJn6VMUbiLyyox3ca4c/MjsdTbjXT/7blFhAhgF2aSgeNFMB4JDvmXiZaiQqdXM60s4
	nCNnbugOmKD3MzN1fnqJrTzwgpSheSM0m2Y6Cr+RMaCFHQoQKnA8nHRYK0uk4f/uoF0ZVh
	KUA/uMiR2Z7j9iNN2ymYqzibfUPNCuQnHZzbkjOWfBbQndrDrkh0M/a9BDP1Ng==
Message-ID: <aca1bef2-e0c2-4909-a901-766ba2343d96@bootlin.com>
Date: Mon, 5 Feb 2024 15:28:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [master] Pull request
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 05 Feb 2024 14:28:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4812

Hi Richard

The following changes since commit 29cee590d59294306600a119048a234f10375603:

   migration-guide: add release notes for 4.3.2 (2024-01-11 14:37:32 +0100)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to 79530aeb97976b9a63bf04ed247f98061fc9d737:

   release-notes-4.3: fix spacing (2024-02-05 15:22:33 +0100)

----------------------------------------------------------------
Lee Chee Yang (1):
       migration-guide: add release notes for 4.0.16

Michael Opdenacker (3):
       dev-manual: start: remove idle line
       docs: remove support for mickledore (4.2) release
       release-notes-4.3: fix spacing

Simone Weiß (2):
       bsp-guide: correct formfactor recipe name
       dev-manual: gen-tapdevs need iptables installed

baruch@tkos.co.il (1):
       contributor-guide: fix lore URL

  documentation/bsp-guide/bsp.rst                         |   4 ++--
  documentation/contributor-guide/submit-changes.rst      |   2 +-
  documentation/dev-manual/runtime-testing.rst            |   2 ++
  documentation/dev-manual/start.rst                      |   1 -
  documentation/migration-guides/release-4.0.rst          |   1 +
  documentation/migration-guides/release-notes-4.0.16.rst | 191 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/migration-guides/release-notes-4.3.rst    |   2 +-
  documentation/set_versions.py                           |   2 +-
  8 files changed, 199 insertions(+), 6 deletions(-)
  create mode 100644 documentation/migration-guides/release-notes-4.0.16.rst

Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


