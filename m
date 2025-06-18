Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D80BC7115D
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 15:14:04 +0000 (UTC)
Received: from smtp-bc0d.mail.infomaniak.ch (smtp-bc0d.mail.infomaniak.ch [45.157.188.13])
 by mx.groups.io with SMTP id smtpd.web10.1412.1750259641160069053
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Jun 2025 08:14:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.13, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bMnMB6FyQz3Pw;
	Wed, 18 Jun 2025 17:13:58 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4bMnMB2DGgzxMC;
	Wed, 18 Jun 2025 17:13:58 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 0/2] be consistent across all local :doc: references
Date: Wed, 18 Jun 2025 17:13:34 +0200
Message-Id: <20250618-doc-abs-path-v1-0-9f62e0ac92d2@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ7XUmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0ML3ZT8ZN3EpGLdgsSSDF1Tc6NUCyNzU1ND8xQloJaCotS0zAqwcdG
 xtbUA4XiU7F4AAAA=
X-Change-ID: 20250618-doc-abs-path-572e8275517d
To: docs@lists.yoctoproject.org
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 18 Jun 2025 15:14:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7104

The doc directive[1] allows multiple paths:
 - relative to the current document
 - relative to the current document going through the parent directory
   (e.g. via ../)
 - "absolute" (paths starting with /), relative to the root directory
   (which is documentation/ for yocto-docs),

This attempts at making the use of local :doc: directive consistent
across the whole tree by changing (and encouraging) all paths to be
"absolute" paths.

meld doesn't report any change in the HTML output after this series
applied.

[1] https://www.sphinx-doc.org/en/master/usage/referencing.html#role-doc

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (2):
      tree-wide: make the :doc: directive use absolute paths
      document how to use :doc: directive

 documentation/README                                      | 10 ++++++++++
 documentation/bsp-guide/bsp.rst                           |  4 ++--
 documentation/contributor-guide/submit-changes.rst        |  4 ++--
 documentation/dev-manual/building.rst                     |  4 ++--
 documentation/dev-manual/debugging.rst                    |  4 ++--
 documentation/dev-manual/new-recipe.rst                   |  2 +-
 documentation/dev-manual/start.rst                        |  2 +-
 documentation/dev-manual/vulnerabilities.rst              |  2 +-
 documentation/migration-guides/release-notes-4.3.rst      |  4 ++--
 documentation/overview-manual/development-environment.rst |  6 +++---
 documentation/ref-manual/resources.rst                    |  4 ++--
 documentation/ref-manual/system-requirements.rst          |  2 +-
 documentation/ref-manual/variables.rst                    |  2 +-
 documentation/standards.md                                | 11 ++++++++++-
 documentation/transitioning-to-a-custom-environment.rst   |  4 ++--
 documentation/what-i-wish-id-known.rst                    |  4 ++--
 16 files changed, 44 insertions(+), 25 deletions(-)
---
base-commit: b13bccbf3fb1890ac428a396f8c5081057edf555
change-id: 20250618-doc-abs-path-572e8275517d

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


