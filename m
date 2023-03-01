Return-Path: <fawzi.khaber@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0109C7EE2F
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 13:16:37 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.21406.1677676590387427406
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Mar 2023 05:16:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=6/xM34MV;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: fawzi.khaber@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id l7-20020a05600c4f0700b003e79fa98ce1so7816829wmq.2
        for <docs@lists.yoctoproject.org>; Wed, 01 Mar 2023 05:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/0918a1DQgyOeWZBSQNtzuEK/5MPQVE8DO3uJsPDtfQ=;
        b=6/xM34MVYbDaPSeamRw+4J9iolhJtylqL4lsybS8s80How+KZTFeYccbdNmhQkbgfF
         CrcQMlCcrIrgdFeRXYbATI8Tt1Jyl94KB1Y0umFLeJTqIs+VFGEaTeBmAVGfSwLy7V7v
         8NEhyeMdlfpjOT5OboHh4iRgasGOTI09TxoxgyjWGPBZowQLwCoiYlpZ8sOIvpIrk87J
         G6sJKOobUfyEqTtfV7NpKLbJaXkB8yhuDI5UvRBGQ319MXajap3O3RSKzZkeZs4dIyiD
         MKju0cTMRgy1GyX9IIs+HEqn4j/Yol1LLymIGoBBteATmAKsCqsl3WhMXiK9dqkcjEc0
         Gxiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/0918a1DQgyOeWZBSQNtzuEK/5MPQVE8DO3uJsPDtfQ=;
        b=m0k2my67/3ly3T9u/6+BXQtLXPeowrE+AM7rKzS4aXN4FrejfAdKjVYzKM1YuKYTCW
         3TYV8zbKoyA/bRZNzuKxxIYOetB8w9q46e9d0rtnTC0jjPpT2eEEGSjSMlz4KUnGGq7F
         Zl8gaB/OruKeSljYjeOLHIJccEzRCxpo13EPWTIIvEu0qKLNPU640vf1KTg5fFvvas5h
         oTtaYSrS0iuMNFxCevnFsuhqM5kC81RqSt+QdiGgM0gr5XZj1U8hqFVDySmoJzaQENiI
         UdycwYNoE/Vcc5kr9ueNuhkwdK4ZUkMTD18rlnSfRCEi9wPCKlxrzTNjH+yBKkkDcoVy
         2q8w==
X-Gm-Message-State: AO0yUKUuo7U6hqsdezrIN7cTPURRIOaSFlaF+hY8k1CJ8pGQO3Brfnz6
	MKrFDTFDoZYKx11JQjTT/FGIAg==
X-Google-Smtp-Source: AK7set/PsyBySx8RStkYkKx6V6GxA1FoccfLmCcHZM++/F6xIMhDmK+06ikqu/aeaLdZPq5mZyiNhg==
X-Received: by 2002:a05:600c:4707:b0:3eb:42fa:39d6 with SMTP id v7-20020a05600c470700b003eb42fa39d6mr4834088wmo.14.1677676588845;
        Wed, 01 Mar 2023 05:16:28 -0800 (PST)
Received: from P-ASN-SCRUM.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id l4-20020a05600c4f0400b003df7b40f99fsm20800605wmq.11.2023.03.01.05.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 05:16:28 -0800 (PST)
From: Fawzi KHABER <fawzi.khaber@smile.fr>
To: bitbake-devel@lists.openembedded.org
Cc: docs@lists.yoctoproject.org,
	Fawzi KHABER <fawzi.khaber@smile.fr>,
	Ever ATILANO <ever.atilano@smile.fr>,
	Yoann CONGAL <yoann.congal@smile.fr>
Subject: [PATCH v3 1/2] doc: ref-variables: add LAYERSERIES_COMPAT to term glossary
Date: Wed,  1 Mar 2023 14:16:10 +0100
Message-Id: <20230301131611.16265-1-fawzi.khaber@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 01 Mar 2023 13:16:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3766

Bitbake throws a warning if the layer compatibility is not defined since
cca81e33b58c390dcf5cc3a31555a43b79177166. This variable did not figure in
the documentation.

Reviewed-by: Ever ATILANO <ever.atilano@smile.fr>
Reviewed-by: Yoann CONGAL <yoann.congal@smile.fr>
Signed-off-by: Fawzi KHABER <fawzi.khaber@smile.fr>
---
 .../bitbake-user-manual-ref-variables.rst     | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst b/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
index 09d09a8d..a48e7000 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
@@ -1096,6 +1096,29 @@ overview of their function and contents.
       variable is not available outside of ``layer.conf`` and references
       are expanded immediately when parsing of the file completes.
 
+   :term:`LAYERSERIES_COMPAT`
+      Lists the versions of the OpenEmbedded-Core (OE-Core) for which
+      a layer is compatible. Using the :term:`LAYERSERIES_COMPAT` variable
+      allows the layer maintainer to indicate which combinations of the
+      layer and OE-Core can be expected to work. The variable gives the
+      system a way to detect when a layer has not been tested with new
+      releases of OE-Core (e.g. the layer is not maintained).
+
+      To specify the OE-Core versions for which a layer is compatible, use
+      this variable in your layer's ``conf/layer.conf`` configuration file.
+      For the list, use the Yocto Project release name (e.g. "kirkstone",
+      "mickledore"). To specify multiple OE-Core versions for the layer, use
+      a space-separated list::
+
+         LAYERSERIES_COMPAT_layer_root_name = "kirkstone mickledore"
+
+      .. note::
+
+         Setting :term:`LAYERSERIES_COMPAT` is required by the Yocto Project
+         Compatible version 2 standard.
+         The OpenEmbedded build system produces a warning if the variable
+         is not set for any given layer.
+
    :term:`LAYERVERSION`
       Optionally specifies the version of a layer as a single number. You
       can use this variable within
-- 
2.39.2


