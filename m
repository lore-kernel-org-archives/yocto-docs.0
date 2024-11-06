Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E6ED3E78C
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 09:02:55 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.41557.1730883774666643672
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Nov 2024 01:02:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=R8ATs/5j;
 spf=pass (domain: baylibre.com, ip: 209.85.221.46, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d4b0943c7so4082817f8f.1
        for <docs@lists.yoctoproject.org>; Wed, 06 Nov 2024 01:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730883773; x=1731488573; darn=lists.yoctoproject.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5tXY0w5inM3IyaEZ/OV9NrTUpfncMLc0LDSBbGk8OY=;
        b=R8ATs/5jcFqPNdlDNL3WV4VsAb+GvRfBPz3WASnVM5NhOXqJ5Ubza/vT/iO+KcSSjn
         My9W5glUd5V25fwH/6Ir4YRRXRYjdyMOaRTDYecqZD3l5BrKwhEnSJMO5AC9gN4GxkQ4
         y7zWN0ifsSM/sCsZUfSfFyUPNVj0yCfSYMYZC6K+SHttOlrUEiSS6iZY040ej84pgjGf
         bJ3POGaaVq5S0dnTT78H5JFfFkMfaGLDF06RzFA3Y/eyBjb2PFs+C9ITe/BUSnDm+jlq
         zsbHzLH2TYnN/fqMKp7qCRD5GwSt0X7SuVT+AmPAS+zHLT+AJ4rz9ZyPmmlWto9DOkDB
         XYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730883773; x=1731488573;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5tXY0w5inM3IyaEZ/OV9NrTUpfncMLc0LDSBbGk8OY=;
        b=CqU2ugtgqmNXeBBn0cdg+s2dz8D7urawjSizWmCyaEDFE6SXUbukBdGva1CGTXyH00
         aL59IzW43kbtlWNRItop4kLyNxk8D6PNsT/P+UJGJDlOHyywoljQ4EHpHEeTaTYZBjZw
         Af2wlCajP8psqpUkHZcWK9BdUY8ZoTPhj4zakcxnUzTlIrwzRy04zIx+bnHXoFpL7W7d
         AG/P2425QBvD3W7t18X4/ZI0eA1wXQ1vyx138CVTBxtBReBeKxdc1S7NFnaKBcFl3121
         /KyeEqhoh7nMFcqPm+XfiwKoMI6HOD78xJwu+Y9VygjWr5YHfxyRcG3gxCCT+pm5vQHx
         RDCA==
X-Gm-Message-State: AOJu0YwQjgqYaLldGZNHzpUfQBXhGxJCJN0UAWT++PbrMF0GhMOKWYjU
	8uPbySZqeeijdI68qRVbwINerc1oycg+scsVJJiczy9pacE/Q7GO4eoqHpb641g=
X-Google-Smtp-Source: AGHT+IFKt4MQiuFgnUbZxau73sPRc/YfTL1CqzmRjLw2w1gQAIjmIUZm7Op3SqTFbhixcEsIXgpZkw==
X-Received: by 2002:a5d:6083:0:b0:37d:5436:4a1 with SMTP id ffacd0b85a97d-380610f2575mr24529935f8f.3.1730883773005;
        Wed, 06 Nov 2024 01:02:53 -0800 (PST)
Received: from jstephan-bl.local (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c113e694sm18671637f8f.86.2024.11.06.01.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 01:02:52 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 06 Nov 2024 10:02:41 +0100
Subject: [PATCH v4 2/3] ref-manual: variables: add SIGGEN_LOCKEDSIGS*
 variables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241106-add-bblock-documentation-v4-2-9f24dfe69243@baylibre.com>
References: <20241106-add-bblock-documentation-v4-0-9f24dfe69243@baylibre.com>
In-Reply-To: <20241106-add-bblock-documentation-v4-0-9f24dfe69243@baylibre.com>
To: docs@lists.yoctoproject.org, Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Nov 2024 09:02:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5693

Variables SIGGEN_LOCKEDSIGS, SIGGEN_LOCKEDSIGS_TASKSIG_CHECK and
SIGGEN_LOCKEDSIGS_TYPES are used to lock specific tasks to specific
signatures. They are used by bitbake -S <lockedsigs> and bblock, so add
documentation for them.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 documentation/ref-manual/variables.rst | 44 ++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 07ed143ac5606617c720301ac6621355a341f90a..76fc50ecbfb841125860e7dac42d4d4c102942cf 100644
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


