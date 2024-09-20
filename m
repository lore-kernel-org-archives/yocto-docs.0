Return-Path: <simon.eu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C83EC7882C
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 11:38:29 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.15935.1726832307539441429
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Sep 2024 04:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NynHnkVZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: simon.eu@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c4226a56a8so2149112a12.2
        for <docs@lists.yoctoproject.org>; Fri, 20 Sep 2024 04:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726832305; x=1727437105; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mepI1EvQ3lYlIWg7ce+7aoKTY3bWi7YPZEUKXVzpLw=;
        b=NynHnkVZ4vLkEVFtpNBBJsMaP9iIsw27IBckUbC81xd6AqtpnaTUJSHMjkCKKQvcBV
         D8LzCeKod3O8Msn81eMi9kP/AMgpxjV7syMYehjCAsd5mmxdXv6KGWFtDtdN/4LKN/6i
         ct/CSwXLzkEG5WgWQOhD8Y3NE+N9pAd9DBOEh2HUk8z5b7g8WlN6vVMrTWh855M0RR1O
         S+jVKrfpcx/Wo8tZCXW1YKR30c3WCorpOJz7D4UXHxHfpseRUqvKIHOqhIkh5slawi5p
         ehVHB65QdN7opODqyHNFe+vndmvSuZ3X0UErv5xOrIdvQbDsERGtFRkgXiSMhy5VakCX
         y+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726832305; x=1727437105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0mepI1EvQ3lYlIWg7ce+7aoKTY3bWi7YPZEUKXVzpLw=;
        b=ZVAYWi9QGuUdmgEcFtib5Y72HtUFUzyE7/MuubzDGhtTUcx24Dof32KzFmd7jcI/oA
         og6SO9f8AWgQpgFVHkTufI25g5mc6ChaBvuth7yBRe1mwwGWSd7ZkUwHnRsDHjMqaP/J
         zO7DaV4BRfTh+ozGgCddAvIpQyYIAys40QFz4o/8NcKDiV9dhPhimBEiaBKE/SNKoXjz
         W+ACJjkq/JmsGNgeYzw/vTfSVRS4/bdYg4GJ59LDnrHEw+QwxbG7JZ/9h1F0STalgtme
         LY3TekKUuQxn2ozt1udzIbr4cTBavjCV+ZOHcF9580YkJpSWAyPrAKGHFBiUrtxHT/zN
         T0Wg==
X-Gm-Message-State: AOJu0YyAj7tN398aLiALeMUrgMt1OM3an2WQVQpCg4HXRZVC0WfbhI6A
	Ppf5vYR6+k2oMIyhBjkpexANnckxkAtsq1Tv4SjVAs1mXE3vEt8+RlM1aA==
X-Google-Smtp-Source: AGHT+IFNZWuwPdKmRS9Y4mCi8rpY/6HNVUC77u3RdBB2W4fjmGQgEHkSjZmu+uMlSZo9GaO3RK9wkw==
X-Received: by 2002:a17:907:97c1:b0:a90:d1e1:eed0 with SMTP id a640c23a62f3a-a90d4fc8432mr217549866b.9.1726832305145;
        Fri, 20 Sep 2024 04:38:25 -0700 (PDT)
Received: from simon-T14-4TB.. ([46.140.188.244])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a90613304dasm833813366b.197.2024.09.20.04.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 04:38:24 -0700 (PDT)
From: "Simon A. Eugster" <simon.eu@gmail.com>
To: docs@lists.yoctoproject.org
Cc: "Simon A. Eugster" <simon.eu@gmail.com>
Subject: [PATCH 1/1] bitbake: doc: suffix for BBFILE_PRIORITY
Date: Fri, 20 Sep 2024 13:38:18 +0200
Message-ID: <20240920113819.2845816-2-simon.eu@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240920113819.2845816-1-simon.eu@gmail.com>
References: <20240920113819.2845816-1-simon.eu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Sep 2024 11:38:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5359

Signed-off-by: Simon A. Eugster <simon.eu@gmail.com>
---
 .../bitbake-user-manual-ref-variables.rst                   | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/bitbake/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst b/bitbake/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
index 899e584f91..c203531f51 100644
--- a/bitbake/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
+++ b/bitbake/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst
@@ -766,6 +766,10 @@ overview of their function and contents.
    :term:`BBFILE_PRIORITY`
       Assigns the priority for recipe files in each layer.
 
+      This variable is used in the ``conf/layer.conf`` file and must be
+      suffixed with a `_` followed by the name of the specific layer (e.g.
+      ``BBFILE_PRIORITY_emenlow``). Colon as separator is not supported.
+
       This variable is useful in situations where the same recipe appears
       in more than one layer. Setting this variable allows you to
       prioritize a layer against other layers that contain the same recipe
@@ -780,7 +784,7 @@ overview of their function and contents.
       higher precedence. For example, the value 6 has a higher precedence
       than the value 5. If not specified, the :term:`BBFILE_PRIORITY` variable
       is set based on layer dependencies (see the :term:`LAYERDEPENDS` variable
-      for more information. The default priority, if unspecified for a
+      for more information). The default priority, if unspecified for a
       layer with no dependencies, is the lowest defined priority + 1 (or 1
       if no priorities are defined).
 
-- 
2.43.0


