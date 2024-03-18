Return-Path: <belouargamohamed@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7826FC54E5D
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 19:16:46 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.54126.1710789398041282912
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Mar 2024 12:16:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zknqjwu+;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: belouargamohamed@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4146178270dso2669115e9.1
        for <docs@lists.yoctoproject.org>; Mon, 18 Mar 2024 12:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710789396; x=1711394196; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xGmszj7gLnDMAIbkghw8jdfRQv10LqIZ4ii4+k4Y1qk=;
        b=Zknqjwu+vOevWFybEFushV639+d7cFdP3zhKeOYOjO9thAq1T4HYvssEsVu8oC1oAk
         D/6oeNRAgJJdp9wyWhao6wdhNf5pKf6V7ri02wtARJBVHU4ffLeSz/7wYL4LhQb0PCvT
         uH7MyFobQVrMN3waFcphbQQhfyPXd5a6pMikwrLTqsixmTzxjkFrzrcnOuiJGmhpMsgg
         BxZjyhb1jkX3gpnoaZsHfS1sFIoyRAd04QNNFnEJum+/q78YmWzDoC3mPoWpE1xtts0a
         XUb1FUz7tSLpkc9kt2s/wle2EyCgSvCDEuRkPuuhcDnQM0u5lsJiMCoXSmOJvIu12Dnu
         Pv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710789396; x=1711394196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xGmszj7gLnDMAIbkghw8jdfRQv10LqIZ4ii4+k4Y1qk=;
        b=VOtj3aCEeLWA+WTr5SdBAOnHABAYvmC62irBygsC6K+nPoQXz5rUULRP/4qjA78X+s
         3qAY6T6vTH331YjZcxo4vdmWXI8d/MGIFwi0IcaTzAotzEoYyvWCLKMdLmZxvNGQwBv3
         OY9uspk+5iJdJ1xy59kTDM59P+vDLWRWCvsJNU6Rvv4K9Ms+w2a+21rMXz77wUEkyVuV
         Eq9GIYAJbVgqrW81P30okaHEg7O+1CutXDNwMxgn/8/KweQchKKU8Z6rXy46FOBSlonx
         hTIm5Ob409xAO3/SOzuBwHm4j7NbSz8Sm6W/b3Av0y3oK/jI0fRt9rZwt+xrrZm6A1bX
         vDxQ==
X-Gm-Message-State: AOJu0YyrnhhexnNnb8wkiQIiFyrdUCZmsdeAKEPsmKbpclmUWeqsQ/5V
	OlUAnoBEu91gMCh13srOR4Lnm0tTRv1DfHi0uvBJO3e08WDrR88m4nI+goQQ
X-Google-Smtp-Source: AGHT+IFMso0BzhgQf3x1EHW+T1WukTPqBrZNlC8onHGW+IkP/HJuUQBl7JYArFmFv3q6KpmDSt6e0A==
X-Received: by 2002:a05:600c:3b21:b0:413:4299:ec9f with SMTP id m33-20020a05600c3b2100b004134299ec9fmr454866wms.5.1710789395615;
        Mon, 18 Mar 2024 12:16:35 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8440:d205:96ac:1eb2:13cd:4080:328d])
        by smtp.gmail.com with ESMTPSA id i9-20020a05600c354900b004141250b36fsm3276440wmq.11.2024.03.18.12.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 12:16:35 -0700 (PDT)
From: belouargamohamed@gmail.com
X-Google-Original-From: m.belouarga@technologyandstrategy.com
To: docs@lists.yoctoproject.org
Cc: f.lahoudere@technologyandstrategy.com,
	BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Subject: [PATCH] ref-manual: add documentation of the variable SPDX_NAMESPACE_PREFIX
Date: Mon, 18 Mar 2024 20:16:11 +0100
Message-Id: <20240318191610.37757-1-m.belouarga@technologyandstrategy.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Mar 2024 19:16:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4989

From: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>

The documentation of the variable SPDX_NAMESPACE_PREFIX does not exist.
This variable is used to change the prefix of some links in SPDX docs.

Signed-off-by: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 6e66dc735..3f7c8e2c7 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7911,6 +7911,11 @@ system and gives an overview of their function and contents.
       image), compared to just using the :ref:`ref-classes-create-spdx` class
       with no option.
 
+   :term:`SPDX_NAMESPACE_PREFIX`
+      This option could be used in order to change the prefix of ``spdxDocument``
+      and the prefix of ``documentNamespace``. It is set by default to: 
+      ``http://spdx.org/spdxdoc`` .
+
    :term:`SPDX_PRETTY`
       This option makes the SPDX output more human-readable, using
       identation and newlines, instead of the default output in a
-- 
2.25.1


