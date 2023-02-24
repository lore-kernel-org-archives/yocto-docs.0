Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C74C61DA4
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 15:39:10 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.20669.1677253146082582249
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Feb 2023 07:39:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BrsTkWk0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 05F191C0009;
	Fri, 24 Feb 2023 15:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677253144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=56uqL1MkcuhitKedHN2MqFplPXECKLgvdBazqOAEOoo=;
	b=BrsTkWk0C1/LJ6iOrJ+7xs4hbRKwYmw7mceeNn3R5HE3bLKeXCFLYdeHVaQz0QycTywQ34
	S+2qyCsCISMB/Sk3y2jFjK8Hvm3f7pLcz0WeMI4JPQymXU3L0mBQnM95KI0NY1YEoyb+Fu
	o+Fb2ljr8my037ijwqfSRQDhPPq+6CvzwS5ppq+kSdYZns44YBP5MN3PocD8ffA7TPss3E
	8LRztkPDvOT4Gizh4NFlQoTdhVOwu80FfS1UeE1cST3KayTXdM3F3SmFIRKW8RyvuM9VlK
	2E54S7WTflBOmSfHeXnzPINtPib7dJ0tzf8/Lf0hM+o0IG7x4SPp6cbbAJ7UgQ==
Message-ID: <e2d99ff0-1458-d26d-0ce5-3e3966f1f09d@bootlin.com>
Date: Fri, 24 Feb 2023 16:39:03 +0100
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
 <docs@lists.yoctoproject.org>; Fri, 24 Feb 2023 15:39:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3738

Hi Richard,

The following changes since commit 3f3f0ad23f31fb5bb7b550dbe18bbedb1449b3ca:

   ref-manual: document Rust classes (2023-02-10 11:16:14 +0100)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to 4058998dbeba4262ccced8999be338c04c324b48:

   dev-manual: new-recipe.rst: add references to subsections in Examples 
section (2023-02-24 16:31:52 +0100)

----------------------------------------------------------------
Fawzi KHABER (1):
       ref-manual: update DEV_PKG_DEPENDENCY in variables

Michael Opdenacker (10):
       manuals: update patchwork instance URL
       ref-manual: classes.rst: add python-setuptools3_rust and 
python_pyo3 classes
       dev-manual: new-recipe.rst: restructure examples
       ref-manual: classes.rst: improvements to cmake class documentation
       ref-manual: document meson class and variables
       dev-manual: sbom.rst: add link to FOSDEM 2023 video
       manuals: document COMMERCIAL_[AUDIO|VIDEO]_PLUGINS variables
       ref-manual: system-requirements.rst: update supported distros
       dev-manual: new-recipe.rst: add Meson example recipe
       dev-manual: new-recipe.rst: add references to subsections in 
Examples section

Niko Mauno (1):
       ref-manual: Fix invalid feature name

Ulrich Ölmann (3):
       kernel-dev,ref-manual: fix old override syntax
       ref-manual: refer to MACHINE variable instead of KMACHINE
       kernel-dev: harmonize example with ref-manual

  documentation/dev-manual/changes.rst             |   2 +-
  documentation/dev-manual/licenses.rst            |  30 
+++++++++++++++++-------------
  documentation/dev-manual/new-recipe.rst          | 145 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------------------------------------------------------------
  documentation/dev-manual/sbom.rst                |   3 +++
  documentation/kernel-dev/common.rst              |  10 +++++-----
  documentation/overview-manual/yp-intro.rst       |   2 +-
  documentation/ref-manual/classes.rst             |  60 
+++++++++++++++++++++++++++++++++++++++++++++++++-----------
  documentation/ref-manual/features.rst            |   4 ++--
  documentation/ref-manual/system-requirements.rst |  10 ++++++----
  documentation/ref-manual/variables.rst           |  65 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
  10 files changed, 229 insertions(+), 102 deletions(-)


Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


