Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B575F4610E
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 13:31:55 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17465.1774272711624315381
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Mar 2026 06:31:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Snb7NuCn;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439b97a8a8cso3089553f8f.1
        for <docs@lists.yoctoproject.org>; Mon, 23 Mar 2026 06:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774272710; x=1774877510; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/eH12ebjRc3emG9YHSCbapiJsdaHs+6cZH+Z2n/94Ok=;
        b=Snb7NuCn2ipSqEzG2dmuE/vxgxWCBLDSrkm4IJBF41gHnPA+zWRZl7MCll3T6PNXip
         mjgJMb+ZPbayifHGXqbAY1sSiP5ZCcrMklDU5a7ax06EaCjBuMLis+WvkYiVbcvo3bwo
         ia/5o+Yy0+gyHY3hzoc8RJzNJS0p9MXlZ2oZsdJIGyhwAqUEndyGzk1QQZToeqcM/BQ+
         amDRVwb43guokBzM4GUwFuInOXM0dB/mZrvXCYuoYpjUvkh/G7NYFbYhDSsyXuT7Jlq+
         5+4GfDJC+A1n0lhh3crQT0MHLB137cC5g7D8ly1ZLtbW/3BfphRh65ugVihAWT0aplLM
         zijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272710; x=1774877510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/eH12ebjRc3emG9YHSCbapiJsdaHs+6cZH+Z2n/94Ok=;
        b=R401tsdvcCp6mui4Jmsnd2TIYhK6L+Kk8l+f7G8N5ZcGFjFep5ltROZw0Zq0S6a+m5
         2Glqq+ttZNuikWYcv3RXlaDgrKp2fuVDsQQcptmjKFwZSrO/lCXTCa1Ytpmrv9cR2zpO
         1h0JtTImHZ3N1FJBHaML0jtcxiUydF2ohSE8eE13CBoImpCBgOZodfw6fon4TjLLlmem
         GwcZdKJI1Vg+uanNLQ/P9AWcDs8dSyZE1WQsZzIOE2UCctk0WUPrVi6CCPy78QVVUfUU
         HrBfzZT2pOZVSyitg1KkbnNrpfAh3JemRUNkgRB/2LiVCf6oKDjhym8xg13KQBnuKKIm
         /Q8Q==
X-Gm-Message-State: AOJu0YzBprNNpmNYUpsKJKksmXvGYirzEgL10w8YZdmVGGRiEG2aGPN7
	Q1B/knubzqWnAX3R6ZPgMMznl35zsZ+GIfxoYvGQ4QcJwEOUrgjPXTbM3mCtwg==
X-Gm-Gg: ATEYQzzijBJeEdFjQntHX56oKQxYkUMCFCLZ5C/5mk1VJukj1FrewwvgcdAWydGiKZy
	02WAzuFciEOb+fJW91QjB5wyWeOUCc3yYBFuGJivb8daXHhaW1PV1xoCh222rcKWBAbxq4QhHQd
	chiGtU8BgLUSdKk/F5LggzrRboFMimRqXnq85Qnj6kAZGiDLPJBBdLcCNVOJO2tORmTZYj1PFNK
	kaPZuEvt/FfbtBUaU+PxxqHRMEcRlEs3lMdjMHMpPgEb088QFUyiRHEHO49s5D7nva/qErr3VIi
	QxRK6wEoTStsGXcTrujjkZPCiZZsFgt9AOcuIs5w29ExdUguTMMUL0jDUctOb+PPfPgxshKEmkc
	VuVx3OP2mRW2ox22lXlZM5skcU+4Pav4/xFzY260TYOuutTHbSKlNScD/CGTPw0U7mdUzjC/uPw
	dvulxEZlNE/ZdFEzpqeZisp+NClMY9t2YsszK4ic0nh0hUxEXZDKXR
X-Received: by 2002:adf:f583:0:b0:43b:6a55:e26a with SMTP id ffacd0b85a97d-43b6a55e28cmr10032691f8f.51.1774272709399;
        Mon, 23 Mar 2026 06:31:49 -0700 (PDT)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae16fsm30649042f8f.8.2026.03.23.06.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:31:48 -0700 (PDT)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: docs@lists.yoctoproject.org
Cc: antonin.godard@bootlin.com,
	stefano.tondo.ext@siemens.com
Subject: [PATCH v3 0/1] ref-manual/dev-manual: document new SPDX variables and capabilities
Date: Mon, 23 Mar 2026 14:31:42 +0100
Message-ID: <20260323133143.1185958-1-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Mar 2026 13:31:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9125

Document the new variables and features introduced by the SPDX
enrichment patch series merged in OE-Core.

This adds reference-manual entries for the new SPDX controls and updates
the SBOM manual page to mention file exclusion, supplier metadata,
ecosystem-specific PURL enrichment, and build invocation traceability.

Changes in v3:
- use ``Build`` literals instead of invalid glossary references
- use :term:`BitBake` instead of plain "bitbake"
- add missing `SPDX_BUILD_HOST` documentation
- replace `local.conf` recommendations with configuration-file wording
- fix SPDX variable entry ordering in `variables.rst`
- use ``SPDX_IMPORTS`` literals instead of invalid glossary references

Stefano Tondo (1):
  ref-manual/dev-manual: document new SPDX variables and capabilities

 documentation/dev-manual/sbom.rst      |  18 +++
 documentation/ref-manual/variables.rst | 177 +++++++++++++++++++++++++
 2 files changed, 195 insertions(+)

-- 
2.53.0


