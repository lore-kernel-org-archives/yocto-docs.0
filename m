Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web11.58375.1598894757629799061
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Aug 2020 10:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sjLXg/qV;
 spf=pass (domain: gmail.com, ip: 209.85.166.193, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f193.google.com with SMTP id w3so1855057ilh.5
        for <docs@lists.yoctoproject.org>; Mon, 31 Aug 2020 10:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0pcz4S6bB+j6lBC2haJ1OdHX+7YF32fe8wuNvD2PS+4=;
        b=sjLXg/qVDdFAgNlRgnYrXhUwtWojs1+CRBTT33BBLVuhiu43kUZ/17dYhsLlE3OwMq
         S1puqrkmr/HA53U13ugNHM3HJbRkVpRNr1MheRJy56m0yViPIET/meHkITxpsIR8yZa3
         0/STIArOWxba+5lEafwwn9oqevvgnY4gVYM8t8H/dQx1Hr9VALNbtCVuW1rnjNzF2KXP
         joMcEwP7v/O/UN57xOsfV9DNeflJ/kfqfFBgdCoCJXWP5HChVWiOoCDbeFZyzmjKGX63
         uRuuRhq3qjs8WzGTUALMAh9CoSFQEvzdp1E3c9jFMH37MzbPiaj8v0pX2PE9FEC2c96w
         S6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0pcz4S6bB+j6lBC2haJ1OdHX+7YF32fe8wuNvD2PS+4=;
        b=HDeHJ+io8+0ee2xvpFBIhHC2IF/8DEMvNtfPT6B8cMs11Dw5SYW1OCAppzpULcaoE1
         JMHeH+EyD5xGs2ybcObcsAkA/Yxq11IS71bBnRkOHTp26lAMhn71JJO3p7rjVW0lyokB
         DIg8OoK/2heK4foLsuIAlsJh3bGdtm9+txSerfD8xmvGS/G6HjyYHOIXt9iGxWjhV5gj
         gvAQqPKTwdY5RcFN/kxxs80wiTFy3fLR6lGPbJAPFQS0K1hBRB8SBP7uLKlKuJNpwtjt
         aPS+ZeEuXWY52fC0iSE0bnav0LgkdtodYgcbMaWGY9qwenAdVL6lsiOHc1w/+MSzeF4a
         FWWA==
X-Gm-Message-State: AOAM530f6iB3DnU8qwbI99aRN8aJFToQk2HB8VsVy9ztnq60I8Z96syy
	hs2oLdXAM7VbPiVq48vcgSL2+k9UVxQ=
X-Google-Smtp-Source: ABdhPJyhgaAYhAd209x6cUtUme/C61r9SgfmVoSr99lOvb4d4ZGGYxmsg5D8OCxawVEMEWYUT9ABRw==
X-Received: by 2002:a92:d704:: with SMTP id m4mr2122514iln.272.1598894756667;
        Mon, 31 Aug 2020 10:25:56 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:7282:816:6ef9:8e8c])
        by smtp.gmail.com with ESMTPSA id u25sm3066686iot.35.2020.08.31.10.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 10:25:56 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Joshua Watt <Joshua.Watt@garmin.com>
Subject: [docs][sphinx][PATCH] sphinx: dev-manual: Clarify that virtual providers do not apply to runtime dependencies
Date: Mon, 31 Aug 2020 12:25:53 -0500
Message-Id: <20200831172553.35236-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joshua Watt <Joshua.Watt@garmin.com>

Clarifies that virtual providers are only used for build time
dependencies specified with PROVIDES and DEPENDS, and do not apply to
runtime dependencies specified with RPROVIDES and RDEPENDS.

Signed-off-by: Joshua Watt <Joshua.Watt@garmin.com>
---
 documentation/dev-manual/dev-manual-common-tasks.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index c9b8a834c..a54379fef 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -2000,6 +2000,12 @@ The following lists specific examples of virtual providers:
 
 -  ``virtual/libgles2``: Provides ``glesv2.pc`` (i.e. libGLESv2).
 
+.. note::
+
+   Virtual providers only apply to build time dependencies specified with
+   :term:`PROVIDES` and :term:`DEPENDS`. They do not apply to runtime
+   dependencies specified with :term:`RPROVIDES` and :term:`RDEPENDS`.
+
 Properly Versioning Pre-Release Recipes
 ---------------------------------------
 
-- 
2.28.0

