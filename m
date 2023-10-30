Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FEB2C4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 09:20:11 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.144631.1698657600711569818
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Oct 2023 02:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=M+xWVdG9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49EE720003;
	Mon, 30 Oct 2023 09:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698657598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tMCc/PCaRJ7IhzeM5mM9vmg2vnICVZ7ZtzGWINXFWAw=;
	b=M+xWVdG97VRu4KOM9psEaPXzyWPU3MS5vDy65ToLYlx3GS1DkP2vveV6vLh0+I65r9Mdkt
	WvHhPO2F14+X6sEwXwLknMNaOLdGcRs794dHyBq09qI89uG5LIH7zMKeLGxHCsvnOqr//B
	pFPDCK5CTPUOv2g/tSw6dkOauKVWbIxoOHPeR6sx7omA97IFqw9ex7UEGre6Y2jP13wgxp
	oWVt7e6c24WpX4fx9HTbpd09g/t546BQ0voKA7PJvkI8ZLM6ewrYBkMiRqBd+5CCecVCpU
	y3ZEmD3+6tqaPyjeqonblN7C6y1yBlmiMe1f3Ac9lYfTjeLfHZdrFOoMO3kHMg==
Message-ID: <f386da74-a418-44eb-b35a-3555228b2357@bootlin.com>
Date: Mon, 30 Oct 2023 10:19:57 +0100
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
 <docs@lists.yoctoproject.org>; Mon, 30 Oct 2023 09:20:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4523

Hi Richard,

The following changes since commit 65b62118da6f355e56c489c6be08ba9ea94b9f04:

   ref-manual: variables: add example for SYSROOT_DIRS variable 
(2023-10-20 15:19:18 +0200)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to cfef5fe41b6c819e783c88829448ae38141650a5:

   manuals: improve description of CVE_STATUS and CVE_STATUS_GROUPS 
(2023-10-30 10:15:41 +0100)

----------------------------------------------------------------
Eero Aaltonen (1):
       ref-manual: add systemd-resolved to distro features

Marta Rybczynska (1):
       dev-manual: add security team processes

Michael Opdenacker (9):
       manuals: correct "yocto-linux" by "linux-yocto"
       test-manual: reproducible-builds: stop mentioning LTO bug
       ref-manual: document KERNEL_LOCALVERSION
       ref-manual: variables: document OEQA_REPRODUCIBLE_TEST_PACKAGE
       migration-guides: updates for 4.3
       migration-guides: mention runqemu change in serial port management
       ref-manual: document KERNEL_STRIP
       migration-guides: further updates for 4.3
       manuals: improve description of CVE_STATUS and CVE_STATUS_GROUPS

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
  documentation/ref-manual/features.rst                |   4 ++++
  documentation/ref-manual/variables.rst               |  22 
++++++++++++++++-
  documentation/test-manual/reproducible-builds.rst    |  11 ---------
  10 files changed, 307 insertions(+), 16 deletions(-)
  create mode 100644 documentation/dev-manual/security-subjects.rst

Thank you in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


