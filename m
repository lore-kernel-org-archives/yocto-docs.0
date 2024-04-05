Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68333C67861
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 16:22:08 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.16836.1712334120088408405
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Apr 2024 09:22:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RY109k94;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07368C0009;
	Fri,  5 Apr 2024 16:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712334118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=O6EU3xqSqjrG4i5w7jWmLPG/I4rBnja0uJ2cwYDT9kU=;
	b=RY109k94d4fPERSyTwWEfP51InDKSXe5JCoOveR81PjJSmlm24Fm8rE4ljcfo7Z+PSo8zY
	NFgFny6HeDIiznv//1RkADrswP4CDtE2f4Os1CkXwZX7s59eBZHzUA8uzgqBGi+9oYtU3p
	HYdkCpqi8mgKQ4jFn46/pDwVgrkwSBIcmO9yaYb73nIdozwSqKXEP7VcrVLeB974Lf0o0k
	q1TWmxAgkwuCKlpmA8cLH+W2QE4t2UsbeU242ODR7hRHIYCrfvpaa9LkCjygbLopuvrEUB
	fxgsmlS+lAl2tkdmogIbbcu6vprQ4bO2wxiueQBuwTIeCxgOUwkT8i8jwfHsLg==
Message-ID: <5b213440-7368-48e4-819b-b40dad61b708@bootlin.com>
Date: Fri, 5 Apr 2024 18:21:57 +0200
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
 <docs@lists.yoctoproject.org>; Fri, 05 Apr 2024 16:22:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5088

Hi Richard

(note that the changes I'm submitting on my name were created on my 
spare time during the week-end... being mostly busy with the Binary 
Distro project during working days)

The following changes since commit cfaf2707b4a77888316d5eb24bf41ccc21e2c12b:

   dev-manual: improve descriptions of 'bitbake -S printdiff' 
(2024-03-19 14:45:21 +0100)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to 7e8d8d6d47da61457798e90b1d53f3082fe76668:

   migration-guides: add missing opening tag colon (2024-04-05 18:07:38 
+0200)

----------------------------------------------------------------
Joao Marcos Costa (3):
       classes: document new go-vendor class
       migration updates for 5.0
       release-notes updates for 5.0

Lee Chee Yang (2):
       release-notes-4.0.17: reorder CVEs
       migration-guides: add release notes for 4.3.4

Michael Opdenacker (5):
       manuals: fix duplicate "stylecheck" target
       manuals: add initial sphinx-lint support
       manuals: fix trailing spaces
       manuals: fix incorrect double backticks
       migration-guides: add missing opening tag colon

Quentin Schulz (2):
       docs: conf.py: properly escape backslashes for latex_elements
       manuals: refer to new yocto-patches mailing list wherever appropriate

  documentation/Makefile                                  |   5 ++--
  documentation/README                                    |  14 ++++++++++
  documentation/conf.py                                   |   4 +--
  documentation/contributor-guide/submit-changes.rst      |   2 +-
  documentation/dev-manual/init-manager.rst               |   2 +-
  documentation/dev-manual/layers.rst                     |   2 +-
  documentation/dev-manual/start.rst                      |   2 +-
  documentation/dev-manual/wic.rst                        |   4 +--
  documentation/migration-guides/migration-4.0.rst        |  20 
+++++++--------
  documentation/migration-guides/migration-4.2.rst        |   2 +-
  documentation/migration-guides/migration-5.0.rst        |  33 
++++++++++++++++++++++--
  documentation/migration-guides/release-4.3.rst          |   1 +
  documentation/migration-guides/release-notes-4.0.17.rst |  12 ++++-----
  documentation/migration-guides/release-notes-4.0.4.rst  |   2 +-
  documentation/migration-guides/release-notes-4.0.5.rst  |   2 +-
  documentation/migration-guides/release-notes-4.0.rst    |  16 ++++++------
  documentation/migration-guides/release-notes-4.2.rst    |   4 +--
  documentation/migration-guides/release-notes-4.3.4.rst  | 206 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/migration-guides/release-notes-5.0.rst    |  33 
++++++++++++++++++++++++
  documentation/overview-manual/intro.rst                 |   2 +-
  documentation/profile-manual/usage.rst                  |   2 +-
  documentation/ref-manual/classes.rst                    |  18 
+++++++++++--
  documentation/ref-manual/resources.rst                  |   3 +++
  documentation/ref-manual/tasks.rst                      |   2 +-
  documentation/ref-manual/variables.rst                  |  32 
+++++++++++------------
  25 files changed, 362 insertions(+), 63 deletions(-)
  create mode 100644 documentation/migration-guides/release-notes-4.3.4.rst

Thank you in advance,
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


