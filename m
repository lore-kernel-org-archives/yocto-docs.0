Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E2ED44D6A
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 13:54:57 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.46222.1730901289782537073
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Nov 2024 05:54:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=od7wzLKn;
 spf=pass (domain: baylibre.com, ip: 209.85.221.46, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d4b0943c7so4270297f8f.1
        for <docs@lists.yoctoproject.org>; Wed, 06 Nov 2024 05:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730901288; x=1731506088; darn=lists.yoctoproject.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AFK86GBRO+icOXMzWv5jRb8B1L4QDNbK6rRxaE/Xpcc=;
        b=od7wzLKn3GFv20AIXxZWYF2rQhzz2gaOD6nnQ/yZiBQ27Wpb4k6QakGTmxoC61pOr4
         C2rUQ541NdwoZQtSEJZQpQb6sq0HjylswePp4NsOXuT1xLcu9+kFT98t7ZuXyN4vVOJA
         sYh2AovSa7XNhIzf0CAKvcLNiF4PcHzp1P/3UMo96aaY4sWWrt8xWxiKoGD/Ih3IQCzD
         HSXduXVkaJyCXRO3AqLcbweRnJMLyw6cAiY02K4lcygV4np34yMHMT6L+JWHV/SIzrHj
         z4L2LDvoYJmGGQzB1FsT0iUaVqUuqsRRUoPrfy7HX+ueDFN50STKrtA+y1nG0blQmGMs
         nVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730901288; x=1731506088;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFK86GBRO+icOXMzWv5jRb8B1L4QDNbK6rRxaE/Xpcc=;
        b=sgCsXeJW9iHg2k/9MmJMPpIamAMPxSWjJfl8VdNLEUVY0Eg/+uq2oQoxg8d33mkQhX
         163PCEqLHDYcMyoM6eHXqB2U+u7H8MzSiWy67gTcPBxQaozJCSCwO9rzYA7ljHr0lwkU
         P291Nuw2CSeqaGfsFjKKFkfGlkfC5lc86q/pt9ihn11ibBnxOBh0eO7ZAT4RAZeQCZQn
         ALdsykf2X0xzQAc4dLLRKmkEOTr1mAWWxyAu+pmxCnaD99xnGXJF5aOTelUtOBCBR8qd
         oLEiKMLmHhty/3OaAo2v+8d6OhzUgcXxLz7x7aJruLDrPIqWTdM1A1nWV0Ae3N/Z8IPN
         +VYw==
X-Gm-Message-State: AOJu0YyVZPbPPwK6vrynpLWhD885pbIH2VsCKeKyLIq634twxi1Yeb/h
	nICmJjV9nHByPr+5TpoaAbGZbFT0p+9Bz0t+ldazmkYRNoT84GTqOUD7EKQIWnm8aTqhzw8dLpP
	XmQs=
X-Google-Smtp-Source: AGHT+IFiIOgi/BSRwYtxuaF9Fe5zGA650JnTI3DiwtKI3hw6m6p/1H55pkWrP9nUJ1cYXvMCrs5G1w==
X-Received: by 2002:adf:e0d2:0:b0:37d:493c:f7b8 with SMTP id ffacd0b85a97d-380610f245dmr27424399f8f.2.1730901287921;
        Wed, 06 Nov 2024 05:54:47 -0800 (PST)
Received: from [192.168.42.0] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c113dd7fsm19402750f8f.70.2024.11.06.05.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 05:54:47 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 06 Nov 2024 14:54:46 +0100
Subject: [PATCH v5 2/3] ref-manual: variables: add SIGGEN_LOCKEDSIGS*
 variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241106-add-bblock-documentation-v5-2-625806c6a3ce@baylibre.com>
References: <20241106-add-bblock-documentation-v5-0-625806c6a3ce@baylibre.com>
In-Reply-To: <20241106-add-bblock-documentation-v5-0-625806c6a3ce@baylibre.com>
To: docs@lists.yoctoproject.org, Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Nov 2024 13:54:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5700

Variables SIGGEN_LOCKEDSIGS, SIGGEN_LOCKEDSIGS_TASKSIG_CHECK and
SIGGEN_LOCKEDSIGS_TYPES are used to lock specific tasks to specific
signatures. They are used by bitbake -S <lockedsigs> and bblock, so add
documentation for them.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 documentation/ref-manual/variables.rst | 44 ++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 07ed143ac5606617c720301ac6621355a341f90a..11ad1f4dc69c849383fb259dc32342988b62abe5 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7880,6 +7880,50 @@ system and gives an overview of their function and contents.
          might break at runtime if the interface of the recipe was changed
          after the other had been built.
 
+   :term:`SIGGEN_LOCKEDSIGS`
+     The list of locked tasks, with the form::
+
+       SIGGEN_LOCKEDSIGS += "<package>:<task>:<signature>"
+
+     If ``<signature>`` exists for the specified ``<task>`` and ``<package>``
+     in the sstate cache, BitBake will use the cached output instead of
+     rebuilding the ``<task>``. If it does not exist, BitBake will build the
+     ``<task>`` and the sstate cache will be used next time.
+
+     Example::
+
+       SIGGEN_LOCKEDSIGS += "bc:do_compile:09772aa4532512baf96d433484f27234d4b7c11dd9cda0d6f56fa1b7ce6f25f0"
+
+     You can obtain the signature of all the tasks for the recipe ``bc`` using::
+
+       bitbake -S none bc
+
+     Then you can look at files in ``build/tmp/stamps/<arch>/bc`` and look for
+     files like: ``<PV>.do_compile.sigdata.09772aa4532512baf96d433484f27234d4b7c11dd9cda0d6f56fa1b7ce6f25f0``.
+
+   :term:`SIGGEN_LOCKEDSIGS_TASKSIG_CHECK`
+     Specifies the debug level of task signature check. 3 levels are supported:
+
+     * ``info``: displays a "Note" message to remind the user that a task is locked
+       and the current signature matches the locked one.
+     * ``warn``: displays a "Warning" message if a task is locked and the current
+       signature does not match the locked one.
+     * ``error``: same as warn but displays an "Error" message and aborts.
+
+   :term:`SIGGEN_LOCKEDSIGS_TYPES`
+     Allowed overrides for :term:`SIGGEN_LOCKEDSIGS`. This is mainly used
+     for architecture specific locks. A common value for
+     :term:`SIGGEN_LOCKEDSIGS_TYPES` is ``${PACKAGE_ARCHS}``::
+
+       SIGGEN_LOCKEDSIGS_TYPES += "${PACKAGE_ARCHS}"
+
+       SIGGEN_LOCKEDSIGS_core2-64 += "bc:do_compile:09772aa4532512baf96d433484f27234d4b7c11dd9cda0d6f56fa1b7ce6f25f0"
+       SIGGEN_LOCKEDSIGS_cortexa57 += "bc:do_compile:12178eb6d55ef602a8fe638e49862fd247e07b228f0f08967697b655bfe4bb61"
+
+     Here, the ``do_compile`` task from ``bc`` will be locked only for
+     ``core2-64`` and ``cortexa57`` but not for other architectures such as
+     ``mips32r2``.
+
    :term:`SITEINFO_BITS`
       Specifies the number of bits for the target system CPU. The value
       should be either "32" or "64".

-- 
2.47.0


