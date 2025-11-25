Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EC53D0E6FB
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 14:53:20 +0000 (UTC)
Received: from smtp-42ad.mail.infomaniak.ch (smtp-42ad.mail.infomaniak.ch [84.16.66.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18720.1764082396205744968
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Nov 2025 06:53:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.173, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dG5KN5lD5zt3n;
	Tue, 25 Nov 2025 15:53:12 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4dG5KM6vL7ztJM;
	Tue, 25 Nov 2025 15:53:11 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 0/2] make sure Quick Build section and System Requirements
 are in sync -- cover
Date: Tue, 25 Nov 2025 15:52:59 +0100
Message-Id: <20251125-quick-start-requirements-common-v1-0-2c872b2fd45f@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NQQoCMQxG4asMWRtoy7SiVxEXQ/3VIG01qSIMc
 3eLy2/z3koGFRgdp5UUHzFpdcDvJsr3pd7Achmm4EL0PkR+vSU/2PqinRVDioLajXMrpVVO88E
 hJjenvKdReSqu8v0fTudt+wENDjeWcQAAAA==
X-Change-ID: 20251125-quick-start-requirements-common-6490e56046c7
To: docs@lists.yoctoproject.org
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Nov 2025 14:53:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8120

The instructions in the Quick Build section are targeting Ubuntu users
and must be straightforward to follow, without having to follow a series
of link. There is some requirement (specifically locales) that didn't
make it to the Quick Build section, so let's make sure it is in sync
with the section in System Requirements by simply moving the whole rST
content to an include file instead of just the apt instructions.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (2):
      tools: ubuntu_docs: remove duplicate python3-saneyaml
      make sure Quick Build section and System Requirements are in sync

 documentation/brief-yoctoprojectqs/index.rst       |  7 +----
 documentation/ref-manual/system-requirements.rst   | 33 +---------------------
 .../ubuntu-debian-host-packages-nodocs.rst         | 33 ++++++++++++++++++++++
 .../tools/host_packages_scripts/ubuntu_docs.sh     |  2 +-
 4 files changed, 36 insertions(+), 39 deletions(-)
---
base-commit: bcb6a7c8a401ceadf69a4c0c14dbc89f85ffdebe
change-id: 20251125-quick-start-requirements-common-6490e56046c7

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


