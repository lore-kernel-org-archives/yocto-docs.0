Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D5AD132DF
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 15:55:13 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.61083.1730735704790849378
 for <docs@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 07:55:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=peEpK6Rb;
 spf=pass (domain: baylibre.com, ip: 209.85.221.53, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37d43a9bc03so2979807f8f.2
        for <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 07:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730735703; x=1731340503; darn=lists.yoctoproject.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7yNSxgjzO6u+M3J9VoM+Np2z5aACsb6ntS62Hl5ud+o=;
        b=peEpK6RbisS9Q+IzS0GiVyiSrDBH89u2UsWIsJk7LmbqnDwtM010o+Qy+GsYOzayFg
         YAceRPisJtiEuC/mcV1U5EEbgYHdSebflxBMctUk7DlH8/UpTjmNfrZEYkTt/68ubEDS
         qb7BPk+gcsHQUXucI8L27DMMNYsq//A5Xba0DSKDcIHJS6R5AIv1Ay+XNr2Ga+swcc7G
         efyZfkkYLOtFVmXamL9f0Nni8P8n9P1b/KYBy8sg0t/k+ZLzV0sJmfdTomL7J5lsHhtT
         csmLuILfUT7Wsy5dT5dv+UMVeoslScM4Qm0raVPerw+/I0OtAw2Pueikq8X7rU9m63+1
         jJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730735703; x=1731340503;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7yNSxgjzO6u+M3J9VoM+Np2z5aACsb6ntS62Hl5ud+o=;
        b=PC/n9waBqMElJPvlH9nv1SLVcXZ337XKOtv6nRfEC3kyRwtJBRSaov6Ax4EtXu5yRP
         CeGFs9mR4N5enuFIsG9JVw0Gk+pbzsiWYNVHYLR9l+5Bze24A1D/mG1QgChvsvowJHEX
         eF+7SmVgPOh/NcPSuDxYDLUHjmbgdI2VIHdhqloMobr9Dr4pyc1Eox2Y+IgRT9uqjsm4
         PLdkgpxp7sXzYltgI43L1Wofsyc8RdaAhwVOcxRXUuIA+sR0vxE2Cfo6LQbSmGJeocym
         xR2IFax5IkjDAqf4nYD3PDb6AuytilkqDCWlIZC4RwCP29lbzleFw/Dpan4cE/jJlUda
         HSCA==
X-Gm-Message-State: AOJu0YwM+9/mUBtNk2KJVi2KyPatK7FrgiqWcMLf7XCJxYh7yXAxG/BG
	Tb1rVsQZDZQ3QQlVfOD0HFYbV93Z2NmXp/VnrrqyTEcSZTYrqRGvy9eXpD0g2iPRc3jYkZjak3K
	82wo=
X-Google-Smtp-Source: AGHT+IEMOhjLPXnL6NQLhJVlVbMPb+bbsLWD7k1S1md2wMfzAxBjGRfh3PlxgaUnJc5oui8lSJw5CQ==
X-Received: by 2002:a05:6000:2d11:b0:381:d9cf:c023 with SMTP id ffacd0b85a97d-381d9cfc06emr2134139f8f.55.1730735703188;
        Mon, 04 Nov 2024 07:55:03 -0800 (PST)
Received: from [192.168.42.0] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116abb5sm13472315f8f.100.2024.11.04.07.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 07:55:02 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Date: Mon, 04 Nov 2024 16:55:00 +0100
Subject: [PATCH v2 2/3] ref-manual: variables: add SIGGEN_LOCKEDSIGS*
 variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241104-add-bblock-documentation-v2-2-0704e4d59929@baylibre.com>
References: <20241104-add-bblock-documentation-v2-0-0704e4d59929@baylibre.com>
In-Reply-To: <20241104-add-bblock-documentation-v2-0-0704e4d59929@baylibre.com>
To: docs@lists.yoctoproject.org, Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 04 Nov 2024 15:55:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5665

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


