Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29DB9CDB474
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 12:06:30 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.120203.1697457980602162306
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 05:06:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J3clqTNk;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: bhstalel@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-406609df1a6so43160885e9.3
        for <docs@lists.yoctoproject.org>; Mon, 16 Oct 2023 05:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697457979; x=1698062779; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kgJAysCLRwjv1ZyVK7UDDRkGE6i/18iPAj7hobtOwOI=;
        b=J3clqTNk0tXAxhcWMeJpGBljqWSFyETddLA/g/jEW69t2PHoW9CW7yqWbGGvXUjxoq
         oh7LJCOgc/Y9NclyHeIxZnokHZ2/5ASmDvVb2F2soT/ezDk+pVjRGtIdYS3Zg8ACYrcM
         u6I1itrdrxxAcwfmC4Q1GufBfRtvOHY0AUjXrBhfFWxZNh0sYE+AtKIpIzYbPqhGWznC
         GiYCj1luMXGlmG3V5fXqjeLeXsQ+LmpJIz5QHdKoZya32CuIAOtGGVgERaGYp52cZaDU
         jR112j6nU9trgRHaHAinKHqpXg6Jb1V1zFyn/BlGHgHqydYuddAsNTuhYicLu79f+qmq
         G1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697457979; x=1698062779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kgJAysCLRwjv1ZyVK7UDDRkGE6i/18iPAj7hobtOwOI=;
        b=MRij979dxWDvh2ddn82n6IReGMeVOtxFbGRgyCr1Sj74tLRyF6OmfP8CVeIUh+PvOt
         L+Cbee4tYa7V1y6WeWWh+FP4lH3XnOfL75obj66ImkFWWJfaFiRluV9d+bCSyNQnWmRP
         eG1julWzjZLOw1t9Vs6olyJJVEAjozj6JbWWGxC3nbQ1fgW3mRUqeRiqTGa8yVzEbYvw
         nk5UgIHzXlJL1SLZcUkuzW2zcq3spuv7LgQjdEsae7wRDND5vEL4pqUXft+rCbFKEtpV
         yxej49Qi+fuHVUl+J3cTB/5iBPUaGqmgW+Uwzk7veZsH/b3QM4jklYMStsCbo2JUpPA3
         HFQA==
X-Gm-Message-State: AOJu0YzaJhUJFvfF4ONLGpAdTK4Frhxqsly1dqchpNqMeJwQO5Ql/sK8
	7VRa4nQvlXRcbjioYI04iVCkqMhcDsQ=
X-Google-Smtp-Source: AGHT+IF7XsI46xjCIRWatnuMjbitFGKhU69UxJpOmLncV5xU1cGA6sfD9xsNS7G7jNBP5vxB6MG3Gw==
X-Received: by 2002:adf:f5c7:0:b0:32d:9fd1:91f9 with SMTP id k7-20020adff5c7000000b0032d9fd191f9mr6384432wrp.60.1697457978583;
        Mon, 16 Oct 2023 05:06:18 -0700 (PDT)
Received: from talel.sofia.local ([193.95.99.58])
        by smtp.gmail.com with ESMTPSA id o3-20020a05600c510300b004065d67c3c9sm7122377wms.8.2023.10.16.05.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 05:06:18 -0700 (PDT)
From: Talel BELHAJSALEM <bhstalel@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Talel BELHAJSALEM <bhstalel@gmail.com>
Subject: [PATCH] Add notes about layer.conf
Date: Mon, 16 Oct 2023 13:06:07 +0100
Message-Id: <20231016120607.3054101-1-bhstalel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Oct 2023 12:06:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4375

Remove the second note in the previous PATCH as it's not accurate and can cause confusion.

As discussed before with Richard Purdie, the code supports this but the documentation is not.
Developers in general will not notice this or focus on it because they do not mess with the
layer.conf template file, but in my opinion I think more details can help.

Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
---
 documentation/dev-manual/layers.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index 2d809562d..070d82ee3 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -128,6 +128,16 @@ Follow these general steps to create your layer without using tools:
       variable is a good way to indicate if your particular layer is
       current.
 
+
+   .. note::
+
+      A layer does not have to contain only recipes `.bb` or append files `.bbappend`.
+      Generally, developers create layers using `bitbake-layers create-layer`, see
+      ":ref:`dev-manual/layers:creating a general layer using the \`\`bitbake-layers\`\` script`", that
+      creates the `layer.conf` file from a template located in `meta/lib/bblayers/templates/layer.conf`.
+      In fact, all the variables set in `layer.conf` are not mandatory except for the precense of
+      :term:`BBFILE_COLLECTIONS` will lead to the obligation of :term:`LAYERSERIES_COMPAT`, and :term:`BBFILE_PATTERN`.
+
 #. *Add Content:* Depending on the type of layer, add the content. If
    the layer adds support for a machine, add the machine configuration
    in a ``conf/machine/`` file within the layer. If the layer adds
-- 
2.25.1


