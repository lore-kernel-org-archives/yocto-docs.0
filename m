Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CB88CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 12:05:38 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.211775.1697544335252054298
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 05:05:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fjsLmuCY;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: bhstalel@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-53db3811d8fso11625045a12.1
        for <docs@lists.yoctoproject.org>; Tue, 17 Oct 2023 05:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697544333; x=1698149133; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k4KIPZHM/SMHGa4woj5WaIW38fkQSpm9eO5q13kE8CA=;
        b=fjsLmuCYs3PgZhqY0I7eENl891MLwWPwz8Pj1NRLl4xVbLFGkv3iAfSQxF1bPJEUxo
         5CSu7ivEGEKgFXSMh34L2e46h6Q5qHiQ0sqhl0Q/hq5tWNAtCt1q/dXAgRtmU4g+VrZC
         gnva8LOmbJ8TJ4dz3SDLm51KPlBkyxkx9dQdZWZ0eddOAJW+OeYhzRtXS7UT9QCAx926
         /zS82dVXYBXPcafRPW4Qde/deWJkKdehrxPjwKS3knKMu7ZWXFxdtF3heANdqu1+6p43
         Np2V9JTRuI6ZPWBkkr+qbci8u0YtnyVDwAYwJhDkI440ndcbXLhFHdNEZOUsUM1VsNmU
         7Uyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544333; x=1698149133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4KIPZHM/SMHGa4woj5WaIW38fkQSpm9eO5q13kE8CA=;
        b=nHd1qh4FiBxLYftKP1GW2JjTDc1QBMqfigwNhADg0P3FLOOwhSiCxggazIzcSJbAaI
         SBBbi0OJn3TQEEm59zQcQmCJXy1Hr7incemKjuN1LMg7E1I5twU//sd5Kva4n8hrOcuj
         8UalBzC2vdcmKIgyObY+g2WbJq5I9vtKca9wY1+htUo+vlGLjJiuBfnENKnoxtgxvDht
         4WxZcqYgWRi00skQ2FxkaV0g87DQQAkAdWCjXwL1clWUfCyzVGU3tt56ocIEaMhBZVpi
         pL3H5sSTjyxVu19Tz+YUMGLsRrsMeKlafvzx0ua8axeGUX6wQbte8VWDSCuhYpl8R/VB
         VhjQ==
X-Gm-Message-State: AOJu0YxxWOpfSYEFvJbGWpifOkaBvhdIXWtODTi6Kdxuz0Pdwyj+mSTS
	crWibfqV/WoLBQ2EPAlhlPJWNwDYqPM=
X-Google-Smtp-Source: AGHT+IEYQgXmhysyCxykQP5zJ6siKqzD2eqrCjaOztK8n8nI/3OOdG7YzxpDBv/YZYqbFTDmlRAiFA==
X-Received: by 2002:a50:d55b:0:b0:53e:ae04:40ec with SMTP id f27-20020a50d55b000000b0053eae0440ecmr1536127edj.18.1697544333178;
        Tue, 17 Oct 2023 05:05:33 -0700 (PDT)
Received: from talel.sofia.local ([193.95.99.58])
        by smtp.gmail.com with ESMTPSA id cq23-20020a056402221700b00533dd4d2947sm1091555edb.74.2023.10.17.05.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:32 -0700 (PDT)
From: Talel BELHAJSALEM <bhstalel@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Talel BELHAJSALEM <bhstalel@gmail.com>
Subject: [PATCH] dev-manual: layers: Add notes about layer.conf
Date: Tue, 17 Oct 2023 13:05:24 +0100
Message-Id: <20231017120524.3094506-1-bhstalel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Oct 2023 12:05:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4396

As discussed before with Richard Purdie, the code supports this but the documentation is not.
Developers in general will not notice this or focus on it because they do not mess with the
layer.conf template file, but in my opinion I think more details can help.

Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
---
 documentation/dev-manual/layers.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index 2d809562d..7e83d9a3a 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -128,6 +128,17 @@ Follow these general steps to create your layer without using tools:
       variable is a good way to indicate if your particular layer is
       current.
 
+
+   .. note::
+
+      A layer does not have to contain only recipes ``.bb`` or append files ``.bbappend``.
+      Generally, developers create layers using ``bitbake-layers create-layer``, see
+      ":ref:`dev-manual/layers:creating a general layer using the \`\`bitbake-layers\`\` script`", that
+      creates the ``layer.conf`` file from a template located in ``meta/lib/bblayers/templates/layer.conf``.
+      In fact, all the variables set in ``layer.conf`` are not mandatory,
+      except when :term:`BBFILE_COLLECTIONS` is present. In this case
+      :term:`LAYERSERIES_COMPAT` and :term:`BBFILE_PATTERN` will have to be defined too.
+
 #. *Add Content:* Depending on the type of layer, add the content. If
    the layer adds support for a machine, add the machine configuration
    in a ``conf/machine/`` file within the layer. If the layer adds
-- 
2.25.1


