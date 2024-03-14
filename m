Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 897ACC54E5D
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 09:14:14 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.8361.1710407650457981591
 for <docs@lists.yoctoproject.org>;
 Thu, 14 Mar 2024 02:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=icI8jtN0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 79550240008;
	Thu, 14 Mar 2024 09:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710407648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=758Uz6i7oEsli/nw7CLM9W2stdlacUw13+fsgZTSMlg=;
	b=icI8jtN0LhfSmDAF2wL0L/VVyALPyq5yUQErEiScdut47pRblFKO8lNc2JXrUWE6y+lpod
	qDkso9QIWiKjFHWfUJHTgqx3eW+YhbKxuQqDRHNkB/qrrn2h/QngIVoNmjR/ZX1xpd7IPi
	CZ+a3WU+JjDeXeCzDCGUWQ+ji7y1kfLu+k3b/D944dP7ATxN1LMNSOJdP3DjmLLwcNrlkG
	D788LOi7r5s7ZsXf9klgIHCRdDYtSrjw/pwKXS+a1NciFTjDpxNWumFbZ48tOc4GlQ2vh3
	ljIUm4dHBoO5eYB5AEqjSbGR8des6QFL8Ej75ba9r7HfaxE+CEzXNglbtkGGig==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [kirkstone][PATCH 0/8] documentation backports
Date: Thu, 14 Mar 2024 10:13:50 +0100
Message-Id: <20240314091358.84025-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 14 Mar 2024 09:14:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4959

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Apply relevant patches from the "master" branch.

Geoff Parker (1):
  ref-manual: variables: adding multiple groups in GROUPADD_PARAM

Johan Bezem (1):
  ref-manual: variables: correct sdk installation default path

Luca Ceresoli (2):
  ref-manual: tasks: do_cleanall: recommend using '-f' instead
  ref-manual: tasks: do_cleansstate: recommend using '-f' instead for a
    shared sstate

Michael Opdenacker (3):
  dev-manual: packages: fix capitalization
  manuals: replace hyphens with em dashes
  manuals: document VIRTUAL-RUNTIME variables

Simone Weiß (1):
  contributor-guide: add notes for tests

 documentation/bsp-guide/bsp.rst               |  6 +-
 .../contributor-guide/submit-changes.rst      | 32 ++++++
 documentation/dev-manual/device-manager.rst   |  8 +-
 documentation/dev-manual/packages.rst         |  2 +-
 documentation/kernel-dev/advanced.rst         |  2 +-
 documentation/kernel-dev/concepts-appx.rst    |  2 +-
 .../migration-guides/migration-1.6.rst        | 26 ++---
 .../migration-guides/migration-3.0.rst        |  4 +-
 .../migration-guides/migration-3.1.rst        |  2 +-
 .../migration-guides/migration-3.2.rst        | 18 ++--
 .../migration-guides/migration-3.3.rst        |  1 -
 .../migration-guides/migration-3.4.rst        |  4 +-
 .../migration-guides/release-notes-3.4.rst    |  2 +-
 documentation/overview-manual/concepts.rst    |  8 +-
 .../development-environment.rst               |  2 +-
 documentation/overview-manual/yp-intro.rst    |  2 +-
 documentation/profile-manual/usage.rst        | 24 ++---
 .../ref-manual/devtool-reference.rst          |  2 +-
 documentation/ref-manual/faq.rst              |  4 +-
 documentation/ref-manual/structure.rst        | 10 +-
 documentation/ref-manual/tasks.rst            | 40 +++++++-
 documentation/ref-manual/terms.rst            |  4 +-
 documentation/ref-manual/variables.rst        | 99 +++++++++++++------
 documentation/ref-manual/varlocality.rst      |  2 +-
 documentation/sdk-manual/working-projects.rst |  6 +-
 documentation/test-manual/intro.rst           |  4 +-
 .../transitioning-to-a-custom-environment.rst |  2 +-
 27 files changed, 210 insertions(+), 108 deletions(-)

-- 
2.34.1


