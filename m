Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBBF1EB64DB
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 14:01:06 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.11150.1687269656684430456
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Jun 2023 07:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=ACA9ujOI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-312826ffedbso493916f8f.0
        for <docs@lists.yoctoproject.org>; Tue, 20 Jun 2023 07:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687269655; x=1689861655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zXeOG8r7GTXxe2EfqaTjfcB3Yk+8RbDtHQBfqM7sVEI=;
        b=ACA9ujOIgvpfke+vQMghYnonIRtmxaTxKhLb5KZiaQ3BwK8buYqJ9Ea9jSvb9YeTyV
         FP6onSpOcDhWm9iljb/3F491eJaSwqJjM4GdRaNxWWU3V5vDN4v0V9xebZjER0/Q4tHZ
         QxTbClbISEAYZ476n2uqi4nqp7z7hckK7uBl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687269655; x=1689861655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zXeOG8r7GTXxe2EfqaTjfcB3Yk+8RbDtHQBfqM7sVEI=;
        b=JRTs6MfGXrtJ15ydBdpHPrtA05M8Ghev7bgnp7TqczGXutQ8J0cEjkt6dkVW4uyEtJ
         ZtZjn6uJi7fNHOSVIluxb2SK6hC9Oe+RvI6AmiWE0nbtkIclwKtIS7LjAls+Il0R+oqx
         6m7hafBL0ikVhOsAHGr4jb6GeYPKx7WsEajPNGaxceIS07TgNZYKTsu7kLD1Hgm8Kqjv
         wJHPidxo8hqtN3Y5scJeWZMzrLh+s+UYKA8aNl/t14p9zi6NPoJDdLWj0otRXolWNdpz
         keJiRX+kXS+30/QSr57z7LPY6BRtwFXWDNXvFqbdSf42NHjK4iXh0SmWqBefrgB+K+Pl
         QdEg==
X-Gm-Message-State: AC+VfDxar1+5HELLWEkdcH9NZgqlzYh+1ewm65RFsZxzShP06bPTNht8
	vVgqgBsb60cvEHDaGb4aHF3GJbdJvwillq7SJ/4=
X-Google-Smtp-Source: ACHHUZ7dvuaY0kBh24os1YTkLyOiaBU6PwtRhSTqFRj5/ciCTFAK+W80uebIvuiaWmTodMlh1b49Fw==
X-Received: by 2002:a5d:6685:0:b0:30f:bc92:a537 with SMTP id l5-20020a5d6685000000b0030fbc92a537mr8249174wru.33.1687269655009;
        Tue, 20 Jun 2023 07:00:55 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:dcd0:3b81:1cae:b795])
        by smtp.gmail.com with ESMTPSA id s6-20020adfea86000000b0030ae3a6be5bsm2059307wrm.78.2023.06.20.07.00.54
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 07:00:54 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH 2/2] migration-guide: Add notes on systemd/usrmerge changes
Date: Tue, 20 Jun 2023 15:00:53 +0100
Message-Id: <20230620140053.2802542-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230620140053.2802542-1-richard.purdie@linuxfoundation.org>
References: <20230620140053.2802542-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Jun 2023 14:01:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4012

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/migration-guides/migration-4.3.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/migration-guides/migration-4.3.rst b/documentation/migration-guides/migration-4.3.rst
index e72967bf3..74cc6354c 100644
--- a/documentation/migration-guides/migration-4.3.rst
+++ b/documentation/migration-guides/migration-4.3.rst
@@ -55,6 +55,13 @@ Go language changes
 -  Support for the Glide package manager has been removed, as ``go mod``
    has become the standard.
 
+Systemd changes
+~~~~~~~~~~~~~~~
+
+Upstream systemd is now more strict on filesystem layout and the usrmerge
+feature is therefore required alongside systemd. The Poky test configurations
+have been updated accordingly for systemd.
+
 .. _migration-4.3-recipe-changes:
 
 Recipe changes
-- 
2.39.2


