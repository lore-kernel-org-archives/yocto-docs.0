Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0136D1266A
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 08:17:57 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.13014.1730794667387699922
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Nov 2024 00:17:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=wwChKvYO;
 spf=pass (domain: baylibre.com, ip: 209.85.128.41, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4314f38d274so61149435e9.1
        for <docs@lists.yoctoproject.org>; Tue, 05 Nov 2024 00:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730794665; x=1731399465; darn=lists.yoctoproject.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7yNSxgjzO6u+M3J9VoM+Np2z5aACsb6ntS62Hl5ud+o=;
        b=wwChKvYOUeNohz+qBxxmwCzrL53CSr9if3YCv3yx47ZsgnL2U8ccfHQ0GP8kboH/B3
         8aj0g55eVRsnUID54m7jLaIYCHsFUAUMtZ8963jsEBXuEZxCtBcghBKalhdvo3L5jzkL
         PhdhnJNeY15/mo6CjWLwQty4/alv0nAz+rJjxGiDYXLmjHa7xDwaOCCL8cAa0JrGX136
         XrPyqGDSeDrjofnyFyFox5fFlFVOopsK6LPg75ThEvbOMTpHLrR8ztSM1gp0xZZ+JmWe
         TX8tmWCRU+n37Mma+Tae9glgjc+v++XQjP1SHpm13JnlTd3Ic55rIo0QuFgNa6auLIiA
         wt+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730794665; x=1731399465;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7yNSxgjzO6u+M3J9VoM+Np2z5aACsb6ntS62Hl5ud+o=;
        b=W4M3/q4uVo8IvvyuiEzjU6s3pkDeYdqR54w6cJ9rNYu2YaxYsWQp0H4VQPVjGnujQ5
         +oWy9Mz71wPr8NIeYAAi8jHRAauY4rfLQid5d97CdPPYNZJ/5UYeoQ4gmZya5lyqG7QJ
         kN1iHEBDnA5L8qsY1OG1FlqmamVKrDQ7MxlqrLAKAOet6UZePRdhwqn+lAIsQtZInaD2
         YLVbgcCnMoigYYABONyaOk3O57udlEEIM0e9Tgwy5iRtYKW4/ERoHdszMwuk0A6muqFQ
         1+8Gm+3af+em5Zrrz4XlA+Dw8w12MmZnbJAgTloyRCQOnxLP/RiGOkGipJRqJvMGPreB
         OD2A==
X-Gm-Message-State: AOJu0YwZttzXETgDHY4MlyCneqrfdwARNomcCVPv4z44Fbo3QXrYhKHy
	bUvghozPDFKqe+wgC/GCR4Jh7lNaEpcmi/k/vFaejO3M4HxOBFaUEckdPX2p4LdtCkIIXuEnzWw
	7v0s=
X-Google-Smtp-Source: AGHT+IGIp/qGamN3J98guG5QY81g3Ba3cy4i4ojvgpK4nFROCQ+wIUXsj6jRQ+d+QR/v/UmFGRfETw==
X-Received: by 2002:a05:6000:1a8a:b0:37d:5296:4b37 with SMTP id ffacd0b85a97d-381c7a5e746mr15655818f8f.24.1730794665511;
        Tue, 05 Nov 2024 00:17:45 -0800 (PST)
Received: from jstephan-bl.local (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7c38sm15318341f8f.24.2024.11.05.00.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 00:17:45 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Date: Tue, 05 Nov 2024 09:17:36 +0100
Subject: [PATCH v3 2/3] ref-manual: variables: add SIGGEN_LOCKEDSIGS*
 variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241105-add-bblock-documentation-v3-2-b870ded39a2d@baylibre.com>
References: <20241105-add-bblock-documentation-v3-0-b870ded39a2d@baylibre.com>
In-Reply-To: <20241105-add-bblock-documentation-v3-0-b870ded39a2d@baylibre.com>
To: docs@lists.yoctoproject.org, Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Nov 2024 08:17:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5674

Variables SIGGEN_LOCKEDSIGS, SIGGEN_LOCKEDSIGS_TASKSIG_CHECK and
SIGGEN_LOCKEDSIGS_TYPES are used to lock specific tasks to specific
signatures. They are used by bitbake -S <lockedsigs> and bblock, so add
documentation for them.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 documentation/ref-manual/variables.rst | 44 ++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 07ed143ac5606617c720301ac6621355a341f90a..b24286813eafaa562f4ebd070190f1e97e0cf23c 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7880,6 +7880,50 @@ system and gives an overview of their function and contents.
          might break at runtime if the interface of the recipe was changed
          after the other had been built.
 
+   :term:`SIGGEN_LOCKEDSIGS`
+     The list of locked taks, with the form::
+
+       SIGGEN_LOCKEDSIGS += "<package>:<task>:<signature>"
+
+     If ``<signature>`` exists for the specified ``<task>`` and ``<package>``
+     in sstate, BitBake will use the cached output instead of rebuilding the
+     ``<task>``. If it does not exist, BitBake will build the ``<task>`` and
+     the sstate will be used next time.
+
+     Example::
+
+       SIGGEN_LOCKEDSIGS += "bc:do_compile:09772aa4532512baf96d433484f27234d4b7c11dd9cda0d6f56fa1b7ce6f25f0"
+
+     To obtain the signature, you can dump all ``bc``'s tasks signature using::
+
+       bitbake -S none bc
+
+     Then you can look at files in ``build/stamps/<arch>/bc`` and search for the
+     file: ``<PV>.do_compile.sigdata.09772aa4532512baf96d433484f27234d4b7c11dd9cda0d6f56fa1b7ce6f25f0``.
+
+   :term:`SIGGEN_LOCKEDSIGS_TASKSIG_CHECK`
+     Specifies the debug level of task signature check. 3 levels are supported:
+
+     * ``info``: displays a "Note" message to remind the user that a task is locked
+       and the current signature matches the locked one.
+     * ``warn``: displays a "Warning" message if a task is locked and the current
+       signature does not match the locked one.
+     * ``error``: same as warn but displays an “Error” message and aborts.
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


