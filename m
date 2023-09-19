Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 849FECD5BCC
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 14:39:57 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.10924.1695134391622477899
 for <docs@lists.yoctoproject.org>;
 Tue, 19 Sep 2023 07:39:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IhlWd2RB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BF35E40007;
	Tue, 19 Sep 2023 14:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695134389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vfa4DDYFEaEBQ+dWBXN/Vsh/Zlm6mO56IynHcWWQROE=;
	b=IhlWd2RBlpdHfaTSQQyeqmv7BzJQTOUrU3OlqpBI9Fxx1gIN+0LKLU7qB8gTTllb/p8Rbd
	6FsK087whjWsXitZAiYcQt/0ZFjNTAb7TpY4HLSThhZlYp35r01Zwpt5WY56oyO+IU8lnV
	zUT4jgXBFi7FBu2mhbhGeyVUtZuh4k036OPSSYgNNtK2GZ+yogCvg0R7abDGgxmQHF39jG
	sevJgX+3qxK+GwVkCQrQHeQlEBBu2e3+yZZK0SnGXs7byPatCEuXkF2nt05jovODuXoeL4
	Lw+/lhUKdM96EI8R7KBHEsEj3HblryJipjy+n/EovzMXKDpb1Yd8sZH3XM39kg==
Message-ID: <bfa5ee5d-206e-9357-c486-73023990d8b3@bootlin.com>
Date: Tue, 19 Sep 2023 16:39:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
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
 <docs@lists.yoctoproject.org>; Tue, 19 Sep 2023 14:39:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4236

Hi Richard,

The following changes since commit 7ec90b6af4dc32dbe313b77d17297e19c809bb3c:

   README: Update to point to new contributor guide (2023-09-07 11:27:06 
+0200)

are available in the Git repository at:

   git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to 318261d8ea91c2373709a9c1e82304ab7e9e9a3b:

   sdk-manual: extensible.rst: fix multiple formatting issues 
(2023-09-19 16:31:50 +0200)

----------------------------------------------------------------
Michael Opdenacker (6):
       dev-manual: new-recipe.rst fix inconsistency with contributor guide
       contributor-guide: recipe-style-guide: add Upstream-Status
       dev-manual: licenses: update license manifest location
       dev-manual: licenses: mention SPDX for license compliance
       dev-manual: disk-space: improve wording for obsolete sstate cache 
files
       sdk-manual: extensible.rst: fix multiple formatting issues

Roland Hieber (2):
       template: fix typo in section header
       ref-manual: point outdated link to the new location

Ross Burton (1):
       manuals: document LICENSE_FLAGS_DETAILS

  documentation/contributor-guide/recipe-style-guide.rst |  81 
+++++++++++++++++++++++++++++++++++++++++++++++
  documentation/dev-manual/disk-space.rst                |   8 ++---
  documentation/dev-manual/licenses.rst                  |  42 
+++++++++++++++++++------
  documentation/dev-manual/new-recipe.rst                |  13 ++++----
  documentation/migration-guides/release-notes-4.3.rst   |   5 ++-
  documentation/ref-manual/qa-checks.rst                 |  10 +++---
  documentation/ref-manual/variables.rst                 |  17 ++++++++++
  documentation/sdk-manual/extensible.rst                | 254 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------------------------------------------------------------------------------
  documentation/template/template.svg                    |   2 +-
  9 files changed, 259 insertions(+), 173 deletions(-)

Thank you in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


