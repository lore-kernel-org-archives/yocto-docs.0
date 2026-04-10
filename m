Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 890FEF44847
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 12:18:12 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.154737.1775823483331716308
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 05:18:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HZzaHEs/;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: adam.blank.g@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b9b1ffbb9f5so286165166b.2
        for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 05:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775823482; x=1776428282; darn=lists.yoctoproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xkDUV8S2Y6GKUKSTt69rtxY9gvuBYoDqgrgOf764oP0=;
        b=HZzaHEs/OlG1b9pexBIO2rg18bxZ4W7xb/jDUo7rtzQQKEJgrQn8m5zcaj2SaEp2up
         FVHY3OGMYMytKys6G2zyp8doCEhDpj7SJpwylhG+RHTcBJV/54CIQMsNNnPCtNCkygdx
         bKYB6Wxl9uaGp0dt6EAF7iCD2xqPHUdlyDG+IwaH1O2+gnF/Mc/60yogpDMXaELL95c1
         OCaZW22kA/EEjAzYVKBCQP92svJT4O8IDfSHQdZbyMjbYudCbBkHQeNSKqNRPrJmpGAc
         7s8wMn50WV6eSSIvfaxUKzEJRKiyQo5BtuQN1pBh+Bu37BQUJZ0j3nhIBvkOM2UHFsTZ
         BOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775823482; x=1776428282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xkDUV8S2Y6GKUKSTt69rtxY9gvuBYoDqgrgOf764oP0=;
        b=iqc4O1+RM24sVskERI6nuWc6No+0xwjmETn+vFx2GXhyCQFochO83Av8sqUYdNpQLA
         Wemg7tGg/afwsh3TscrQFoEdUYTu3mJmQwoMNmeau4QETDPp0/j917pzIiTaHsVqTUcR
         /mrCcS+3cwb0MH/k4Jg7WrVBlYntERVzGYtxKlDCUejFvhqDhw2FkI8DklrBfdrgAjbW
         KbQ4FZOx4yvgrrx604MwP+IXp2ZIkbp+qZOoFU4zZippQzTZaMAvVze+acnhgV1xzsJc
         NfPFIYcZU9UJtxAhpkyAf+BgKyNhHgrwjJVIPdTmUy6BQuWhw5EMxFC+6TMt4J69mSSj
         rMCg==
X-Gm-Message-State: AOJu0YwX7BTowU4YOn/7F/b4YacuOOv9seNwPOUr67oV755x7Rurrien
	uz4FqGhtiW7+//LnMDlx8TT6tgMOQKpGz3xBVFTnQKQOVsPUVg4MfcYc
X-Gm-Gg: AeBDievByWN+hAq1pkYPNGMWYswWDBJmORmJi1rRRyfc+4DPpFU6HwZ6ZvMJHy3hcBD
	2FmfuGynJvnOQkirrLqpjgsr3YZ5D5kvDz0j7hNHLSIZ5sUKiKfUAAPdQIQLLAmikJPQMTEGwD/
	+o8oKBQnmBQIOo576HEV+qaWqyY/ZwHunYrf5S2y7I2QeHOSgj7vkAuU8MVfEXL9da96p6zJkfT
	2yE7DNHJhLedvuBmmd5P2/9iLFxCDjididb68T/Z9Dsx+S4Jwh7zsbEy4x1MUzg7MdIWzUVIWUN
	j/liKHw4KuZ1t5zda71Exd3LLTgDMHfit2ZTgSwZkEvB4jILAHG2vVI1ihmQyoKrp3bT6EkVG5o
	EGmd3PqGuzQYuZnEGF2Iht7GVS/DJRMbTazykTAABFRPb6KwEbVMMDuGCkYaelEiESJq3nzTLxH
	cm9Jv36OYk+9P4AOrZa1mFoLj2M4y4jQ==
X-Received: by 2002:a17:907:d109:b0:b98:8365:be with SMTP id a640c23a62f3a-b9d7279aa4amr162062266b.25.1775823481438;
        Fri, 10 Apr 2026 05:18:01 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:5694:dea1:688f:6eee])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6de8d69fsm74881666b.4.2026.04.10.05.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 05:18:01 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Fri, 10 Apr 2026 14:17:49 +0200
Subject: [PATCH v2 6/6] ref-manual/variables.rst: correct a reference to
 STAGING_DIR*
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-staging_and_packaging_vars-v2-6-211bce1349b1@gmail.com>
References: <20260410-staging_and_packaging_vars-v2-0-211bce1349b1@gmail.com>
In-Reply-To: <20260410-staging_and_packaging_vars-v2-0-211bce1349b1@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775823472; l=1173;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=4Muz2nBXRMAJPbqdygaj0BI64wbHJnaUHCm2jdAUDas=;
 b=QV7jXeriDSxzGFktC234tzuFr7J26rAat7fWGXZ7NWIslppNmjQXg0+JwgFwBl9sfLlWf090T
 uj+mr1IbU9OBmJDtViWYhJh9ZFWcY4cC2pbrqVvsebng6+a+QfHUDrx
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 12:18:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9229

The reference to STAGING_DIR* variables in the description of
DEPENDS was misleading, as it pointed at STAGING_DIR which is
unrelated in this context.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index af1475fb4..47c41c5b7 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2225,7 +2225,7 @@ system and gives an overview of their function and contents.
 
       The practical effect of the previous assignment is that all files
       installed by bar will be available in the appropriate staging sysroot,
-      given by the :term:`STAGING_DIR* <STAGING_DIR>` variables, by the time
+      given by the :term:`STAGING_DIR* <STAGING_DIR_HOST>` variables, by the time
       the :ref:`ref-tasks-configure` task for ``foo`` runs. This mechanism is
       implemented by having :ref:`ref-tasks-configure` depend on the
       :ref:`ref-tasks-populate_sysroot` task of each recipe listed in

-- 
2.43.0


