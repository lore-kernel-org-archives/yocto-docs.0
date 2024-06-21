Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B14AC27C4F
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 10:43:29 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.70024.1718966599184719744
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Jun 2024 03:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=je1gTh3X;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-57cbc2a2496so2215862a12.0
        for <docs@lists.yoctoproject.org>; Fri, 21 Jun 2024 03:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718966597; x=1719571397; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qr8+Y2GlL/II0Zhp6/rHKwAJ5Il0RQCHCQTG2T/doPU=;
        b=je1gTh3XLWlPloos0kEu6to5dCGD8RGnSF+5mJWTJzDNtDzquRQNXNqgiEjpeCAggs
         mmh2LuTJ90mEcdWp4A/QQxo6BNA6xxTfOWIvLSrrqENG42z3/IDHK3bV3Wpd/EDHhRwE
         uZVYMrmhUUAED2q5fca/X+3pg28QB3INsUKrM2B9KHwCboS1Q6pN79dOpgkGP4m08OEt
         e7FUEACUJpFZarkGckink6Iv67qRruumbDlIgJlh+v/xXpY10DB8boyZnsxyXQeJZg35
         nR5g/9jYv8okthXo37bNw9YcxugD0HtzOgqmdlZfO6UMg9+zJwTCUFLzvMIcbdId7Cut
         eoaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718966597; x=1719571397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qr8+Y2GlL/II0Zhp6/rHKwAJ5Il0RQCHCQTG2T/doPU=;
        b=xPmJr4cKV/jHJn0a/e2ROF/UMUSHQSuvncbBPD7CdOd/2rVfe2NUaeqrmqdTwZwWfO
         Up+RksoOpiTRRrG2aqTls5rsBo66fhUzziALDzinQBpwHKv5v64amCPh2t8ybTBLfB34
         vezZCH0lHwj0N5Bv2DlG9xdRLPlF0nbOy2t85a3Ef1mDFhIrvdy9WHmZoYcd6dNeYEe4
         lMNUfaOUeAjXAHd9qJmOACWss7viEAbTdi/mQtAYZ+w0eoBz343KvIFaVSdzHdA2qM/n
         50b/zCy1hNjnPQ8rM3HHXRE900p8kuKINlGblEwqTMHvElGihJLrA4MHFP1gaFtAketf
         55vw==
X-Gm-Message-State: AOJu0YzrdPq2AIbZsveJueEPyjJTR7VZkXYRovGV7Hj6zDYRMVHuw/JK
	nnmzEXIz7leNdHDe77ZA3oM7uJft6FyEYNKgR6jMOOK9+lw1XYfxusWa+A==
X-Google-Smtp-Source: AGHT+IEBodBrUHDEIHI9WKhJ9JyanrvLvDKok+rn9C3FgcCl38ZLntpulh2jFRKbJpUDVjxDys95fw==
X-Received: by 2002:a17:907:a787:b0:a6f:ad2f:ac4b with SMTP id a640c23a62f3a-a6fad2fad01mr541292666b.2.1718966597262;
        Fri, 21 Jun 2024 03:43:17 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf48b47fsm70072266b.59.2024.06.21.03.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 03:43:16 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] ref-manual: rename RECIPE_UPDATE_EXTRA_TASKS -> RECIPE_UPGRADE_EXTRA_TASKS
Date: Fri, 21 Jun 2024 12:43:12 +0200
Message-Id: <20240621104312.2842778-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 21 Jun 2024 10:43:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5299

This follows the variable rename in oe-core.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 16b449d6b..c0cc8fb33 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7086,7 +7086,7 @@ system and gives an overview of their function and contents.
       The default value is ``"${WORKDIR}/recipe-sysroot-native"``.
       Do not modify it.
 
-   :term:`RECIPE_UPDATE_EXTRA_TASKS`
+   :term:`RECIPE_UPGRADE_EXTRA_TASKS`
       For some recipes, after the new source has been unpacked, additional tasks
       may need to be run during an upgrade. A good example of this is recipes
       which inherit :ref:`ref-classes-cargo-update-recipe-crates`, where the
-- 
2.39.2


