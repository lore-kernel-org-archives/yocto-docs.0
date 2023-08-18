Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E260C001DE
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 09:31:11 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.7758.1692351061958138146
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Aug 2023 02:31:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lKdBvuin;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C9A21C0005;
	Fri, 18 Aug 2023 09:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692351060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ibYBOZoft/zbv0P/eEtJWh2OQN1f/UuWDTk7+TjhhP8=;
	b=lKdBvuinw0M31DYUushw41VUUkz12O/6wCkESl62/bzusQsHSVuHxBqlQunXNIY8+60Sqo
	WBMSA5gw4aEE6+jXeUm4AfHTv6IzQVVtxX1mc60Roe2mQTrUUmHs9JRxT+HD1qAw6kAksS
	at3HFhIzTOSebRUCagBDykAKnCEuq43uvkdOxdkae7hCcaut7cJd8H7HsKLdiwVZtW8UbL
	w+0KjHvdyLwvYOHUqUvB/EMlBa980uia0wCRskgiVhfdJSetM3D2jKUTynsqxXHU+jFbTN
	wqxwESvwgw3iaElGYJzxCQ5HbJ97X0kBjEb/rDR+a4tt/xcxl78GdLYQffdvAA==
Message-ID: <24ed1ecd-57d5-0806-7ae4-af332ad7b180@bootlin.com>
Date: Fri, 18 Aug 2023 11:30:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
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
 <docs@lists.yoctoproject.org>; Fri, 18 Aug 2023 09:31:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4162

Hi Richard,

The following changes since commit efa1c57ecec934998792b7851b4a162be92c8b23:

   ref-manual: document image-specific variant of INCOMPATIBLE_LICENSE 
(2023-07-31 11:30:46 +0200)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to fc70d5976099eafab2ac8f62acf73ed0577aa694:

   ref-manual: package-index doc mentions deploy-ready feeds. 
(2023-08-18 11:23:57 +0200)

----------------------------------------------------------------
Charlie Johnston (5):
       manuals: Add documentation for new packagefeed class.
       overview-manual: Add deploy-ready package feeds section.
       ref-manual: Describe new package feed directories.
       dev-manual: Include reference to package feed indexes.
       ref-manual: package-index doc mentions deploy-ready feeds.

Daniel Semkowicz (1):
       dev-manual: wic.rst: Update native tools build command

Frederic Martinsons (1):
       ref-manual: classes.rst: suppress rust-hello-world reference, add 
ptest-cargo class

Michael Opdenacker (13):
       manuals: create a dedicated "Contributor Guide" document
       ref-manual: classes.rst: fix location of _ref-classes-ccache
       ref-manual: update supported distro versions
       contributor-guide: add missing links to mailing lists
       contributor-guide: add section about why we use mailing lists
       contributor-guide: add recipe style guide
       ref-manual: remove AUTHOR variable
       contributor guide: call section "Reporting a defect"
       contributor-guide: remove obsolete pkg-config guidelines
       contributor guide: remove unnecessary information about mailing lists
       contributor-guide: clarification about patchtest
       contributor guide: update instructions for making and sharing changes
       dev-manual: disk-space: mention faster "find" command to trim 
sstate cache

  documentation/bsp-guide/bsp.rst |   4 +-
  documentation/contributor-guide/identify-component.rst |  29 +++++++++++++
  documentation/contributor-guide/index.rst |  26 ++++++++++++
  documentation/contributor-guide/recipe-style-guide.rst | 257 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/contributor-guide/report-defect.rst |  67 
+++++++++++++++++++++++++++++
  documentation/{dev-manual/changes.rst => 
contributor-guide/submit-changes.rst} | 290 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------------------------------------------------------------------
  documentation/dev-manual/debugging.rst |   7 +--
  documentation/dev-manual/disk-space.rst |  34 +++++++++++----
  documentation/dev-manual/index.rst |   3 --
  documentation/dev-manual/new-recipe.rst |  54 ++---------------------
  documentation/dev-manual/packages.rst |   5 +++
  documentation/dev-manual/start.rst |   9 ++--
  documentation/dev-manual/vulnerabilities.rst |   2 +-
  documentation/dev-manual/wic.rst |   2 +-
  documentation/index.rst |   1 +
  documentation/overview-manual/concepts.rst |  30 +++++++++++++
  documentation/overview-manual/development-environment.rst |  19 ++++-----
  documentation/ref-manual/classes.rst |  59 +++++++++++++++++++++++---
  documentation/ref-manual/resources.rst |   7 ++-
  documentation/ref-manual/structure.rst |  36 ++++++++++++++++
  documentation/ref-manual/system-requirements.rst |  43 +++++++++++++------
  documentation/ref-manual/tasks.rst |  21 ++++++++-
  documentation/ref-manual/variables.rst |  69 
++++++++++++++++++++++++++++--
  23 files changed, 806 insertions(+), 268 deletions(-)
  create mode 100644 documentation/contributor-guide/identify-component.rst
  create mode 100644 documentation/contributor-guide/index.rst
  create mode 100644 documentation/contributor-guide/recipe-style-guide.rst
  create mode 100644 documentation/contributor-guide/report-defect.rst
  rename documentation/{dev-manual/changes.rst => 
contributor-guide/submit-changes.rst} (69%)

Thank you in advance. I'll push more changes to master-next later today 
to make further reviews easier, but at least you can pull the above commits.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


