Return-Path: <wafgo01@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E3D3CA5FCE
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 07:23:52 +0000 (UTC)
Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14636.1791185030894198015
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Oct 2026 00:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DzgSvBe9;
 spf=pass (domain: gmail.com, ip: 74.125.228.96, mailfrom: wafgo01@gmail.com)
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6af7d702c76so1811881a12.1
        for <docs@lists.yoctoproject.org>; Mon, 05 Oct 2026 00:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791185029; x=1791789829; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K+UFCo4u+qQufr/mp6m4MaU9HQ8v8snWHRV5U7JtBvw=;
        b=DzgSvBe9aQMdRT50s+SK3x6z0YU+2J2GlZHF7jc22yoIwOAC8c+4JHc6yWTplOLZdi
         I6KH6SpwL4L9K/yOGtKVy0yNFQ8GeVz1bFSx0OmQmipWVAUn6ITVUnpar7RUhO9D9C2i
         +LkjnGWFBk7PxosogFP23lTQbQ5XVcZ0jfJwwWjc2rUcalREAMrzXOhuGgWzYHeZXf0c
         diq1yBpshh6R3T+c2LoeaR2iJxnf7qw7QuFYA1R4w4of8lkkVcLV+KJpVn5RRhiyNPzG
         y7Bq14tZhZ2IHF7QiRD+i20YjORF7jQ/oS3R4DqfvKRZRbUMzWcWIxDkLuphRQmnFBUN
         2wxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791185029; x=1791789829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K+UFCo4u+qQufr/mp6m4MaU9HQ8v8snWHRV5U7JtBvw=;
        b=lBfXUrB5nhm4xSdXCmg0rWDnDt8dEsGdzX3AItawowSoR8/LxE8m8vC75My0MAcZTH
         8Ld0Lhv4WStNMJdYWYT2afSx0KUIlw6mEu31cc3KHSWWlQnbGpzQcWdNqgrlr3uoOk1f
         N2mHzhvUc4sOYBOQxQ3BZ/T+406ctdnZqwZCPvzMksK1XSwcZTl3G1XOCki7cF+npgSB
         SWMVRwpL1+iyY0tVyx/JQcEKIhtbd5AcC4sPTn4el3DnqbpT0CiPL6/R/4J49pPyzRb4
         VWDNA8V8awTeusD5JRgv+j8msa3yz7/BEyzMMvoX0So2JxkDddFaX6LFUOJIuKh2qdJy
         JUBw==
X-Gm-Message-State: AFq9FYIdaQg5ogDGQMp7PgNm7vr3yQ6HGBOJOapit2KNwvtLt9KdldhY
	jumeP8DQwj3CIu0r87vfTOTnjJH+QEnH8UEdbtlYjYfOlgd05Lo0OLEoYLMcYiq5
X-Gm-Gg: AYBFou3dqk4B7mpn18xfRIJgyfIq6eFgrxtgva27K9/EVNvHuUYwXD/J6lLSk3pNAoK
	C/M8KnUGI0ZPTWRMQf+SJPWFXjUxJ52I9R2W6x1ZYztjffa7KIBpUhee0V4v29lYPY4ssO/E8Tu
	NN4T38HgwSLHuCqRUDXvhZESdpmLkQfWmG9NNI5tPh3E+E4LELzv8bCHnvCdfpfhipl2OXPBvNt
	05ORWJ1i0TZzGzZp/29fgRzGrCUL3eJTvsq4AQqiIfafjCF2zUFAKm1fpzlsVAPA7b9kgGtq3Me
	7/mHsPZpfpL/idrSa/+sk0e+scdLq+NAJtn6yxIquApZX+NZHJ35PZ+QBD51C3k1dnt3dNOQV8w
	gDgPgD2zKQ8ajGt4fAN386oYXudaq42vh2iQQmkP5jdF1T3nwVjsegFjJgEIixeZLSVixSMv0Mv
	aSj/fRHyt4z+v2amVvA+H3eP01Wt3ObdqhfpqVw8tvfExDX/EZqOiOU2x+Eygmboh0/ls4HJYZT
	Cxm4AwJGj4oCRQPjg==
X-Received: by 2002:a05:6402:1908:b0:6a9:9522:f87f with SMTP id 4fb4d7f45d1cf-6af9e320e56mr8304620a12.41.1791185028903;
        Mon, 05 Oct 2026 00:23:48 -0700 (PDT)
Received: from DE-PF5B95TD.clients.cmblu.de ([87.129.199.250])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm2963889a12.13.2026.10.05.00.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:23:47 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Wadim Mueller <wafgo01@gmail.com>
Subject: [PATCH] ref-manual/variables.rst: document versioned RPROVIDES
Date: Mon,  5 Oct 2026 09:23:44 +0200
Message-ID: <20261005072345.1383304-1-wafgo01@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 05 Oct 2026 07:23:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10653

RPROVIDES accepts the same "name (operator version)" syntax as
RDEPENDS: package_rpm parses it with bb.utils.explode_dep_versions2()
and writes "Provides: name = version" into the spec file. This lets a
package provide an interface level that other packages depend on with
">=", which an alias carrying the version in its name, such as the
existing "widget-abi-2" example, cannot express.

package_ipk and package_deb build their Provides field from
dict.fromkeys(explode_dep_versions2(RPROVIDES), []) and so drop the
version, which the documentation should say next to the syntax.

Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
---
 documentation/ref-manual/variables.rst | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 1c0864d87..b16a6272c 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8735,6 +8735,24 @@ system and gives an overview of their function and contents.
 
          RPROVIDES:${PN} = "widget-abi-2"
 
+      An alias can also carry a version, using the same syntax as
+      :term:`RDEPENDS` with the ``=`` operator::
+
+         RPROVIDES:${PN} = "widget-abi (= 2)"
+
+      Other packages can then depend on a range of versions of the alias,
+      which an alias with the version in its name cannot express::
+
+         RDEPENDS:${PN} = "widget-abi (>= 2)"
+
+      .. note::
+
+         Only the :ref:`ref-classes-package_rpm` class writes the version
+         into the package metadata. The :ref:`ref-classes-package_ipk` and
+         :ref:`ref-classes-package_deb` classes drop it and provide the bare
+         alias, so a versioned dependency on the alias cannot be relied upon
+         with those package formats.
+
    :term:`RRECOMMENDS`
       A list of packages that extends the usability of a package being
       built. The package being built does not depend on this list of
-- 
2.43.0


