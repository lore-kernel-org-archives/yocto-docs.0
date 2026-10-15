Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F5ECCCA466
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 20:08:06 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6600.1792094874630746112
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Oct 2026 13:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=d/GKHIZT;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-202610152007503d969193f200020709-oohira@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202610152007503d969193f200020709
        for <docs@lists.yoctoproject.org>;
        Thu, 15 Oct 2026 22:07:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=siJugx+7r40oDXTlvyrU7SHQtI67cgEQ5Cjy/qalQVY=;
 b=d/GKHIZTawQNiMAz2nnpzsXaKcJsPt5BTTsNnw0t1a1n8c7gyeNY6+DZZF4E23HG7zXK8x
 /vAuLmJMScpJ6xoh5GsZV8bDd1FFO5X8V7EHEn5tRh8/iNaSv7V0mI4cBoy3Bu+LcNlxlVtf
 /kFcHKGcvaRu7xkAWQeUjzq0xYy9jSA58G8hA0tP1vofZk3PaoXrTFzCfyTGvOMLjg19KEQA
 tbkvOmljusr+JwzldNiBHgmvlOxMoQ4rSIXmEN0mHz8BMHpgwIXMKyOb4+jmEfFMxfeOGpbE
 yxnJzlooLd0XIYJs4peXp3l3RvsRJWrSsOStjZKbU0vfwhY8FsbRj7fQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 0/4] dev-manual/devtool: ide-sdk doc rewrite and Mermaid diagrams
Date: Thu, 15 Oct 2026 22:06:31 +0200
Message-ID: <20261015200726.2391599-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 15 Oct 2026 20:08:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10686

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Update the "devtool ide-sdk" section to reflect its current behavior,
and fix outdated non-patch local file handling docs (5.1 change).

Add workflow/architecture diagrams for "devtool ide-sdk", and convert the
existing devtool add/modify/upgrade flow chart PNGs to Mermaid too. The
Mermaid sources (.mmd) and the rendered SVGs are both kept in git, so the
documentation build needs no Mermaid tooling or network access.

Changes in v3:
- Add the rendered SVGs to git next to the .mmd sources, instead of
  rendering the diagrams at build time (drops the sphinxcontrib-mermaid
  extension and the CDN-hosted mermaid.js).
- Restore PDF support, as the SVGs are converted by the existing
  rsvgconverter (not tested yet).

