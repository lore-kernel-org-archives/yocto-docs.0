Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B1FC05027
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 17:56:14 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.1005.1676656565709073166
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Feb 2023 09:56:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ok+R+/fo;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7895E100004;
	Fri, 17 Feb 2023 17:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676656563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=569LP3iv4t1wpYVPMLeMTR/SuNlQk/ODIAg5+MZAdLw=;
	b=Ok+R+/foGP7sPHdVtgEmc2kPFlJLDHn1YPBXzCAJEWTza60ENlVv1rOX381vovGFNHc7bG
	qw4RA2DfCGBs75rzf47jmPmtuVKDvhtUsSDRWMdwBBN6/SwexqtcP+zezNJc7CpRM4D6L8
	JxTJI4DLGgHWzCeXN2robepciEfakTYH79iQLQa8hNI2qLRCdAWpjNDBRyZS0803mimMBz
	1MONb0Chrmq1sFEuZETtgSwDvbT8bZXQ49tYdY1FAN8JUO/H0b1+g+zhiCpxMvu7PfzuSU
	Eu5gfYA8yA3qs0kgiJSRgNKXSgnSeFCfbpv9PAHSxhtOuM88hGTvnYr2BNHRig==
Message-ID: <be863023-5e8a-228a-596e-dee413291db0@bootlin.com>
Date: Fri, 17 Feb 2023 18:56:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [master] Pull request
Organization: Bootlin
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Feb 2023 17:56:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3698

Hi Richard,

The following changes since commit 3f3f0ad23f31fb5bb7b550dbe18bbedb1449b3ca:

   ref-manual: document Rust classes (2023-02-10 11:16:14 +0100)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to aacd49e5c72ac1506fc09790902c6047ccf26a02:

   ref-manual: document meson class and variables (2023-02-17 17:40:24 
+0100)

----------------------------------------------------------------
Michael Opdenacker (5):
       manuals: update patchwork instance URL
       ref-manual: classes.rst: add python-setuptools3_rust and 
python_pyo3 classes
       dev-manual: new-recipe.rst: restructure examples
       ref-manual: classes.rst: improvements to cmake class documentation
       ref-manual: document meson class and variables

Ulrich Ölmann (3):
       kernel-dev,ref-manual: fix old override syntax
       ref-manual: refer to MACHINE variable instead of KMACHINE
       kernel-dev: harmonize example with ref-manual

  documentation/dev-manual/changes.rst       |   2 +-
  documentation/dev-manual/new-recipe.rst    | 110 
++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------
  documentation/kernel-dev/common.rst        |  10 +++++-----
  documentation/overview-manual/yp-intro.rst |   2 +-
  documentation/ref-manual/classes.rst       |  60 
+++++++++++++++++++++++++++++++++++++++++++++++++-----------
  documentation/ref-manual/variables.rst     |  39 
+++++++++++++++++++++++++++++++++++++--
  6 files changed, 145 insertions(+), 78 deletions(-)

Thank you in advance

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


