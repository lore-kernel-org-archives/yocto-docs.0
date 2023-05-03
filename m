Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC90C77B75
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 14:55:50 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.21666.1683125747831406442
 for <docs@lists.yoctoproject.org>;
 Wed, 03 May 2023 07:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=J3PFGU1e;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-306281edf15so4567404f8f.1
        for <docs@lists.yoctoproject.org>; Wed, 03 May 2023 07:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683125746; x=1685717746;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RB8iX1+7848X/vInV2wGRwXs1eZn0pWkXfYrKM5Bgyg=;
        b=J3PFGU1e/uxo7OHRaiBFZMiK5QuXrtGTUbuuywAt5vHIsQk/JCc3AxB5oJICn7RlmL
         mMdzrkU7WfgdgVvcvG31OP5BaSxJPWFV6IvWxIiEUXkstsY28h11vYYmUKPKEppoMDLe
         fIcnriPmZYcYgCTFFBQhL/+fiFeNcrhz2UGlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683125746; x=1685717746;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RB8iX1+7848X/vInV2wGRwXs1eZn0pWkXfYrKM5Bgyg=;
        b=cFtEmltMhJ3SXcj6JOySZ+rQ45lsZaeNreKJK1Z5iMmLtRXNKuL08uZLId+1x+BAz5
         LkA8P2BjYkT3CdLMGPD+iUSx1HeCpzJeE/WzRc5xt36NkgM79xKcA0eYp+D/T4zuvqtg
         +yXUUQXI7uhUyKGlaIliyIAahJ58jeLBkhSH0f4yylObcVH1Lld0Yu8yOzsOApTzZz1d
         8OhetvbrNIIJFOUGosgvYvg7zL0GaUK8Fr9pTIrVWdhG84Wiq4ewvVj2XUjjZF7SSYHS
         MY6wK97byuGaOSb7js7xaIxueekXb0qtwbXaBo2k3AiduBw+KBsJ6IrUf/mXYi0CD5Cy
         KyVg==
X-Gm-Message-State: AC+VfDzjqS2uFTa2LKIqjaOesAxTD48eqSZ6hH9obFFWTuMCSIb7kWzc
	q6leZkfVEzW5H4y4YDxyoCZd7IPx/5Dl7g1eXP7KAw==
X-Google-Smtp-Source: ACHHUZ4txc/Z018WPkbTWr+BkkfbAdDyoY/OKF4DeaYvYncz5Vf16mV5LkK5ShYNqeQFmY3dPw3gVA==
X-Received: by 2002:a5d:595d:0:b0:306:44a9:76a0 with SMTP id e29-20020a5d595d000000b0030644a976a0mr277575wri.9.1683125745914;
        Wed, 03 May 2023 07:55:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7d60:21e0:c1e5:ef4b? ([2001:8b0:aba:5f3c:7d60:21e0:c1e5:ef4b])
        by smtp.gmail.com with ESMTPSA id v3-20020adfedc3000000b003062c0ef959sm9228871wro.69.2023.05.03.07.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 07:55:45 -0700 (PDT)
Message-ID: <d7788bbd4dba10c004fa56f0f4160f6c46bfd6f6.camel@linuxfoundation.org>
Subject: Start of 4.3 migration guide docs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs <docs@lists.yoctoproject.org>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Date: Wed, 03 May 2023 15:55:44 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 May 2023 14:55:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3901

As mentioned on the weekly tech call, we need to get better about
documenting changes for the migration guide and release notes as we go
along. Whilst we're not far into 4.3, I realise I made or merged
changes already which will need notes. Since we don't have a guide yet,
let me note them here on the basis Michael will inject them into a new
doc.


* The '-crosssdk' suffix and any MLPREFIX were removed from virtual/XXX
provider/dependencies where a PREFIX was used as well as we don't need
both and it made automated dependency rewriting unnecessarily complex.
In general this only affects internal toolchain dependencies so isn't
end user visible.

* runtime testing of ptest now fails if no test results are returned by
any given ptest.

* the bitbake cooker log now contains notes when the caches are
invalidated which is useful for memory resident bitbake debugging.

* glide was dropped as "go mod" has become the standard


Cheers,

Richard




