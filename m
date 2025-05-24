Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31837C54ED1
	for <webhook@archiver.kernel.org>; Sat, 24 May 2025 01:10:50 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.1719.1748049040842207107
 for <docs@lists.yoctoproject.org>;
 Fri, 23 May 2025 18:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=liySN4K4;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c5e39d1e0eso39534085a.1
        for <docs@lists.yoctoproject.org>; Fri, 23 May 2025 18:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748049039; x=1748653839; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=f+U0j7R/5YOhelDs/USCZlNE+xd6hayQzCRISpHz/lk=;
        b=liySN4K40ADdC/wxiz2hnNnr2iGqYz1L4OVNusWHhdWQ/T7hOhxivmvwxBpEdGHQLD
         /NzUxJ63E2fPRVLLgLHpoT9cnmNx0Qnvlsu/+ABqKut/xSRHqX9NVGwTd9kCASirlBQT
         GB+hLhf3j/SNbbftBfLlTK0+VUyiegbpysF+vSVzb78Tw+6V/aPnfv0jz/euUSnxn/tq
         AGRz59WPw9seS9atksXHCeO3IWr5Pwf5wvOYY7NVlJn+jQr5JYZLKra9p97ORApy7HsA
         eJEJ7D/lruBoxHMEghSfsXoKhkd2ZFXbFM/HZnVrYcxbdYuNbtdHytMVTl7yC93rl9sv
         gbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748049039; x=1748653839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f+U0j7R/5YOhelDs/USCZlNE+xd6hayQzCRISpHz/lk=;
        b=eQW7djfoqpuRVUHuOFzeIfCz1cADbzQtql1HEnhWk8cQpBHgLUjx4KJkC7Fz7/UHjq
         9nunqX2bSq5Ih8Q7C/1eiLEqh35T9k79dxXADm9YIUIVmrYbsu8C1PUhYjcgI1iJIrE+
         JE/62XgFxoOhbCbAS3CQiFiDC6VQy87fm+qtpfIKdAOjKwv7acsVetVELlQTPEiWDbL+
         X/0hNbqj8MgspYvHf96gtJCk/nlwoyeZWjmSUl+p063+X/evW0OLaS8fQrKXpCPnUit4
         nxfH6JYc//BCM0T8mwuFGvMQMzFwCikd+IlXrCSGmgbXqN3gj6B+Byi4qIDsPnyd5su6
         xsJA==
X-Gm-Message-State: AOJu0Yyr1sQ2uoj0sLLRzH9mky9FOiFW3wEz0EqWzzeg+Pegw8BOLBez
	bFwacYXUNwnMRMTuFvhCv8L3NEXG+DLXJMCG1WYnZpAofEPNdccoxjhR7SQwBg==
X-Gm-Gg: ASbGncvtb0ux0RzvrRrlPFCekEq9JEDnAVv4Mc4ZwY39xcxlb/JWFjDPRNNZv5WmfEr
	RQZ39Sz547PNTiv1muze+wRslr0g/9PpOFq0VDdmNHqBYj/VOuvmvEaKu5wE63prHnyd6Sh4gss
	eGpS54GMpZc9ogTbiAfk+1PJP0z/tzGJOPFkn7n825qAdaWyFTRA5FoTJp/ZUb9kkXZxqezuszX
	yFBvqP1cgouAy7GFKSMaFI8VAJpdQuIRcUySb9NH06pYuJcJb4teUrOAme5bahkBf8j7eTbTUyF
	tSkEEqy6D1Im26wZkzpe+U6mN8sZk5gK+sfKTB1+K8OW7og3OsHTjOXAQi6HJyfhXYXFrmAjod0
	H0O6TYOCWIarD+kaOf0g=
X-Google-Smtp-Source: AGHT+IGtzsUIE5Je+OmXUk2Znpn+9NMEeeJO/IX0DEW+kDWAqF/tWrzGf+w83D7xkEVwugLK31nvBw==
X-Received: by 2002:a05:620a:c46:b0:7c5:467f:d130 with SMTP id af79cd13be357-7ceecc26531mr223834785a.36.1748049039203;
        Fri, 23 May 2025 18:10:39 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467d8140sm1261220585a.37.2025.05.23.18.10.38
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 18:10:38 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH][scarthgap 1/3] sphinx-lint: trailing whitespace
Date: Fri, 23 May 2025 21:10:30 -0400
Message-ID: <20250524011032.19679-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 24 May 2025 01:10:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6893

Fix all instances of trailing-whitespace as reported by 'make sphinx-lint'.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/sdk-manual/extensible.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index d8d3858bfee2..a7546e728849 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -669,7 +669,7 @@ SDK or eSDK:
    ``devtool build``.
    It also allows to benefit from the very good integration that IDEs like
    VSCode offer for tools like CMake or GDB.
-   
+
    However, supporting many programming languages and multiple
    IDEs is quite an elaborate and constantly evolving thing. Support for IDEs
    is therefore implemented as plugins. Plugins can also be provided by
-- 
2.44.0.501.g19981daefd7c


