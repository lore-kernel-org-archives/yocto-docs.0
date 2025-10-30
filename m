Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BBD0CCF9FA
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 15:18:07 +0000 (UTC)
Received: from smtp-bc0e.mail.infomaniak.ch (smtp-bc0e.mail.infomaniak.ch [45.157.188.14])
 by mx.groups.io with SMTP id smtpd.web10.183.1761837483799000343
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Oct 2025 08:18:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.14, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cy7610BQRznMr;
	Thu, 30 Oct 2025 16:18:01 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4cy7603RFkz53f;
	Thu, 30 Oct 2025 16:18:00 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH RFC 0/3] fix epub and latexpdf targets not finding glob
 images
Date: Thu, 30 Oct 2025 16:17:45 +0100
Message-Id: <20251030-fix-make-multi-target-v1-0-213616ed1f0a@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJmBA2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAyNL3bTMCt3cxOxU3dzSnJJM3ZLEovTUEt0Uo5RUyxSTtDTz1GQloN6
 ColSgQrC50UpBbs5KsbW1AAh+5o9sAAAA
X-Change-ID: 20251029-fix-make-multi-target-d2de9d4ff7ec
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 30 Oct 2025 15:18:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7921

Currently the `make all` target simply doesn't work, it'll fail the epub
build because of missing images (the ones listed in image or figure
directives with glob patterns).

The same can be reproduced with `make html epub` or `make html
latexpdf`. This is due to how Sphinx caches the output of the parsing
step and the way we generate the PDFs and PNGs from SVGs for the epub
and latexpdf targets (which are run after the html target).

This migrates us from this Makefile logic to
sphinxcontrib-svg2pdfconverter, or rather an in-tree fork of it.

Marked as RFC because
1) The source code of the plugin is licensed under BSD-3-Clause and
   IANAL so I don't know if it's fine for us,
2) I would rather use upstream and add sphinxcontrib-svg2pdfconverter to
   Pipfile and the docs building instructions, but we need the MR[1] to
   be merged and a new release made before we can do that. Once upstream
   merges it, we likely will need to add a recipe for it in OE-Core to
   be able to still build the docs with the docs toolchain I believe?

See the last patch in the series for a description of the actual
problem, a dive-in Sphinx cache and why I believe this is the proper
fix.

[1] https://github.com/missinglinkelectronics/sphinxcontrib-svg2pdfconverter/pull/31

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (3):
      sphinx: import sphinxcontrib.rsvgconverter sphinx plugin in-tree
      sphinx: rsvgconverter: add support for PNG output
      convert SVGs to PDF and PNG using rsvgconverter plugin

 documentation/Makefile                |  26 +--------
 documentation/conf.py                 |   5 ++
 documentation/sphinx/rsvgconverter.py | 106 ++++++++++++++++++++++++++++++++++
 3 files changed, 114 insertions(+), 23 deletions(-)
---
base-commit: 8b85245490ae0b19a9c3880ec31e55b42e19d094
change-id: 20251029-fix-make-multi-target-d2de9d4ff7ec

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


