Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53204CAC597
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 10:25:02 +0000 (UTC)
Received: from smtp-190a.mail.infomaniak.ch (smtp-190a.mail.infomaniak.ch [185.125.25.10])
 by mx.groups.io with SMTP id smtpd.web11.10706.1758191091903413055
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 03:24:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.10, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cSBb56FdPzJ28;
	Thu, 18 Sep 2025 12:24:49 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4cSBb50nXMzNnd;
	Thu, 18 Sep 2025 12:24:48 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 0/7] contributor-guide: submit-changes: improve
 instructions on commit content
Date: Thu, 18 Sep 2025 12:24:38 +0200
Message-Id: <20250918-submit-patches-v1-0-28abd2919df0@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAObdy2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDS0ML3eLSpNzMEt2CxJLkjNRiXZNkI3Nj40TjFFOzFCWgpoKi1LTMCrC
 B0bG1tQCtleSDYAAAAA==
X-Change-ID: 20250918-submit-patches-4c2733a3d56d
To: docs@lists.yoctoproject.org
Cc: Barne Carstensen <barne.carstensen@danfoss.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 18 Sep 2025 10:25:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7543

This hopefully improves instructions on how to write a proper commit for
submitting to the Yocto Project/OpenEmbedded various projects.

This was prompted by some new contributor following the instructions and
coming up with something different than what we had in mind.

Then I got carried away and fixed/improved a few other things in this
document.

This is opinionated from someone who's used to deal with mail-based
contribution so please feel free to nitpick/do bikeshedding/suggest
something else even more than usual.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (7):
      contributor-guide: submit-changes: fix improper bold string
      contributor-guide: submit-changes: clarify example with Yocto bug ID
      contributor-guide: submit-changes: align CC tag description
      contributor-guide: submit-changes: make the Cc tag follow kernel guidelines
      contributor-guide: submit-changes: reword commit message instructions
      contributor-guide: submit-changes: number instruction list in commit your changes
      contributor-guide: submit-changes: make "Crediting contributors" part of "Commit your changes"

 documentation/contributor-guide/submit-changes.rst | 186 +++++++++++----------
 1 file changed, 96 insertions(+), 90 deletions(-)
---
base-commit: e77139b5c616e6e5ad436eb91416fd804389425f
change-id: 20250918-submit-patches-4c2733a3d56d

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


