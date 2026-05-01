Return-Path: <bijak.dawid@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C53ECD3425
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 09:14:51 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10755.1777626884001472259
 for <docs@lists.yoctoproject.org>;
 Fri, 01 May 2026 02:14:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Dpsa+Qgh;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: bijak.dawid@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso22307195e9.1
        for <docs@lists.yoctoproject.org>; Fri, 01 May 2026 02:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777626882; x=1778231682; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPYOvIXYVVLcRB7cc8+Q6H0pGIMrwUSocsGb/HeRdXE=;
        b=Dpsa+Qgh23wsjc1egfXDj/8AySC3oEvuUuo2Rc7fkOOWZEzyILwNDe038fbovwKtVJ
         2bjNJwcTU1iqi9yauM8jL+IaY0LOfWoQ9mxlk1YRVcQEe9q4L7I0ewqAiKy7LuknGXb3
         gluLiCDun/2wHWberiDWteQxGgmtZqi1hAqUzTRz2gZ6RDe8rksr3vwtBhGnFVzAt0ww
         QYJybV4PiomxRTROMCBWKNsRvQQVNnw1JobIdB08YMpHmXCm92oJ5IMM32QHLq1Fvv4z
         Nxm9TrMhw6sdod5mnTbHZDFs4UEg7Y/I86/JGGSna15S82AjdGEw93cUfbPsrTUw36EC
         iaaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777626882; x=1778231682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dPYOvIXYVVLcRB7cc8+Q6H0pGIMrwUSocsGb/HeRdXE=;
        b=kdI/6ErabVBPVVouGJvuGdi4C0WYk1SphBqrqVH+rlyb5Cm+VCRip+avZWrj6Ldkub
         WDEqrcjI0j3zwF1RRq5wLQkwlKSTFLQ7Kh8LbG6R/yPtExzLYOZcsYqhs1hEpVwAYXh3
         FBCi4ZAssm+Axskm//ROE5yHNOBJJCGq4pGbhsn46zbWVKKsKDZyLF6dMGQ/BH4zjpXT
         49TR9tJAA29SZTXkgpNepOo9HzghPqQzIeqcoo5ASU/eWKZwIBAOKHz6BZsTvp+ZOOEu
         LseAMARmoTMaTuIYUZbcKBaCkJqCtqwGJaJTHCZjFRM9j1Gr6Ito6p9yrwhzkwVNLvQr
         lNUw==
X-Gm-Message-State: AOJu0YxqUluyXpu8InfYa80PitQHbLHivPYWLPvpsqxdKGymkwrCxxsB
	Dx5GllijqZ7VwzpO2TdeKM89Iu9UQfGfnlCc2BB+uRz1cp3ceOCem2xP
X-Gm-Gg: AeBDies/ubiCeU3UpAN1z2yTSP3iuHTIc3pR0IRzDz6Y+DAAz7uSVmDATm9e8DmJAAi
	pqoNE8MG+TxS5o8xyj4Qq/aRKEeh2T//0HhEe56j0VDTuKgwlmKcn+/rNQ99veHoXwkbILkujTg
	B39DP93UyoUGJVWUmO0UTJdc5aYe2DdslmmFlXrlEJLCL0GwRpoGJmoUp1deeRoxv92ljUp2C7A
	QHJpnkztP75w816Q0bMnyB65k5UOVLxHqG7/wNzHLv8vVS3w+mO4a8ab5tX59cX5WlDUHu/RPHY
	z5tTT0htB8/ij1b6ECLsIPTUsSrowXD8PDOicKcLDBzB75V7Oy3rhYBZptExwl6Rlc1hEAd5Kes
	uiACg7rj6n17JbpeQfl6dISS8WGtDYDkm/QKukzG3VwnFJ2bu61Ym3szRTg98xChZ9v2+30dcNL
	i7SGBUzBFrxCfSuM4qsMjp624r/hXmLAMTUgrcJ/LTTDlz8pcZIL1WN6tDJe0anDeRRNrNK27Y6
	f7CzIKDXbLYezVv1f4+xKan9G5DLxbq8Z/8sHqXB+UK71ABCPm9BxPP5SQkmFQ=
X-Received: by 2002:a05:600c:c058:b0:487:4eb:d125 with SMTP id 5b1f17b1804b1-48a83d6f154mr79813585e9.9.1777626882376;
        Fri, 01 May 2026 02:14:42 -0700 (PDT)
Received: from thinkpad.fritz.box ([2a02:8070:d188:380:6a5d:7450:e8b3:758])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48a8fe953besm12097955e9.2.2026.05.01.02.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:14:41 -0700 (PDT)
From: Dawid Bijak <bijak.dawid@gmail.com>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	quentin.schulz@cherry.de,
	richard.purdie@linuxfoundation.org,
	Dawid Bijak <bijak.dawid@gmail.com>
Subject: [PATCH v2 4/4] doc: bitbake-user-manual-metadata: move inline python examples to inherit section
Date: Fri,  1 May 2026 11:14:18 +0200
Message-ID: <20260501091418.76994-5-bijak.dawid@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260501091418.76994-1-bijak.dawid@gmail.com>
References: <20260501091418.76994-1-bijak.dawid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 01 May 2026 09:14:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9392

The two inline Python examples,

  inherit_defer ${@'classname' if condition else ''}
  inherit_defer ${@bb.utils.contains('VARIABLE', 'something', 'classname', '', d)}

are presented as inherit_defer-specific techniques, but they work
with plain inherit too. Their placement under
inherit_defer suggests deferred evaluation is required, which is
not the case: the ${@...} expression is evaluated when the
inherit line is parsed in both forms.

Move the inline Python expression examples from the inherit_defer section
up to the inherit section, since they apply to both directives.

Signed-off-by: Dawid Bijak <bijak.dawid@gmail.com>
---
 .../bitbake-user-manual-metadata.rst          | 25 ++++++++-----------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
index 0c7c3ff99..4b1aeedc1 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
@@ -803,7 +803,17 @@ An advantage with the inherit directive as compared to both the
 :ref:`include <bitbake-user-manual/bitbake-user-manual-metadata:\`\`include\`\` directive>` and :ref:`require <bitbake-user-manual/bitbake-user-manual-metadata:\`\`require\`\` directive>`
 directives is that you can inherit class files conditionally. You can
 accomplish this by using a variable expression after the ``inherit``
-statement.
+statement, as in::
+
+   inherit ${@'classname' if condition else ''}
+
+Or::
+
+   inherit ${@bb.utils.contains('VARIABLE', 'something', 'classname', '', d)}
+
+In both cases, if the expression evaluates to an
+empty string, the statement does not trigger a syntax error because it
+becomes a no-op.
 
 For inheriting classes conditionally, using the :ref:`inherit_defer
 <ref-bitbake-user-manual-metadata-inherit-defer>` directive is advised as
@@ -840,19 +850,6 @@ defers the evaluation of ``${VARNAME}`` until the end of
 parsing. Assuming ``someoverride`` is in :term:`OVERRIDES`, ``${VARNAME}``
 expands to ``myclass``, which is then inherited.
 
-Alternatively, you could use an inline Python expression in the
-following form::
-
-   inherit_defer ${@'classname' if condition else ''}
-
-Or::
-
-   inherit_defer ${@bb.utils.contains('VARIABLE', 'something', 'classname', '', d)}
-
-In all cases, if the expression evaluates to an
-empty string, the statement does not trigger a syntax error because it
-becomes a no-op.
-
 See also :term:`BB_DEFER_BBCLASSES` for automatically promoting classes
 ``inherit`` calls to ``inherit_defer``.
 
-- 
2.48.1


