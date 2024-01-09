Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9682EC46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 16:21:21 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.20765.1704817273764940183
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jan 2024 08:21:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WySRuc5B;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA993FF817;
	Tue,  9 Jan 2024 16:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704817271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=igS91ZstrSw6BYVGqAipEy866xQbpBk6Ze29wbQVg68=;
	b=WySRuc5B792WA6obAd4C2iHmmp5uveGtYki+hcfsX72RZJPnA2YhPVGdoafl21JuXnwSCp
	gpa2D04piHAFkLbuaSWNTBLuQbd/FEn9oXBbRY6VJwDL2qhcjcM4CF1I4ALoesE9Wk5HiR
	lx5uCnMJ06rRVJQQr+UMH9OEm3r3iISvp9bSCVoo63gnPzvEF6SLa29CKLvFfIZJ0AvZ5x
	lzIwx4RRCBkl0uuutjUBSnYD3dG/Z7UwNmWXBFmrc9jIB4IMS36LLETUtGMqQ3rrvNraZB
	4EYbmvjSXuwwpYJcHe10Y/95IP0WTaeNlcA1/uBJDeiIo7sawvIWKx42qYh+UA==
Message-ID: <ae47c173-5ca6-4b71-8042-883b10fedf9d@bootlin.com>
Date: Tue, 9 Jan 2024 17:21:10 +0100
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
 <docs@lists.yoctoproject.org>; Tue, 09 Jan 2024 16:21:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4758

Hi Richard,

The following changes since commit e52128cd0e555f16c86812a21e92f27ca5d76152:

   migration-guides: add release notes for 4.0.15 (2023-12-18 10:49:00 
+0100)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to 3233b53d18af91b836689fc18a2fe1cf33347930:

   migration-guide: add release notes for 4.3.2 (2024-01-09 17:12:11 +0100)

----------------------------------------------------------------
Adrian Freihofer (1):
       ref-manual: document cmake-qemu class

Enguerrand de Ribaucourt (1):
       manuals: document VSCode extension

Ilya A. Kriveshko (1):
       dev-manual: update license manifest path

Jörg Sommer (1):
       documentation: Add UBOOT_BINARY, extend UBOOT_CONFIG

Lee Chee Yang (1):
       migration-guide: add release notes for 4.3.2

Maxin B. John (1):
       ref-manual: classes: remove insserv bbclass

Michael Opdenacker (2):
       contributor-guide: use "apt" instead of "aptitude"
       ref-manual: update tested and supported distros

Simone Weiß (1):
       dev-manual: start.rst: update use of Download page

  documentation/contributor-guide/submit-changes.rst        |   2 +-
  documentation/dev-manual/building.rst                     |   4 +++
  documentation/dev-manual/licenses.rst                     |   2 +-
  documentation/dev-manual/start.rst                        |  33 
+++++++++++++-------
  documentation/migration-guides/release-4.3.rst            |   1 +
  documentation/migration-guides/release-notes-4.3.2.rst    | 246 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  documentation/overview-manual/development-environment.rst |   8 +++++
  documentation/overview-manual/yp-intro.rst                |  20 
++++++++++++
  documentation/ref-manual/classes.rst                      |  41 
++++++++++++++++++-------
  documentation/ref-manual/resources.rst                    |   5 +++
  documentation/ref-manual/system-requirements.rst          |  17 +++++-----
  documentation/ref-manual/variables.rst                    |  39 
+++++++++++++----------
  documentation/what-i-wish-id-known.rst                    |   7 +++++
  13 files changed, 375 insertions(+), 50 deletions(-)
  create mode 100644 documentation/migration-guides/release-notes-4.3.2.rst

Thank you in advance,
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


