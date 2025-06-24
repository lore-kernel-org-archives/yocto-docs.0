Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32AA7C77B7F
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 09:12:07 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.4267.1750756319329259904
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 02:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ANBUOkyN;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ad8a6c202ffso959002966b.3
        for <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 02:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750756318; x=1751361118; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SQ2PDyW3B9VEMNiHmfFORv8L4MhaErCjqUeLUHkM85c=;
        b=ANBUOkyNVXnkDQlWzjerR9eXo6bz69ROnUyK0LhH5xee/IErZaIRGRRq9ZSCty8j/s
         PwlGz4QR4l5pDcjsryvW9xvb/Kf8U/p8d4/imfK1/eJNhBPCdhrXg8nU50lLx/LpHXZG
         yW9sGFAEn31C3/TAMYTSGwTPCcRler57CeO+d2EkoTQo19iu5yLmBzqJFB9sE6MXj1iH
         vgk2G+P/hfWWqn0JksskbQ6EeSVLQPU+ywun2o0qDoEiaKxBQdspksWwNntcPWNcZy2M
         jrNb4z/IE/mjfoT/NuMFtW1ugYFeF7RpEMAjlUM9DQjqidpzBvij0txlnNP/YmWiKIpY
         9ofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750756318; x=1751361118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQ2PDyW3B9VEMNiHmfFORv8L4MhaErCjqUeLUHkM85c=;
        b=xMNsU4RudPHJmzBzTIrhMK0DzXJeRF2bBvsJR+cSehDTFmAEbN+2Wnr08kw7wQUFKH
         +GdHJL/wfYxTIdPNcMy3ZDjhTKfhjS/3wszMw560pGy7F9+HdZm3RthvumiZVJASNiDE
         Ol42h0DttLkmWC4+fp6hPuWQayaKwSRROuw3hzlomv+EDmLhIp76fKXYbqZN4QlitV20
         9gwCjn4GadGFvZwpb8Go9pSgcA5P4QdrQ55t/+ySO9yCXgrZVofTydfe/vRTatbYAeCm
         yBbpdlSVtAUJysa63CtHTEU5X456XAZr3AnloNbKMczcd6sVxJUuqdbLIUFT9KWdji7u
         SBag==
X-Gm-Message-State: AOJu0YzTerwEO34UWNIa78Zl8WPJbKSKNQPOkbpmTaN9D+Ci40/MDnl9
	OUQvWJAR8gPQSYcRMqYzkKupmvw1kUksFMmhl2XrDCq6JjCH2M5wD0uJvdJSWw==
X-Gm-Gg: ASbGncuIllfnfeHMCIIIXjLYneHtbcsfP4SwLhAj4hNVaiyWGmBGTcoM56wJF0nwX8i
	1eYaWkr7iPnotskURjMRIZFODupsB9oJNfLdmUElyLVdmUhN5uVL/frT0DoxVRZ9T7RCB2uOSoC
	mQczedDzUQGdc812BoDdS5mTYXuO7SU6ocbouD8p/DHrmoidDgWaFgk74v3eyWwEImKN6c2wUAd
	SVCGnwaoWla8KTK8r4cr2QxWkeB/E+eeKT6itZ2gOafStTsQK4usWKpCi5wvFS8HUsnspa5VdxQ
	BnnGQcOgF2K4XBjjSGMKXg8GYM1tmMx1I7yVOtSyyLTuS2OJZiDsTBMkUqVMaMajuPF9t8LKKy1
	JU85bQSQHvZZ4yErM0fJXgYk=
X-Google-Smtp-Source: AGHT+IGouYv+1sSwNPeubN6gk7jMqf3zCRphYLL4vaRAqQygMrp9QzxWZ4dd/Bfw8AuwReQX7IGSHg==
X-Received: by 2002:a17:907:60cf:b0:ade:a7b9:fa34 with SMTP id a640c23a62f3a-ae057bc8566mr1548220366b.45.1750756317210;
        Tue, 24 Jun 2025 02:11:57 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b4665af2sm20351066b.42.2025.06.24.02.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 02:11:56 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] migration-guides/migration-5.3.rst: add guidance for breaking WORKDIR changes
Date: Tue, 24 Jun 2025 11:11:52 +0200
Message-Id: <20250624091152.1939195-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 09:12:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7195

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../migration-guides/migration-5.3.rst        | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/documentation/migration-guides/migration-5.3.rst b/documentation/migration-guides/migration-5.3.rst
index 09095c7bb25..52d3a83192c 100644
--- a/documentation/migration-guides/migration-5.3.rst
+++ b/documentation/migration-guides/migration-5.3.rst
@@ -14,6 +14,53 @@ Migration notes for |yocto-ver| (|yocto-codename|)
 This section provides migration information for moving to the Yocto
 Project |yocto-ver| Release (codename "|yocto-codename|") from the prior release.
 
+:term:`WORKDIR` changes
+~~~~~~~~~~~~~~~~~~~~~~
+
+S = ${WORKDIR}/something no longer supported
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+If a recipe has :term:`S` set to be :term:`WORKDIR`/something, this is no longer
+supported, and an error will be issued. The recipe should be changed to::
+
+    S = "${UNPACKDIR}/something"
+
+S = ${WORKDIR}/git and S = ${UNPACKDIR}/git should be removed
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Git fetcher now unpacks into ${BB_GIT_DEFAULT_DESTSUFFIX}/
+rather than git/ directory under :term:`UNPACKDIR`. :term:`BB_GIT_DEFAULT_DESTSUFFIX`
+is set in oe-core's bitbake.conf to :term:`BP`.
+
+This location matches the default value of :term:`S` set by bitbake.conf, so :term:`S`
+setting in recipes can and should be removed.
+
+Note that when S is set to a subdirectory of the git checkout, then it
+should be instead adjusted according to the previous point::
+
+    S = "${UNPACKDIR}/${BP}/something"
+
+Note that 'git' as the source checkout location can be hardcoded
+in other places in recipes; when it's in :term:`SRC_URI`, replace with
+:term:`BB_GIT_DEFAULT_DESTSUFFIX`, otherwise replace with :term:`BP`.
+
+How to make those adjustments without tedious manual editing
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The following sed command can be used to remove S = "${WORKDIR}/git
+across a whole layer::
+
+    sed -i "/^S = \"\${WORKDIR}\/git\"/d" `find . -name *.bb -o -name *.inc -o -name *.bbclass`
+
+Then, the following command can tweak the remaining :term:`S` assignments to
+refer to UNPACKDIR instead of WOIRKDIR::
+
+    sed -i "s/^S = \"\${WORKDIR}\//S = \"\${UNPACKDIR}\//g" `find . -name *.bb -o -name *.inc -o -name *.bbclass`
+
+The first change can introduce a lot of consecutive empty lines, so those can be removed with::
+
+    sed -i -z -E 's/([ \t\f\v\r]*\n){3,}/\n\n/g' `find . -name *.bb -o -name *.inc`
+
 Supported kernel versions
 ~~~~~~~~~~~~~~~~~~~~~~~~~
 
-- 
2.39.5


