Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 102BFE77181
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 15:25:23 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.104352.1733757919849137260
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Dec 2024 07:25:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JMf+FXTv;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-434f9da4e15so6310265e9.1
        for <docs@lists.yoctoproject.org>; Mon, 09 Dec 2024 07:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733757918; x=1734362718; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WB76uUejcbcVllCB2DTsu/4SzQBAu9TGFTyteZpl+7g=;
        b=JMf+FXTvztjhw29Z4j5K+OmP33v2edLn7akEEDcju1kzo9tU9AEYJLzoh6BUsH+CIF
         XGrE8b4vWwBCF1B8bYK9Lbh0NhdYtjTlXnwOlpApYwZzK+u6+RCcEJh42CG9J6/WclJl
         tM95Aw55zckdtqZxulxtWOICbpK95Nr5MrvNsjNSSuluKxxc/QVng4n5GqC6ENMFpdZW
         O9M+GhErfmnn6INSwLh1CDClsv3fwhr5xSnLavkNNLXiMrunvQ5D2Ifzp5NLi4A6l7dT
         sOPrK8plcuekg41P1JPUi7IknL8qkClnQUn55jFFgXZd5tXxvp048Ba+eZ5KCC4svvHb
         BOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733757918; x=1734362718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WB76uUejcbcVllCB2DTsu/4SzQBAu9TGFTyteZpl+7g=;
        b=a9EOHXhgY/jjg1zT51kYpVPMuWDB13OLEB79PMMwLew0saZD1QkOIel2JCDEafixSg
         suKb3VoxPpQJjcm+UNHZSUvfbsoCTek3Mu7lHQonOrAvOZKiSixwhhmWYShmbyUF9khC
         S+maKdKeDZsVZQKRQXAjeMfK39jMawTpzDszEGYOxeClfK/eTTREeQcnzSwmrrpqTL0E
         GvJshX/XdWfopmlP/Oxg9r+BLNHGomJrghPWGY+t4AghaDILkd14/aUe1IPV0D+KdP9l
         w3dOT3l3Hdo656PVNdS9J4sUX3/juebXLnRvjhYNCsR+S0KsOWILy3flmrvBGHYKGOWI
         TCzA==
X-Forwarded-Encrypted: i=1; AJvYcCV30lzr3BfunErsgii4jw8CMuggHmqnG67/tZiFK1yUaIphOiX1AnU05sa/DO3QRQhemgI9@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxBlymEEIAvZ4YLZb1N2AqoPYepNdWI3C+80saAL8FpkewkBwgG
	0dN3ooKeFFei0W63aU6gLNQ15ei+0XGQP2mCUnNWDBTqgP5fR3VtO3GItQ==
X-Gm-Gg: ASbGncud5nZHiiTsT9WrAFkNt46OvdsiqV7wlwpLd2Op81bNzlWZ/W8WriSWDuHvgV5
	15GENCZVbPuAhEnVtXx0DG5+ssBeoHmhCAy06tmMyyS3nibPMYT3hfHiYdrQVVFPT8XblssZX77
	93OARgaxYSNVe5mMexaPGThQ9LFe3q4wYj/HKlRxvy9tIMtQ1LbQ79gVm3umKrjMgdahcQsRBbJ
	CNB1bZIS7MXEAzCfIO1zsE21ckabbkTOTDB0NceDV9M4GNwKi6ne+56YCr+CpW2lAWENK8zMRrx
	Ry/jTcJxaMY=
X-Google-Smtp-Source: AGHT+IE6kDWbtV7d889ZKFdsxola/UIbUqu7yFUnC40I26C+bmdGdXvEXBQMdGmqHQcbnTFXvgtPMw==
X-Received: by 2002:a05:600c:3107:b0:434:a1d3:a331 with SMTP id 5b1f17b1804b1-434fffb2d1bmr7328415e9.22.1733757916451;
        Mon, 09 Dec 2024 07:25:16 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52cbd72sm198323495e9.44.2024.12.09.07.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 07:25:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: bitbake-devel@lists.openembedded.org,
	docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2] bitbake-user-manual-metadata: add a section about 'addfragments`
Date: Mon,  9 Dec 2024 16:25:12 +0100
Message-Id: <20241209152512.2496818-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 09 Dec 2024 15:25:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5898

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../bitbake-user-manual-metadata.rst          | 37 ++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/bitbake-user-manual/bitbake-user-manual-metadata.rst b/bitbake-user-manual/bitbake-user-manual-metadata.rst
index 40a0c6f02d9..8e25426895f 100644
--- a/bitbake-user-manual/bitbake-user-manual-metadata.rst
+++ b/bitbake-user-manual/bitbake-user-manual-metadata.rst
@@ -754,7 +754,9 @@ share the task.
 This section presents the mechanisms BitBake provides to allow you to
 share functionality between recipes. Specifically, the mechanisms
 include ``include``, ``inherit``, :term:`INHERIT`, and ``require``
-directives.
+directives. There is also a higher-level abstraction called
+``configuration fragments`` that is enabled with ``addfragments``
+directive.
 
 Locating Include and Class Files
 --------------------------------
@@ -962,6 +964,39 @@ the ``autotools`` and ``pkgconfig`` classes::
 
    INHERIT += "autotools pkgconfig"
 
+``addfragments`` Directive
+--------------------------
+
+This directive allows fine-tuning local configurations with configuration
+snippets contained in layers in a structured, controlled way. Typically it would
+go into ``bitbake.conf``, for example::
+
+   addfragments conf/fragments OE_FRAGMENTS
+
+``addfragments`` takes two parameters:
+
+-  path prefix for fragment files inside the layer file tree that bitbake
+uses to construct full paths to the fragment files
+
+-  name of variable that holds the list of enabled fragments in an
+active build
+
+This allows listing enabled configuration fragments in ``OE_FRAGMENTS``
+variable like this::
+
+   OE_FRAGMENTS = "core/domain/somefragment core/someotherfragment anotherlayer/anotherdomain/anotherfragment"
+
+Fragment names listed in this variable must be prefixed by the layer name
+where a fragment file is located, defined by :term:`BBFILE_COLLECTIONS` in ``layer.conf``.
+
+The implementation then expands this list into
+:ref:`require <bitbake-user-manual/bitbake-user-manual-metadata:\`\`require\`\` directive>`
+directives with full paths to respective layers::
+
+   require /path/to/core-layer/conf/fragments/domain/somefragment.conf
+   require /path/to/core-layer/conf/fragments/someotherfragment.conf
+   require /path/to/another-layer/conf/fragments/anotherdomain/anotherfragment.conf
+
 Functions
 =========
 
-- 
2.39.5


