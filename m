Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ECDBCCF9E0
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 08:45:09 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.5589.1761295502990710080
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 01:45:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=t5Bzherl;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42420c7de22so845524f8f.1
        for <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 01:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1761295501; x=1761900301; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vE4fQ5P0Tv0j56FHadrz0+2/PBqyi10SD7RuGaYKdE=;
        b=t5BzherlmmwoQWII8xBfzzn7fLMAG7DQ2bulrknwUjOMFs3VUkcKYkJa9+qeAUfgEz
         khR5M7q94GxQsBK9IE3qouJ2DLeiq+stpCkWrm4y4C5fMjtzvvgrPFmC4DH1dnOFC8aX
         rSfwFdX0E38o02GosmOAAAqY1TMf0jE3G307g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761295501; x=1761900301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vE4fQ5P0Tv0j56FHadrz0+2/PBqyi10SD7RuGaYKdE=;
        b=Aqsf8Tu2wftwz7Lu2bLQXtzk/+ChtBCOW7RWGDHkVQKjV/UuLq4qZN1C2LJ89ezAHg
         BQ33KneYnQDr9UZH2FDhRSCotYHb38+cb8vovGCyfNuNYsLsuYlShb8rtyFE3DW7lSZP
         dGWDINeKQuUjL0xT0hS0E6FxuPSPErTU8wvVRG7JdeBTMpNp/IJNrqVYBg+Czw2ePXcz
         QAamVJ++SsJ7D2gJDr7KZtTHMRQ9+px8djSf7lZFND8CjwRpzAQgyUWEtB+7fOIzPw6D
         tEl29Jx7uAi7sjcxGauZV/eTMDDuJT/7Il7KerBr5/J82YyuzPEmAttvWnLbRPlFc2Mj
         mEfQ==
X-Gm-Message-State: AOJu0YxyrxI3YvEcEO3zdtfQu6Q/OXIIFFR5JhffLbRurTLdTmp5uCOa
	wMmpXkSHB7r+H6MKH3AeZ0rCrLrd9vEXYslW+jx+AhXNpELQLgdz74RczyxFsCZHyww0ychdtfk
	kZqk/
X-Gm-Gg: ASbGncv2H0Ek3pyuNNxLKqwZdQg1B5Xod31VZOm45KLp7N0UD2W5JLpIbfW4bGwpHga
	FML2ml9j+5bfzaaJ9s3Y1VVw/TL7Ts+ze0FSlzBGGoAwx3agpUL30D198Djr1qGYfKeTW7XRsyK
	JTtAKhn1BZqkc4szCmrItvGvZb6Jrlo029PZAZIVtIdRIlg4nTj6SdAqwO3sBgoma+RadBsXu14
	Fz/UUoJpolR78nwNR9GrJq+T67Z30NTUeW89PadIJ0/jU3zG4dc3QxBBv6eM+5CgFweSg3Tz5OF
	dLgK4Wz2OLgvCy7c/YNsH7Hfns175WAfmxtje4z1IAaAGYmVAB1oYGqb7Z6x89LO0tMpzZ2vaOr
	SLrfQt6MXi9JmFK4MS4jfwSwRxCz9/LZ+ppvqoKUQd7pELRmvbdvMd4KYir//+v9ElnUsHfiAOx
	/Ht/kN/SKtR1c7Q8ZiVoTyFbBrQa4CcNqFES8J5UKvs6feE7WLwZ41X5TRcPlTbSZDfl4KmMDqX
	GaOM4S05y9gAYyYSw==
X-Google-Smtp-Source: AGHT+IHN9Fbcu89n9//5WTPOm5fAVy6NFxfDPPXAqXNpXA2RVgG1o72gcz6HtwnZxzYadwvbq5BoMQ==
X-Received: by 2002:a5d:5d0a:0:b0:3e9:3b91:e846 with SMTP id ffacd0b85a97d-42704d1471bmr18673499f8f.10.1761295501421;
        Fri, 24 Oct 2025 01:45:01 -0700 (PDT)
Received: from FRSMI24-BLUE.home (2a01cb000301bd0006147b1ba480ee12.ipv6.abo.wanadoo.fr. [2a01:cb00:301:bd00:614:7b1b:a480:ee12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429897e74cdsm8178782f8f.9.2025.10.24.01.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 01:45:01 -0700 (PDT)
From: pierre-loup.gosse@smile.fr
To: docs@lists.yoctoproject.org
Cc: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
Subject: [PATCH v3 2/2] migration-guides/release-notes-5.3.rst: new wic extra_partition plugin
Date: Fri, 24 Oct 2025 10:44:46 +0200
Message-Id: <20251024084446.1109145-2-pierre-loup.gosse@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251024084446.1109145-1-pierre-loup.gosse@smile.fr>
References: <20251024084446.1109145-1-pierre-loup.gosse@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:45:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7808

From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>

Added by commit 3892912bd7e0 ("wic: extra partition plugin") in OE-Core.

Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
---
 documentation/migration-guides/release-notes-5.3.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.3.rst b/documentation/migration-guides/release-notes-5.3.rst
index 417087e35..335302edb 100644
--- a/documentation/migration-guides/release-notes-5.3.rst
+++ b/documentation/migration-guides/release-notes-5.3.rst
@@ -390,6 +390,9 @@ New Features / Enhancements in |yocto-ver|
    - Add the Wic-specific option ``--extra-partiton-space`` to add extra empty
      space after the space filled by the filesystem in the partition.
 
+   - Add the Wic plugin ``extra_partition`` to install files from the
+     :term:`DEPLOY_DIR_IMAGE` directory into an extra non-rootfs partition.
+
 -  SDK-related changes:
 
    -  Include additional information about Meson setting in the SDK environment
-- 
2.34.1


