Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27490C4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 09:16:10 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.182339.1698743768925780402
 for <docs@lists.yoctoproject.org>;
 Tue, 31 Oct 2023 02:16:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WkIAD61y;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7D8424000A;
	Tue, 31 Oct 2023 09:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698743767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HacrlmgE542SM5n9czHtCu5drpjmrvwMe0SjCtYAfBU=;
	b=WkIAD61ynz7q1voWPnlzT4epg1CBsB0yCuqIHMwYNQATw0svqdRiWo3Kxy0jIaDazHzeKC
	7T9iqSpC9iroD87yk20j6BmuJCujrkKXkZzbTcGo9YoOYvE2JF+jVh2U2bxJt1bp8q49if
	nYegbpbEUhL11ro0/0QSIJRRDB+3ev6ueREXLm3cdirQi8LDfHczxsOz/glqw/k8XE59bi
	r7CXlMscJRufzywdyxiQaPNliqvfIXCSdg3B34NSslpdChFYesx5e9ZTs8+vDCLxMqJee6
	prDCGK6ScsTEzf4VghXEUDYVf3HoJUaoB4JKHikunZ761UZSlPjgwnbxQKXy+Q==
Message-ID: <808560ba-78f0-42b2-be6c-86531902bc51@bootlin.com>
Date: Tue, 31 Oct 2023 10:16:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [nanbield] Pull request
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 31 Oct 2023 09:16:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4529

Hi Richard,

The following changes since commit 65b62118da6f355e56c489c6be08ba9ea94b9f04:

   ref-manual: variables: add example for SYSROOT_DIRS variable 
(2023-10-20 15:19:18 +0200)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master

for you to fetch changes up to 8109eeb5b7a4e5b2f50047e049ce0295bdc94856:

   ref-manual: document MESON_TARGET (2023-10-30 10:56:25 +0100)

----------------------------------------------------------------
Eero Aaltonen (1):
       ref-manual: add systemd-resolved to distro features

Marta Rybczynska (1):
       dev-manual: add security team processes

Michael Opdenacker (10):
       manuals: correct "yocto-linux" by "linux-yocto"
       test-manual: reproducible-builds: stop mentioning LTO bug
       ref-manual: document KERNEL_LOCALVERSION
       ref-manual: variables: document OEQA_REPRODUCIBLE_TEST_PACKAGE
       migration-guides: updates for 4.3
       migration-guides: mention runqemu change in serial port management
       ref-manual: document KERNEL_STRIP
       migration-guides: further updates for 4.3
       manuals: improve description of CVE_STATUS and CVE_STATUS_GROUPS
       ref-manual: document MESON_TARGET

  documentation/bsp-guide/bsp.rst                      |   2 +-
  documentation/dev-manual/index.rst                   |   1 +
  documentation/dev-manual/security-subjects.rst       | 189 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/dev-manual/vulnerabilities.rst         |   3 +++
  documentation/kernel-dev/common.rst                  |   2 +-
  documentation/migration-guides/migration-4.3.rst     |  57 
+++++++++++++++++++++++++++++++++++++++++++
  documentation/migration-guides/release-notes-4.3.rst |  32 
+++++++++++++++++++++++--
  documentation/ref-manual/classes.rst                 |   7 +++---
  documentation/ref-manual/features.rst                |   4 ++++
  documentation/ref-manual/variables.rst               |  27 
++++++++++++++++++++-
  documentation/test-manual/reproducible-builds.rst    |  11 ---------
  11 files changed, 316 insertions(+), 19 deletions(-)
  create mode 100644 documentation/dev-manual/security-subjects.rst

Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


