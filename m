Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B6B5C5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 09:10:58 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.8065.1709716254809719070
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Mar 2024 01:10:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hLqtjLkT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D08AB2000E;
	Wed,  6 Mar 2024 09:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709716253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fxo1Rl9jHN3549mwfNmwPdpSOyCNm581n0IQoInnMBI=;
	b=hLqtjLkTKgTKT9t16qSMr0W83P8YMSt9jL6LYWqsKeDL35a0iou+gHyAVnuvR1uNCLPwFz
	OsI8tqDI0Yhtt91UsZbAX6Usec4wvI53Go5EibIjXuQZTii1y84EHnavIME7kaNaUSjTsx
	N5ug6WWF+lS9HQy7YCdvyhgDXZ8cBXjPJNidyYD9zhK8ri3e8mO4Ue7KD63Sr3jB9V2/uD
	gNja/6y/BopFUnI1jzYN1UVzkM6Dq6A0d6dVdn+4weFD+NFNqPFoV4l1LZzWOGIatS/NLq
	xRctgiIghPdRbcBh61u/+OnM6wdeuqFr2QBNU71OmuJ8RKb7vDTuROphmyCo5w==
Message-ID: <f7e5b325-567b-4351-aa44-b9433c7f3e13@bootlin.com>
Date: Wed, 6 Mar 2024 10:10:52 +0100
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
 <docs@lists.yoctoproject.org>; Wed, 06 Mar 2024 09:10:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4940

Hi Richard

The following changes since commit 6571eb02cbd5c2b96df0f279f25b63255ab7eac4:

   dev-manual: packages: need enough free space (2024-02-24 17:00:17 +0100)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to 6f3dbb2a909ba5b71efb09b251ee3f8650e30146:

   contributor-guide: add notes for tests (2024-03-06 10:09:46 +0100)

----------------------------------------------------------------
Geoff Parker (1):
       ref-manual: variables: adding multiple groups in GROUPADD_PARAM

Johan Bezem (1):
       ref-manual: variables: correct sdk installation default path

Luca Ceresoli (2):
       ref-manual: tasks: do_cleanall: recommend using '-f' instead
       ref-manual: tasks: do_cleansstate: recommend using '-f' instead 
for a shared sstate

Michael Opdenacker (1):
       dev-manual: packages: fix capitalization

Simone Weiß (2):
       ref-manual: classes: add cve status check for oe.qa
       contributor-guide: add notes for tests

  documentation/contributor-guide/submit-changes.rst | 37 
+++++++++++++++++++++++++++++++++++--
  documentation/dev-manual/packages.rst              |  2 +-
  documentation/overview-manual/concepts.rst         |  2 +-
  documentation/ref-manual/classes.rst               |  5 +++++
  documentation/ref-manual/tasks.rst                 | 38 
+++++++++++++++++++++++++++++++++++---
  documentation/ref-manual/variables.rst             | 14 +++++++++++++-
  6 files changed, 90 insertions(+), 8 deletions(-)

Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


