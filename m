Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 283C0CDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 12:01:20 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.119041.1697457677037580119
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 05:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LicjUQGM;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: bhstalel@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-53b32dca0bfso9162263a12.0
        for <docs@lists.yoctoproject.org>; Mon, 16 Oct 2023 05:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697457675; x=1698062475; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2WIPIy6iuQ7mhVZI+cyWLWgZl2I0CF6ni7qFY8pbNBg=;
        b=LicjUQGMSFTcCYtmJSg4eUY0/C9ZtjKdXFDCuSGTZe6xTfjHhhbwP37BOrH4RQ7WqB
         kHI1QzphXZUM/ql7N5JMFlSNzNlCZs4VJdImjwZmndFV8l11neJDxI+RtMTsFMZXhMWt
         rjVbY15MIgyhUOPqxqCemv0TPs44AHqNxCHwRHJ3cxyumFqHWSclSIYtuSNTvyxbNaU2
         hDnC9Bs2IfVfWF4VobkjXeH2fygwdejUXu14mNYT/hbvMFv29plM2FLLBLBVlev6KIJM
         ajUgkQWezhfwBNRiPG46IS07ab2GX1IliVhWBLdAdVqtMMHXDdwOaTQphiq30F4p9a9K
         hA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697457675; x=1698062475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2WIPIy6iuQ7mhVZI+cyWLWgZl2I0CF6ni7qFY8pbNBg=;
        b=LLt14qCmwHwiVZCoL+pJeS5EiPGhRW0zqQl57lK1rAQ1D3p3Jrwv1s7Ov4r0BwvKkg
         AI2PzE37JVehjvqK+WH3lg2qPfoNVHnQVAPd3XlAuJpUXY1jFPh+eoJEQ7AoHbdZg3dr
         G8Mxt7p4c5vS2Al9zlIVYWOR5OlWmin51zwt/pJxaJXZvG4VrvTx4dDcSn5V66GeFd2J
         8XIFeQBzaELWTLPFciFEi4ie4SHoinU8tEqaTwSAkw2VDUYnW2msdppXNgrzLosm495j
         TqKg6H+AWdmDc/SGTSmWxCz6E3N59GbE9LwphbFzYiyb9YA/Yh94dTZcX0sgTpBLZ6pB
         iUvQ==
X-Gm-Message-State: AOJu0Yx4wpUqdr0voGNCnDUN90H3jpnsMj9jp/EfnwLf5q+vUZN801lM
	M6b0b38AOkvGec21DdNr7XuF7kOlJCc=
X-Google-Smtp-Source: AGHT+IFaVvbsQAA/FGhpdRms6gelYG+sHRvZ0j83ZnQ0KN0UtPGlc2K8fuhNTHn0k9fJZLcYRL4Mmw==
X-Received: by 2002:a05:6402:1e87:b0:530:8fdb:39c8 with SMTP id f7-20020a0564021e8700b005308fdb39c8mr6520703edf.15.1697457674919;
        Mon, 16 Oct 2023 05:01:14 -0700 (PDT)
Received: from talel.sofia.local ([193.95.99.58])
        by smtp.gmail.com with ESMTPSA id j18-20020a508a92000000b0053deb97e8e6sm7174424edj.28.2023.10.16.05.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 05:01:14 -0700 (PDT)
From: Talel BELHAJSALEM <bhstalel@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Talel BELHAJSALEM <bhstalel@gmail.com>
Subject: [PATCH] Add notes about layer.conf file
Date: Mon, 16 Oct 2023 13:00:58 +0100
Message-Id: <20231016120058.3053694-1-bhstalel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Oct 2023 12:01:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4374

As discussed before with Richard Purdie, the code supports this but the documentation is not.
Developers in general will not notice this or focus on it because they do not mess with the
layer.conf template file, but in my opinion I think more details can help.

Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
---
 documentation/dev-manual/layers.rst | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index 2d809562d..31cd21dac 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -128,6 +128,27 @@ Follow these general steps to create your layer without using tools:
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
+   .. note::
+
+      If you want to deviate from the regular `layer.conf` and specify the layer as top source for recipes
+      with::
+
+         BBFILES += "${LAYERDIR}"
+
+      then you need to keep all your recipes directly under the layer (example: `meta-example/recipe_0.1.bb`).
+      **IMPORTANT**: This is not recommended at all, but it is supported in the source code. Following
+      the same community convention is, always, the right way to go.
+
 #. *Add Content:* Depending on the type of layer, add the content. If
    the layer adds support for a machine, add the machine configuration
    in a ``conf/machine/`` file within the layer. If the layer adds
-- 
2.25.1


