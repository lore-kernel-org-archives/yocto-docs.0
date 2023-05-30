Return-Path: <daniel.ammann@bytesatwork.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 540CEC77B7A
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 06:38:20 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.3951.1685428697090009315
 for <docs@lists.yoctoproject.org>;
 Mon, 29 May 2023 23:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bytesatwork-ch.20221208.gappssmtp.com header.s=20221208 header.b=I+ZANzPW;
 spf=pass (domain: bytesatwork.ch, ip: 209.85.208.177, mailfrom: daniel.ammann@bytesatwork.ch)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2af225e5b4bso42028381fa.3
        for <docs@lists.yoctoproject.org>; Mon, 29 May 2023 23:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20221208.gappssmtp.com; s=20221208; t=1685428695; x=1688020695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/N7SEfH1YGQ6jqrLG3bJ6HLh+avqAm9RWZmePKg7tPQ=;
        b=I+ZANzPW0Ll+n4nH3rkwkVJ+VTYSnthUJJKIpHncFXJH154igfaaHkapYJamsHjKeK
         wPecxv9UBSCq3bqJCwtsQaK5xKK21CeOxKva4Kk7yq3mDNnpXVKI99u2Y1dr3kOLELFo
         X8d4TmMQOxyP4DTVcKkuXph14oGqxqseujfgGin10FhaQSo3Ip7C1PIa1Udn3isDYGgh
         ZrISgp9T+XzzWrbWkdbXRcfDCV6lZiSE76uy4bj9O5ejnVFMibxeGxPqlDiN7GNQ0c+b
         dC/VLzSC5Xn3tpMiVaDd3kC4MYePWt7WvF6xm7RpwNQJOSBScJG1POUR9nOeTjByM6zK
         dMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685428695; x=1688020695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/N7SEfH1YGQ6jqrLG3bJ6HLh+avqAm9RWZmePKg7tPQ=;
        b=IMWS6Uk28x7zKblXgnFU1//sfz8UZAp16g+1GzRpDoVnKbuj3UmBrMtQ9GgWVpEZxO
         VwKRsiP3YFsXQj1wbe7LIDWINKyGOR+aGKG0Zru2Pj9OV4AbFb/I6TvpTxIe+Kb6UbYM
         HI5pGjzOhWqswF1fZWSiVQPSJJdvPFpTiHPSyQ/frs8yXfZt88qJgeSAymoYKpJgEnBB
         D4CGb8jkHZthd7yQ3Emk5fxq/FMCltP1fU5CO3QppmHQmxBAP+CpCx3FP5uE7+tS+V5n
         27No63fU9cK0PvTQWUztvWZ0a2n+Zxikh/9GhYDAgOvJ6iVK6rB7WThLIjqtixv9Si+o
         +YLQ==
X-Gm-Message-State: AC+VfDyO8pp5UKgYrEG5k2ei22zX3zJxnTg3mIq2n/ZyPRu9lAaHjBDE
	RdW1028ldg5LsQILKU94l0Hpa1K1vhP2Ka4rRNs=
X-Google-Smtp-Source: ACHHUZ6Ed/zb4as+CYux32mUTJMErWPrAW8tNT13zloHc8KrpH1WK5GUkBxfNFTfTkCjOEx7WMeNTQ==
X-Received: by 2002:a2e:9781:0:b0:2af:1622:a69 with SMTP id y1-20020a2e9781000000b002af16220a69mr263758lji.48.1685428694897;
        Mon, 29 May 2023 23:38:14 -0700 (PDT)
Received: from mimas.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id b7-20020aa7dc07000000b0051056dc47e0sm3933781edu.8.2023.05.29.23.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 23:38:14 -0700 (PDT)
From: Daniel Ammann <daniel.ammann@bytesatwork.ch>
To: docs@lists.yoctoproject.org
Subject: [PATCH] overview-manual: concepts.rst: Fix a typo
Date: Tue, 30 May 2023 08:37:51 +0200
Message-Id: <20230530063751.905344-1-daniel.ammann@bytesatwork.ch>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 30 May 2023 06:38:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3976

Signed-off-by: Daniel Ammann <daniel.ammann@bytesatwork.ch>
---
 documentation/overview-manual/concepts.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 6db515e50..668e00256 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1941,7 +1941,7 @@ Thanks to this, the depending tasks will keep a previously recorded
 task hash, and BitBake will be able to retrieve their output from
 the Shared State cache, instead of re-executing them. Similarly, the
 output of further downstream tasks can also be retrieved from Shared
-Shate.
+State.
 
 If the output hash is unknown, a new entry will be created on the Hash
 Equivalence server, matching the task hash to that output.
-- 
2.30.2


